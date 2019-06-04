<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="kiosk.CategoryBean"%>
<%@page import="kiosk.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="pMgr" class="kiosk.ProductMgr" />
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	Vector<CategoryBean> vlist = pMgr.getCategoryList();
	
	LinkedHashMap<Integer, OrdersBean> blist = bMgr.getBasketList();
%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="sessionCheck.jsp" />

<title>상품주문</title>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" href="style.css" />

<script>
	var fns = {changeCart:'', addToCard:''}, productData = {id:'', img:'', decription:'', price:'', count: '', size: '', shot: '', whipping: ''}, productCounter = 0;
	
	function orderDetail(prod_num) {
		url = "orderDp.jsp?prod_num=" + prod_num;
		
		var popupX = (window.screen.width)/2 - 450;
		var popupY= (window.screen.height)/2 - 350;
		
        /* var rtnValue = window.showModalDialog(url, new Object(), "dialogWidth:900px; dialogHeight:700px; status:no; scrollbars:no; help:no; location:no; center:yes;"); */
 		window.open(url, "상품상세주문", "width=900, height=700, left=" + popupX + ", top=" + popupY + ", scrollbars=no");
 	}
</script>
</head>
<body>
	<div class="wrapper wbody">
	
		<section id="cart" class="overflow-auto">
			<span class="cart-title"><i class="fa fa-shopping-cart fa-fw"><span class="cart-counter">0</span></i>Cart</span>
			<article class="cart-total text-right">
				<span class="product-price"><i class='fas fa-won-sign'></i>&nbsp;<b>0</b></span>
				<button class="button order">Order</button>
			</article>
			<div class="close">
				<i class="fa fa-times fa-fw"></i>
			</div>
		</section>
	
		<section id="tabs">
			<div class="container main-container">
				<jsp:include page="../member/logout.jsp" />
			
				<div class="row">
					<div class="title col-md-12 ">
						<div class="row">
							<div class="col-md-3"><div class="section-title-img">
								<img src="../pic/logo.png" class="brand_logo" alt="Logo" style="width: auto; height:140px;">
							</div></div>
							<div class="col-md-9 pl-5"><h6 class="section-title">Blue Bubble</h6></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 ">
						<nav>
							<div class="nav nav-tabs nav-fill rounded" id="nav-tab" role="tablist">
								<a class="nav-item nav-link active" id="nav-hot-tab" data-toggle="tab" href="#nav-hot" role="tab" aria-controls="nav-hot" aria-selected="true" style="color: red"><i class="fab fa-hotjar"></i>&nbsp;HOT</a>
								<a class="nav-item nav-link" id="nav-COFFEE-tab" data-toggle="tab" href="#nav-COFFEE" role="tab" aria-controls="nav-COFFEE" aria-selected="false">COFFEE</a>
								<a class="nav-item nav-link" id="nav-ADE-tab" data-toggle="tab" href="#nav-ADE" role="tab" aria-controls="nav-ADE" aria-selected="false">ADE</a>
								<a class="nav-item nav-link" id="nav-TEA-tab" data-toggle="tab" href="#nav-TEA" role="tab" aria-controls="nav-TEA" aria-selected="false">TEA</a>
								<a class="nav-item nav-link" id="nav-DESERT-tab" data-toggle="tab" href="#nav-DESERT" role="tab" aria-controls="nav-DESERT" aria-selected="false">DESERT</a>
							</div>
						</nav>

						<div class="cbody text-center">
							<div class="tab-content px-sm-0" id="nav-tabContent">

								<div class="tab-pane fade show active" id="nav-hot"
									role="tabpanel" aria-labelledby="nav-hot-tab">
									<div class="wrapper">
									<div class="container">
										<section id="catalog">
											<div class="row">
<%
	Vector<ProductBean> v = pMgr.getEventProductList();
	for (int i=0; i<v.size(); i++) {
		ProductBean bean = v.get(i);
		int ev_price = pMgr.getEventProductPrice(bean.getProd_num());
%>
												<div class="items col-md-3">
													<a href="#" class="modal-button items-link" data-target="#productModal" data-product-id="<%= bean.getProd_num()%>">
													<article class="product mt-3 mb-3">
														<div class="product-wrapper">
															<div class="product-img p-3">
<% 
	if (bean.getProd_iimg() != null) {
%>
																<img src="../menu_pic/<%= bean.getProd_iimg() %>" style="width: 100%; height: auto;" alt="">
<%
	} else {
%>
																<img src="../menu_pic/<%= bean.getProd_img() %>" style="width: 100%; height: auto;" alt="">
<% 
	}
%>
															</div>
															<div class="product-info">
																<span class="product-decription"><%= bean.getProd_name() %></span>
																<div class="product-footer">
																	<span class="product-price"><small style="text-decoration:line-through; color: red;"><%= bean.getProd_price() %></small>&nbsp;<%= ev_price  %> 원</span>
																</div>
															</div>
														</div>
													</article>
													</a>
												</div>
												<%
	}
