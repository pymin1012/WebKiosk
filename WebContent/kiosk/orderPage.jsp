<%@page import="kiosk.CategoryBean"%>
<%@page import="kiosk.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="pMgr" class="kiosk.ProductMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	Vector<CategoryBean> vlist = pMgr.getCategoryList();
%>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<link rel="stylesheet" href="style.css" />
<title>상품주문</title>
</head>
<body>
	<div class="wrapper">
		<section id="cart">
			<span class="cart-title"><i class="fa fa-shopping-cart fa-fw"><span class="cart-counter">0</span></i>Cart</span>
			<article class="cart-total">
				<span class="product-price"><i class="fa fa-rub fa-fw"></i><b>0</b>-</span>
				<button class="button order">Order</button>
			</article>
			<div class="close">
				<i class="fa fa-times fa-fw"></i>
			</div>
		</section>
	
		<section id="tabs">
			<div class="container">
				<h6 class="section-title">Blue Bubble</h6>
				<div class="row">
					<div class="col-md-12 ">
						<nav>
							<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
								<a class="nav-item nav-link active" id="nav-hot-tab" data-toggle="tab" href="#nav-hot" role="tab" aria-controls="nav-hot" aria-selected="true">HOT</a>
								<a class="nav-item nav-link" id="nav-COFFEE-tab" data-toggle="tab" href="#nav-COFFEE" role="tab" aria-controls="nav-COFFEE" aria-selected="false">COFFEE</a>
								<a class="nav-item nav-link" id="nav-ADE-tab" data-toggle="tab" href="#nav-ADE" role="tab" aria-controls="nav-ADE" aria-selected="false">ADE</a>
								<a class="nav-item nav-link" id="nav-TEA-tab" data-toggle="tab" href="#nav-TEA" role="tab" aria-controls="nav-TEA" aria-selected="false">TEA</a>
								<a class="nav-item nav-link" id="nav-DESERT-tab" data-toggle="tab" href="#nav-DESERT" role="tab" aria-controls="nav-DESERT" aria-selected="false">DESERT</a>
							</div>
						</nav>

						<div class="text-center">
							<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">

								<div class="tab-pane fade show active" id="nav-hot"
									role="tabpanel" aria-labelledby="nav-hot-tab">
									<div class="wrapper">
										<section id="catalog">
											<div class="row">
<%
	Vector<ProductBean> v = pMgr.getProductList(1);
	for (int i=0; i<v.size(); i++) {
		ProductBean bean = v.get(i);
%>
												<div class="items col-md-3">
													<article class="product"
														data-product-id="<%= bean.getProd_num() %>">
														<div class="product-wrapper">
															<div class="product-img">
																<a href=""><img
																	src="../pic/<%= bean.getProd_img() %>"
																	style="width: 100%; height: auto;" alt=""></a>
															</div>
															<div class="product-info">
																<span class="product-decription"><%= bean.getProd_name() %></span>
																<div class="product-footer">
																	<span class="product-price"><%= bean.getProd_price() %>
																		원</span>
																</div>
															</div>
														</div>
													</article>
												</div>
												<%
	}
%>
											</div>
										</section>
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
										<section id="catalog">
											<div class="row">
												<%
		Vector<ProductBean> pvlist = pMgr.getProductList(cbean.getCtg_num());
		for (int j=0; j<pvlist.size(); j++) {
			ProductBean pbean = pvlist.get(j);
%>
												<div class="items col-md-3">
													<article class="product" data-product-id="<%= pbean.getProd_num() %>">
														<div class="product-wrapper">
															<div class="product-img">
																<a class="add-cart"><img src="../pic/<%= pbean.getProd_img() %>" style="width: 100%; height: auto;" alt=""></a>
															</div>
															<div class="product-info">
																<span class="product-decription"><%= pbean.getProd_name() %></span>
																<div class="product-footer">
																	<span class="product-price"><%= pbean.getProd_price() %> 원</span>
																</div>
															</div>
														</div>
													</article>
												</div>
												<%
		}
%>
											</div>
										</section>
									</div>
								</div>
								<%
	}
