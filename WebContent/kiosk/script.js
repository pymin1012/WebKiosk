var fns = {changeCart:'', addToCard:''}, productData = {id:'', img:'', decription:'', price:'', count: '', size: '', shot: '', whipping: ''}, productCounter = 0;

$(document).ready(
		function() {
			var cartCounter = 0, cartTotal = 0, timer = '';	

			fns.initData = function() {
				productData = {id:'', img:'', decription:'', price:'', count: '', size: '', shot: '', whipping: ''}, productCounter = 0;
			}

			fns.changeCart = function() {
				var counter = $('.cart-counter'), total = $('.cart-total').find('.product-price b');
				counter.text(cartCounter);
				total.text(cartTotal);
			}

			fns.addToCard = function() {
				var cartHtml = 
					"<article class='cart-product' data-cart-product-id='" + productData.id + "' data-cart-product-counter='" + productCounter + "' data-cart-product-price='" + productData.price + "' >\n"
					+ "<div class='row'>\n"
					+ "<div class='col-sm-12'>\n"
					+ "<div class='cart-product-info'><span class='product-decription'>" + productData.decription + "</span></div></div>\n"
					+ "<div class='col-sm-7'>\n"
					+ "<div class='cart-product-img p-2'><img src=" + productData.img + " alt='' style='width: 100%; height: auto;'></div>\n</div>\n"
					+ "<div class='col-sm-5 pl-3'>\n";
				if (productData.size != '') cartHtml += "<div class='cart-product-info'><span class='product-size'>" + productData.size + "</span></div>\n";
				if (productData.shot != '') cartHtml += "<div class='cart-product-info'><span class='product-shot'>" + productData.shot + " SHOT</span></div>\n";
				if (productData.whipping != '') cartHtml += "<div class='cart-product-info'><span class='product-whipping'>" + productData.whipping + "</span></div>\n";
				cartHtml += "<div class='cart-product-info'><span class='product-count'>" + productData.count + " 개</span></div></div></div>\n"
				+ "<div class='cart-product-footer d-flex justify-content-around'>\n"
				+ "<span class='product-price'><i class='fas fa-won-sign'></i>&nbsp;<b>" + productData.price + "</b></span>\n"
				+ "<button class='cart-product-delete btn btn-danger btn-sm'><i class='far fa-trash-alt'></i></button></div>\n";

				var pattern = cartHtml, cart = $('#cart'), cartProducts = cart.find('.cart-product'), cartItem;

				if (cartProducts.length > 0) {
					for (var i = 0; i < cartProducts.length; i++) {
						if (window.CP.shouldStopExecution(1)) { break; }
						if (i == cartProducts.length - 1) {
							$(pattern).insertBefore(cart.find('.cart-total'));
							cartProducts = cart.find('.cart-product');
							break;
						}
					}
					window.CP.exitedLoop(1);
				} else {
					$(pattern).insertBefore(cart.find('.cart-total'));
					cartProducts = cart.find('.cart-product');
				}

				cartCounter++;
				cartTotal += productData.price;
				fns.changeCart();
				fns.showCart(cart);
				fns.initData();
			}

			$(document).on('click', '.cart-product-delete', function(e){
				var $art = $(this).closest('.cart-product');
				var or_basket = $art.data('cart-product-counter');
				var price = $art.data('cart-product-price');

				$.ajax({
					type: "POST",
					url: "basketDeleteProc.jsp",
					data: 'or_basket=' + or_basket,
					success: function(res) {
						cartTotal -= price;
						cartCounter--;
						fns.changeCart();
						$art.remove();
						fns.showCart(cart);
					}
				});
			});

			$(document).on('click', '.order', function(e) {
				if (cartCounter != 0) {
					location.href = "payment.jsp";
				} else {
					alert('장바구니가 비어있습니다!');
				}
			});

			/* 장바구니 애니메이션 효과  */
			fns.hideCart = function(cart) {
				var width = cart.width();
				cart.animate({ 'right' : -width });
				setTimeout(function() {
					cart.removeAttr('class');
					cart.removeAttr('style');
					timer = '';
				}, 1000);
			}

			fns.cartTimer = function(cart) {
				timer = setTimeout(function() {
					fns.hideCart(cart)
				}, 3000);
			}

			fns.showCart = function(cart) {
				var show = cart.hasClass('show');
				if (show) {
					return false;
				} else {
					cart.addClass('show');
					cart.animate({ 'right' : 0 });
					if (timer == '') { fns.cartTimer(cart); }
				}
			}

			$('.modal-button').click(function() {
				var prod_num = $(this).data('product-id');
				$('#productModal').find('.modal-content').empty();
				$('#productModal').find('.modal-content').load('orderModal.jsp?prod_num=' + prod_num);
				$('#productModal').modal('show');
			});

			$('#productModal').on('show.bs.modal', function (e) {
				console.log(e);
				console.log(e.target);
				console.log(e.relatedTarget);
			});
		});