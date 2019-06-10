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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	
<script>
	function deleteBasket(flag) {
		location.replace("paymentDeleteProc.jsp?flag=" + flag);
	}
		
	function pay() {
		document.payFrm.submit();
	}
		
	function previous_page() {
		history.back(-1);
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
 	int totalproduct = 0;
	int totalevent = 0;
	int totalprice = 0;
	for(int key: blist.keySet()) {
		OrdersBean obean = blist.get(key);
		int prod_num = obean.getProd_num();
		ProductBean pbean = pMgr.getProduct(prod_num);
		int prod_price =  pbean.getProd_price();
		int shot_price = 0;
		int size_price = 0;
		int price = 0;
		
		// 이벤트
		int or_event = obean.getOr_event();
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
				case "T": out.println("사이즈 : Tall, "); size_price = 0; break;  
				case "G": out.println("사이즈 : Grande, "); size_price = 500; break; 
				case "V": out.println("사이즈 : Venti, "); size_price = 1000; break;
			}
		}
		if (pbean.getCtg_num() == 1) {
			shot_price = obean.getOr_shot() * 500;
			out.println("샷추가 : " + obean.getOr_shot() + ", ");
			out.println((obean.isOr_whip()?"휘핑 추가, ":"휘핑 없음, "));
		}
		price = (prod_price + shot_price + size_price) * obean.getOr_count();
		out.println("주문수량 : " + obean.getOr_count());
		totalproduct+=price;
		totalevent+=or_event;
		if (or_event != 0) {
			totalprice = totalprice + price - or_event;
		} else {
			totalprice = totalprice + price ;
		}
%>
							</small>
						</h4>
					</div>
					<div class="col-12 col-sm-12 text-sm-center col-md-4 pr-0 text-md-right row">
						<div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
<%
		if (or_event != 0) {
%>
							<h5><strong><span style="text-decoration:line-through; color: red;"><i class='fas fa-won-sign'></i>&nbsp;<%= price %></span></strong></h5>
							<h5><strong><span class="text-muted"><i class='fas fa-won-sign'></i>&nbsp;<%= price - or_event %></span></strong></h5>
<%
		} else {
%>
							<h5><strong><span class="text-muted"><i class='fas fa-won-sign'></i>&nbsp;<%= price %></span></strong></h5>
<%
		}
%>
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
				<form name="payFrm" action="paymentSocket.jsp" class="m-0" method="POST">
				<!-- Total -->	
				<div class="row">
					<div class="col-12 col-sm-12 col-md-2 text-center">
						<!-- point -->
						사용가능 포인트<br>
						<%=mb_point %>
					</div>
					<div class="col-12 col-sm-12 col-md-3 text-md-left">
						<!-- input point -->
						<span class="small text-danger">* 포인트는 100단위로 사용가능합니다.</span><br>
						사용 포인트 : <input type="number" id="oh_point" name="oh_point" min="0" max="<%= totalprice>mb_point?mb_point:totalprice %>" step="100" value="0" style="text-align: right;">
					</div>
					
					<div class="col-12 col-sm-12 col-md-7 pr-0 row">
						<div class="col-3 col-sm-3 col-md-9 text-md-right">
							<div style="position:absolute; right:10px; bottom:0px;">
								<h3><strong>
									<small><span class="text-muted">
										<%= totalproduct %>&nbsp;&nbsp;<i class="fas fa-minus fa-xs"></i>&nbsp;&nbsp;
										<span id="minus_event" class="text-danger"><%= totalevent %></span>&nbsp;&nbsp;<i class="fas fa-minus fa-xs"></i>&nbsp;&nbsp;
										<span id="minus_point" class="text-warning">0</span>&nbsp;&nbsp;
										<i class="fas fa-equals fa-xs"></i>&nbsp;&nbsp;
									</span></small>
									<span class="text-muted"><i class='fas fa-won-sign'></i>
									<span id="last_price"><%= totalprice %></span></span>
								</strong></h3>
							</div>
						</div>
						<div class="col-2 col-sm-2 col-md-3 pr-0 text-right">
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
				
				<input type="hidden" id="oh_total" name="oh_total" value="<%=totalprice %>" />
				</form>
			</div>
		</div>
	</div>
	
<script>
	var fp = document.getElementById("oh_point");
	var sp = document.getElementById("minus_point");
	var lp = document.getElementById("last_price");
	var ht = document.getElementById("oh_total");

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
		ht.value = <%= totalprice%> - this.value;
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
			ht.value = <%= totalprice%>;
		}
	}
</script>
</body>
</html>