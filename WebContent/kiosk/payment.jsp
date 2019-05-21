<%@page import="kiosk.OrdersBean"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="kiosk.ProductBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pMgr" class="kiosk.ProductMgr"/>
<jsp:useBean id="mMgr" class="kiosk.MemberMgr"/>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	LinkedHashMap<Integer, OrdersBean> blist = bMgr.getBasketList();
	
	int mb_num = 0;
	int mb_point = 0;
	if (session.getAttribute("mb_num") != null) {
		mb_num = ((Integer)(session.getAttribute("mb_num"))).intValue();
	}
	mb_point = mMgr.getPoint(mb_num);
%>

<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<script>
		function deleteBasket(flag) {
			location.href = "paymentDeleteProc.jsp?flag=" + flag;
		}
	</script>
</head>

<body>
	<div class="container">
		<div class="card shopping-cart">
			<div class="card-header bg-primary text-light">
				<i class="fa fa-shopping-cart" aria-hidden="true"></i> Shopping Cart
				<div class="clearfix"></div>
			</div>

			<div class="card-body">
<%
 	int totalprice = 0;
	for(int key: blist.keySet()) {
		OrdersBean obean = blist.get(key);
		ProductBean pbean = pMgr.getProduct(obean.getProd_num());
		int price = pbean.getProd_price()*obean.getOr_count();
		totalprice+=price;
%>
				<!-- PRODUCT -->
				<div class="row">
					<div class="col-12 col-sm-12 col-md-2 text-center">
<% 
		if (obean.getOr_hi() != null && obean.getOr_hi().equals("ICE")) {
%>
						<img class="img-responsive" src="../menu_pic/<%= pbean.getProd_iimg() %>" alt="prewiew" width="80" height="80">
<%
		} else {
%>
						<img class="img-responsive" src="../menu_pic/<%= pbean.getProd_img() %>" alt="prewiew" width="80" height="80">
<% 
		}
%>
					</div>
					<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
						<h4 class="product-name">
							<strong><%=pbean.getProd_name()%></strong>
						</h4>
						<br>
						<h4>
							<small>
<%
		if (obean.getOr_size() != null) {
			switch (obean.getOr_size()) {
				case "S": out.println("사이즈 : Small, "); break; 
				case "T": out.println("사이즈 : Tall, "); break;  
				case "G": out.println("사이즈 : Grande, "); break; 
				case "V": out.println("사이즈 : Venti, "); break;
			}
		}
		if (pbean.getCtg_num() == 1) {
			out.println("샷추가 : " + obean.getOr_shot() + ", ");
			out.println((obean.isOr_whip()?"휘핑 추가, ":"휘핑 없음, "));
		}
		out.println("주문수량 : " + obean.getOr_count());
%>
							</small>
						</h4>
					</div>
					<div class="col-12 col-sm-12 text-sm-center col-md-4 pr-0 text-md-right row">
						<div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
							<h5>
								<strong><span class="text-muted"><i class='fas fa-won-sign'></i>&nbsp;<%=price %></span></strong>
							</h5>
						</div>
						<div class="col-2 col-sm-2 col-md-6 pr-0 text-right">
							<!-- 주문취소버튼 -->
							<button type="button" class="btn btn-outline-primary btn-xs" onclick="javascript:deleteBasket('<%= key %>')">
								<i class="fa fa-trash" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</div>
				<hr />
				<!-- END PRODUCT -->
				<%
		}//---for
	%>			
				<!-- Total -->	
				<div class="row">
					<div class="col-12 col-sm-12 col-md-2 text-center">
						<!-- point -->
						사용가능포인트:<%=mb_point %>
					</div>
					<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
						<!-- input point -->
						포인트사용:<input type="text">
					</div>
					<div class="col-12 col-sm-12 text-sm-center col-md-4 pr-0 text-md-right row">
						<div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
							<h4><strong>
								<span class="text-muted"><i class='fas fa-won-sign'></i>&nbsp;<%= totalprice %></span>
							</strong></h4>
						</div>
						<div class="col-2 col-sm-2 col-md-6 pr-0 text-right">
							<!-- 전체삭제버튼 -->
							<div class="pull-right" align="right">
								<a href="javascript:deleteBasket('all')" class="btn btn-outline-secondary pull-right"> 전체취소</a>
							</div>
						</div>
					</div>
				</div>
				<hr />
				
				<!-- comment -->
				<div class="row">
					<div class="col-12 col-sm-12 col-md-2 text-center my-auto">
						<h5>Comment</h5>
					</div>
					<div class="col-12 col-sm-12 col-md-10">
						<textarea cols="50" rows="5" maxlength="100" style="resize: none; width: 100%; height: 80px;"></textarea>
					</div>
				</div>
				<hr />
				
				<!-- buttons -->
				<div class="row">
					<div class="col-12 col-sm-12 col-md-12">
						<div class="d-flex justify-content-between">
							<div class="my-auto">
								<!-- 이전버튼 -->
								<a href="" class="btn btn-outline-warning"><i class="fas fa-arrow-left"></i></a>						
							</div>
							<div>
								<!-- 결제버튼 -->
								<a href="" class="btn btn-outline-danger"><i class="far fa-credit-card"></i> 결제</a>							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>