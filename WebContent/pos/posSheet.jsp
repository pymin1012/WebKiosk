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
	Vector<OrderHistoryBean> onelist = psMgr.getOneOrderHistoryList();
	Vector<OrderHistoryBean> twolist = psMgr.getTwoOrderHistoryList();
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="style2.css" />
<script>
$(function(){
	$('#productModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget); 
		var oh_tnum = button.data('oh-tnum');
		var flag = button.data('flag');
		console.log(flag);
		var modal = $(this);
		modal.find('.modal-content').load('posSheetModal.jsp?oh_tnum=' + oh_tnum + '&flag=' + flag);
	});
});
</script>
</head>

<body>
	<div class="h-100">
		<div class="h-50 p-3 bg-warning">
			<div class="d-inline-block h-100 text-center" style="width: 10%; color:black; vertical-align: top;">
				<h3>상</h3>
				<h3>품</h3>
				<h3>준</h3>
				<h3>비</h3>
				<h3>중</h3>
			</div>
			<div class="d-inline-block h-100" style="width: 88%; overflow-y:auto">
<%
	for (int i=0; i<onelist.size(); i++) {
		OrderHistoryBean ohbean = onelist.get(i);
		int oh_tnum = ohbean.getOh_tnum();
%>
			<button type="button" class="myButton btn m-3" data-toggle="modal" data-target="#productModal" data-oh-tnum="<%= oh_tnum %>" data-flag="prepare"><%= ohbean.getOh_num() %></button>
<%
	}
%>
			</div>
		</div>
	
		<div class="h-50 p-3 bg-success" style="border-top: 3px dashed gray;">
			<div class="d-inline-block h-100 text-center" style="width: 10%; color:black; vertical-align: top;">
				<h3>수</h3>
				<h3>령</h3>
				<h3>대</h3>
				<h3>기</h3>
				<h3>중</h3>
			</div>
			<div class="d-inline-block h-100" style="width: 88%; overflow-y:auto">
<%
	for (int i=0; i<twolist.size(); i++) {
		OrderHistoryBean ohbean = twolist.get(i);
		int oh_tnum = ohbean.getOh_tnum();
%>
			<button type="button" class="myButton btn m-3" data-toggle="modal" data-target="#productModal" data-oh-tnum="<%= oh_tnum %>" data-flag="await"><%= ohbean.getOh_num() %></button>
<%
	}
%>
			</div>
		</div>
	</div>
	
<!-- modal 창 -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
		<div class="modal-dialog mx-auto my-auto">
			<div class="modal-content">
			</div>
		</div>
	</div>
</body>
</html>
