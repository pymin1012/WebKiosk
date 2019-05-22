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
		
		function pay() {
			document.payFrm.submit();
		}
		
		function previous_page() {
			location.href = document.referrer;
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
				<form name="payFrm" action="paymentProc.jsp" class="m-0" method="POST">
				<!-- Total -->	
				<div class="row">
					<div class="col-12 col-sm-12 col-md-2 text-center">
						<!-- point -->
						사용가능 포인트<br>
						<%=mb_point %>
					</div>
					<div class="col-12 col-sm-12 col-md-4 text-md-left">
						<!-- input point -->
						<span class="small text-danger">* 포인트는 100단위로 사용가능합니다.</span><br>
						사용 포인트 : <input type="number" id="oh_point" name="oh_point" min="0" max="<%= totalprice>mb_point?totalprice:mb_point %>" step="100" value="0" style="text-align: right;">
					</div>
					
					<div class="col-12 col-sm-12 col-md-6 pr-0 row">
						<div class="col-3 col-sm-3 col-md-8 text-md-right">
							<div style="position:absolute; right:10px; bottom:0px;">
								<h3><strong>
									<small><span class="text-muted">
										<%= totalprice %>&nbsp;&nbsp;<i class="fas fa-minus fa-xs"></i>&nbsp;&nbsp;
										<span id="minus_point" class="text-warning">0</span>&nbsp;&nbsp;
										<i class="fas fa-equals fa-xs"></i>&nbsp;&nbsp;
									</span></small>
									<span class="text-muted"><i class='fas fa-won-sign'></i>&nbsp;
										<span id="last_price"><%= totalprice %></span></span>
								</strong></h3>
							</div>
						</div>
						<div class="col-2 col-sm-2 col-md-4 pr-0 text-right">
							<!-- 전체삭제버튼 -->
							<div class="pull-right" align="right">
								<a href="javascript:deleteBasket('all')" class="btn btn-outline-secondary pull-right">전체취소</a>
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
						<textarea name="oh_comment" rows="3" maxlength="100" style="resize: none; width: 100%;" placeholder="요청사항을 입력하세요."></textarea>
					</div>
				</div>
				<hr />
				
				<!-- buttons -->
				<div class="row">
					<div class="col-12 col-sm-12 col-md-12">
						<div class="d-flex justify-content-between">
							<div class="my-auto">
								<!-- 이전버튼 -->
								<a href="javascript:previous_page()" class="btn btn-outline-warning"><i class="fas fa-arrow-left"></i></a>						
							</div>
							<div>
								<!-- 결제버튼 -->
								<a href="javascript:pay()" class="btn btn-outline-danger"><i class="far fa-credit-card"></i> 결제</a>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	var fp = document.getElementById("oh_point");
	var sp = document.getElementById("minus_point");
	var lp = document.getElementById("last_price");

	function maxPoint(point) {
		var max = <%= totalprice>mb_point?mb_point:totalprice %>;
		if (point > max) return max;
		else return point; 
	}
	
	function inputPoint(point) {
		var p = Math.floor(point/100) * 100;
		return p;
	}

	fp.onkeyup = function(event) {
		event = event || window.event;
		this.value = maxPoint(this.value);
	}
	
	fp.onchange = function(event) {
		event = event || window.event;
		this.value = inputPoint(this.value);
		sp.innerText = this.value;
		lp.innerText = <%= totalprice%> - this.value;
	}
	
	fp.onfocus = function(event) {
		event = event || window.event;
		if (this.value == 0) this.value = '';
	}
	
	fp.onblur = function(event) {
		event = event || window.event;
		if (this.value == '') { 
			this.value = 0;
			sp.innerText = 0;
			lp.innerText = <%= totalprice%>;
		}
	}
</script>
</html>