%>
											</div>
										</section>
										</div>
									</div>
								</div>
								<%
	for (int i=0; i<vlist.size(); i++) {
		CategoryBean cbean = vlist.get(i);
%>
								<div class="tab-pane fade" id="nav-<%=cbean.getCtg_name() %>"
									role="tabpanel"
									aria-labelledby="nav-<%= cbean.getCtg_name() %>-tab">
									<div class="wrapper">
										<div class="container">
										<section id="catalog">
											<div class="row">
												<%
		Vector<ProductBean> pvlist = pMgr.getProductList(cbean.getCtg_num());
		for (int j=0; j<pvlist.size(); j++) {
			ProductBean pbean = pvlist.get(j);
			int prod_num = pbean.getProd_num();
			boolean isEvent = pMgr.isEventProduct(prod_num);
%>
												<div class="items col-md-3">
													<a href="#" class="modal-button items-link" data-target="#productModal" data-product-id="<%= pbean.getProd_num()%>">
													<article class="product mt-3 mb-3" data-product-id="<%= prod_num %>">
														<div class="product-wrapper">
															<div class="product-img p-3">
<% 
			if (pbean.getProd_iimg() != null) {
%>
																<img src="../menu_pic/<%= pbean.getProd_iimg() %>" style="width: 100%; height: auto;" alt="">
<%
			} else {
%>
																<img src="../menu_pic/<%= pbean.getProd_img() %>" style="width: 100%; height: auto;" alt="">
<% 
			}
%>															</div>
															<div class="product-info">
																<span class="product-decription"><%= pbean.getProd_name() %></span>
																<div class="product-footer">
<% 
			if (isEvent) {
				int ev_price = pMgr.getEventProductPrice(prod_num);
%>
																	<span class="product-price"><small style="text-decoration:line-through; color: red;"><%= pbean.getProd_price() %></small>&nbsp;<%= ev_price  %> 원</span>
<%
			} else {
%>												
																	<span class="product-price"><%= pbean.getProd_price() %> 원</span>
<% 
			}
%>
																</div>
															</div>
														</div>
													</article>
													</a>
												</div>
												<%
		}
%>
											</div>
										</section>
										</div>
									</div>
								</div>
								<%
	}
%>
							</div>
						</div>
					</div>
				</div>
			</div>
  		</section>
  		
<!-- modal 창 -->
		<div class="modal" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
			<div class="modal-dialog mx-auto my-auto">
				<div class="modal-content">
				</div>
			</div>
		</div>
	</div>
	


	<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<script>	
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
				        location.replace("payment.jsp");
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
				
				/* 새로고침시 장바구니 불러오기 */
				(function () {
					<%
						for(int key: blist.keySet()) {
							OrdersBean obean = blist.get(key);
							int prod_num = obean.getProd_num();
							ProductBean pbean = pMgr.getProduct(prod_num);
							int ctg_num = pbean.getCtg_num();
							String prod_img = "";
							if (obean.getOr_hi() != null && obean.getOr_hi().equals("ICE")) prod_img = pbean.getProd_iimg();
							else prod_img = pbean.getProd_img();
							
							boolean isEvent = pMgr.isEventProduct(prod_num);
							int prod_price = 0;
							int or_shot = obean.getOr_shot();
							String or_size = obean.getOr_size();
							int size_price = 0;
							if (or_size != null && or_size.equals("G")) size_price = 500;
							else if (or_size != null && or_size.equals("V")) size_price = 1000;
							if (isEvent)  prod_price = pMgr.getEventProductPrice(prod_num) + or_shot * 500 + size_price;
							else prod_price = pbean.getProd_price() + or_shot * 500 + size_price;
					%>
										productData.img = '../menu_pic/<%= prod_img %>';
										productData.id = '<%= obean.getProd_num() %>';
										productData.decription = '<%= pbean.getProd_name() %>';
										productData.count = <%= obean.getOr_count() %>;
										productData.price = <%= prod_price %> * productData.count;
										console.log(productData.price);
					<%
							if (ctg_num != 4) {
					%>
										productData.size = '<%= or_size %>';
					<%
							}
							if (ctg_num == 1) {
					%>
										productData.shot = <%= or_shot %>;
										productData.whipping = '<%= obean.isOr_whip()?"휘핑 추가":"휘핑 없음" %>';
					<%
							}
					%>
										productCounter = <%= key %>;
										fns.addToCard();
					<%
						}
					%>
				})();
			});
	</script>
</body>
</html>