%>



								<!--
							<div class="col-md-3 col-centered">
								<div class="basket">
									<div class="basket-title">
										<span>장바구니</span>
									</div>
								
									<div class="thumbnail clearfix">
										<img src="../pic/ia.jpg" alt="ALT NAME" class="pull-left span2 clearfix" style="margin-right: 10px; max-width: 50%; height: auto;">
										<a href="http://bootsnipp.com/" class="btn btn-danger icon  pull-right"><i class="fa fa-trash" aria-hidden="true"></i></a>
									</div>
									
									<div class="thumbnail clearfix">
										<img src="../pic/ia.jpg" alt="ALT NAME" class="pull-left span2 clearfix" style="margin-right: 10px; max-width: 50%; height: auto;">
										<a href="http://bootsnipp.com/" class="btn btn-danger icon  pull-right"><i class="fa fa-trash" aria-hidden="true"></i></a>
									</div>
								</div>
							</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
  		</section>
	</div>

	<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script>
		$(document)
				.ready(
						function() {
							var fns = {}, productData = {}, cartCounter = 0, cartTotal = 0, productCounter = 1, timer = '', addCart = $('.add-cart'), deleteCart = $('.cart-product-delete');

							fns.getProductData = function(a) {
								var p = a.closest('.product');
								productData.id = p.data('product-id');
								productData.id = parseInt(productData.id);
								productData.img = p.find('.product-img img').attr('src');
								productData.brand = p.find('.product-brand').text();
								productData.decription = p.find('.product-decription').text();
								productData.volume = p.find('.product-volume').text();
								productData.price = p.find('.product-price').text();
								productData.price = parseInt(productData.price);
							}

							fns.changeCart = function() {
								var counter = $('.cart-counter'), total = $('.cart-total').find('.product-price b');
								counter.text(cartCounter);
								total.text(cartTotal);
							}

							fns.hideCart = function(cart) {
								var width = cart.width();
								cart.animate({
									'right' : -width
								});
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
									cart.animate({
										'right' : 0
									});
									if (timer == '') {
										fns.cartTimer(cart);
									}
								}
							}

							fns.addToCard = function() {
								var pattern = "<article class='cart-product' data-cart-product-id='" + productData.id + "' data-cart-product-counter='" + productCounter + "'>\n<div class='cart-product-img'><img src=" + productData.img + " alt=''></div>\n<div class='cart-product-info'>\n<span class='product-brand'>"
										+ productData.brand
										+ "</span>\n<span class='product-decription'>"
										+ productData.decription
										+ "</span><span class='product-volume'>"
										+ productData.volume
										+ "</span>\n</div>\n<div class='cart-product-footer'>\n<span class='product-price'><i class='fa fa-rub fa-fw'></i><b>"
										+ productData.price
										+ "</b>-</span><a href='#' class='cart-product-delete'><i class='fa fa-trash-o fa-fw'></i></a>\n</div>\n</article>", cart = $('#cart'), cartProducts = cart
										.find('.cart-product'), cartItem;

								if (cartProducts.length > 0) {
									for (var i = 0; i < cartProducts.length; i++) {
										if (window.CP.shouldStopExecution(1)) {
											break;
										}
										if (cartProducts.eq(i).data(
												'cart-product-id') != productData.id) {
											if (i == cartProducts.length - 1) {
												$(pattern)
														.insertBefore(
																cart
																		.find('.cart-total'));
												cartProducts = cart
														.find('.cart-product');
												break;
											}
										} else {
											cartItem = i;
											var cartProductPrice = cartProducts
													.eq(cartItem)
													.find(
															'.cart-product-footer .product-price b'), price = cartProductPrice
													.text();
											price = parseInt(price);
											price += productData.price;
											cartProductPrice.text(price);
											break;
										}
									}
									window.CP.exitedLoop(1);

								} else {
									$(pattern).insertBefore(
											cart.find('.cart-total'));
									cartProducts = cart.find('.cart-product');
								}

								cartCounter++;
								cartTotal += productData.price;
								fns.changeCart();
								fns.showCart(cart);
							}

							addCart.on('click', function() {
								var _THIS = $(this);
								fns.getProductData(_THIS);
								fns.addToCard();
							});

							/*deleteCart.on('click', function(e){
							  e = event || window.event;
							  e.preventDefault();
							  var id = $(this).closest('.cart-product').data('cart-product-id');
							  console.log($(this));
							});*/

						});
	</script>
</body>
</html>