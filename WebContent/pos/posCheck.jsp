<%@page import="kiosk.ProductBean"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="psMgr" class="kiosk.PosMgr" />
<jsp:useBean id="kMgr" class="kiosk.KioskMgr" />
<jsp:useBean id="pMgr" class="kiosk.ProductMgr"/>

<% 
	request.setCharacterEncoding("UTF-8");
	Vector<OrderHistoryBean> ohlist = psMgr.getZeroOrderHistoryList();
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<link rel="stylesheet" href="style2.css" />
<script>
$(function() {
	$(".obtn").click(function() {
		var oh_tnum = $(this).data('oh-tnum');
		var oh_date = $(this).data('oh-date');
		var myData = "flag=check&oh_tnum=" + oh_tnum + "&oh_date=" + oh_date;
		
		$.ajax({
				type: "POST",
				url: "posCheckProc.jsp",
				data: myData,

				success: function(res) {
					window.parent.sendMessage();
					location.reload();
				}
		});
	});
	
	$(".cbtn").click(function() {
		var oh_tnum = $(this).data('oh-tnum');
		var oh_date = $(this).data('oh-date');
		var myData = "flag=cancle&oh_tnum=" + oh_tnum + "&oh_date=" + oh_date;
		
		$.ajax({
				type: "POST",
				url: "posCheckProc.jsp",
				data: myData,

				success: function(res) {
					location.reload();
				}
		});
	});
});
</script>
</head>

<body>
	<div align="center">
		<div class="mt-3">
			<h3 style="color:black">새로운 주문을 확인하세요!</h3>
		</div>
<%
	int totalEvent = 0;

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
		Vector<OrdersBean> olist = kMgr.getOrdersList(vlbean.getOh_tnum());
		for (int j = 0; j < olist.size(); j++) {
			OrdersBean obean = olist.get(j);
			ProductBean pbean = pMgr.getProduct(obean.getProd_num());
			String or_size = obean.getOr_size();
			String or_hi = obean.getOr_hi();
			if (or_size == null) or_size = "&nbsp;";
			if (or_hi == null) or_hi = "&nbsp;";
			totalEvent += obean.getOr_event();
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
										<li style="color: red">event</li>
										<li style="color: red"><%= totalEvent %>원</li>
									</ul>
									
									<ul class="footer-item">
										<li style="color: black; width: 50%;">total</li>
										<li style="color: black; width: 50%;"><%=vlbean.getOh_total()%>원</li>
									</ul>			
								</li>
							</ul>							
						</div>
						
						<div class="check-button col-2 my-auto">
							<button class="btn btn-success btn-lg mb-3 obtn" data-oh-tnum="<%= vlbean.getOh_tnum()  %>" data-oh-date="<%= vlbean.getOh_date() %>" style="width:60px; height:50px;"><i class="fas fa-check"></i></button>
							<button class="btn btn-danger btn-lg mt-3 cbtn" data-oh-tnum="<%= vlbean.getOh_tnum()  %>" data-oh-date="<%= vlbean.getOh_date() %>" style="width:60px; height:50px;"><i class="fas fa-times"></i> </button>
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
