<%@page import="kiosk.ProductBean"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="psMgr" class="kiosk.PosMgr" />
<jsp:useBean id="kMgr" class="kiosk.KioskMgr" />
<jsp:useBean id="pMgr" class="kiosk.ProductMgr"/>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

<% 
	request.setCharacterEncoding("UTF-8");
	Vector<OrderHistoryBean> ohlist = psMgr.getReadyOrderHistoryList();
%>

<html>
<head>
<style>
:root {
	--teal-color: #24A9A7;
	--purple-color: #9E41CC;
}

body {
    background-color: #fff;
    color: var(--teal-color);
    font-size: 15px;
}

ul {
    padding: 0;
    list-style: none;
}

.topics-table {
    margin-top: 1rem;
    padding: 8px;
    border: 2px solid var(--teal-color);
    border-radius: 10px;
}

.topics-table a {
    /*color: var(--purple-color);*/
}

ul.header-titles, li.topics-body, li.topics-body ul {
    overflow: hidden;
}

li.topics-header, ul[class^='topic-item'] {
    padding: 8px;
}

ul[class^='topic-item'] {
	margin-top: 8px;
    border-top: 1px solid var(--teal-color);
}

.header-titles li, ul[class^='topic-item'] li {
    width: 20%;
    float: left;
}

li.product-header {
    border-top: 2px solid var(--teal-color);
}

ul.product-titles, li.product-body, li.product-body ul {
    overflow: hidden;
}

li.product-header, ul[class^='product-item'] {
    padding: 8px;
}

ul[class^='product-item'] {
    border-top: 1px solid var(--teal-color);
}

.product-titles li, ul[class^='product-item'] li {
    width: 10%;
    float: left;
}

ul.footer-titles, li.footer-body, li.footer-body ul {
    overflow: hidden;
}

li.footer-header, ul[class^='footer-item'] {
    padding: 8px;
}

ul[class^='footer-item'] {
    border-top: 1px solid var(--teal-color);
}

.footer-titles li, ul[class^='footer-item'] li {
    width: 25%;
    float: left;
}

.badge {
    font-weight: normal;
}
</style>
</head>

<body>
	<div align="center">
		<div class="mt-3">
			<h3 style="color:black">새로운 주문을 확인하세요!</h3>
		</div>
<%
	for (int i=0; i<ohlist.size(); i++) {
	OrderHistoryBean vlbean = ohlist.get(i);
%>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="row">
						<div class="check-table col-10">
							<ul class="topics-table">
								<li class="topics-header">
									<ul class="header-titles" style="color: blue">
										<li>주문번호</li>
										<li>고객번호</li>
										<li>장소</li>
										<li style="width: 40%;">주문날짜</li>
									</ul>
								</li>

								<li class="topics-body">
									<ul class="topic-item">
										<li><%=vlbean.getOh_num()%></li>
										<li><%=vlbean.getMb_num()%></li>
										<li><%=vlbean.getOh_io()%></li>
										<li style="width: 40%"><%=vlbean.getOh_date()%></li>
									</ul>
								</li>				
								
								<li class="product-header">
									<ul class="product-titles" style="color: Blueviolet">
										<li>No.</li>
										<li style="width: 35%">상품</li>
										<li>수량</li>
										<li>사이즈</li>
										<li>샷</li>
										<li>휘핑</li>
										<li style="width: 15%">HOT/ICE</li>
									</ul>
								</li>
<%
		Vector<OrdersBean> olist = kMgr.getOrdersList(vlbean.getOh_num());
		for (int j = 0; j < olist.size(); j++) {
			OrdersBean obean = olist.get(j);
			ProductBean pbean = pMgr.getProduct(obean.getProd_num());
			String or_size = obean.getOr_size();
			String or_hi = obean.getOr_hi();
			if (or_size == null) or_size = "&nbsp;";
			if (or_hi == null) or_hi = "&nbsp;";
%>
								
								<li class="product-body">
									<ul class="product-item">
										<li><%=obean.getOr_basket()%></li>
										<li style="width: 35%"><%=pbean.getProd_name()%></li>
										<li><%= obean.getOr_count() %></li>
										<li><%= or_size %></li>
<%
			int ctg_num = pbean.getCtg_num();
			if (ctg_num != 1) {
%>
										<li>&nbsp;</li>
										<li>&nbsp;</li>
<%
			} else {
%>
										<li><%=obean.getOr_shot()%></li>
										<li><%=obean.isOr_whip()?"추가":"없음"%></li>
<%
			}
%>
										<li style="width: 15%"><%= or_hi %></li>
									</ul>
								</li>
								
<%
	}
%>

								<li class="footer-body">
									<ul class="footer-item" style="color: black; border-top: 2px solid var(--teal-color);">
										<li>comment</li>
										<li style="width: 75%; text-align: left"><%=vlbean.getOh_comment()%></li>
									</ul>

									<ul class="footer-item">
										<li style="color: #d39e00">point</li>
										<li style="color: #d39e00"><%=vlbean.getOh_point()%>p</li>
										<li style="color: red">total</li>
										<li style="color: red"><%=vlbean.getOh_total()%>원</li>
									</ul>
								</li>
							</ul>							
						</div>
						
						<div class="check-button col-2 my-auto">
							<button class="btn btn-success btn-lg mb-3" style="width:60px; height:50px;"><i class="fas fa-check"></i></button>
							<button class="btn btn-danger btn-lg mt-3" style="width:60px; height:50px;"><i class="fas fa-times"></i> </button>
						</div>
					</div>
				</div>
			</div>
		</div>
<%
	}
%>
	</div>
</body>
</html>
