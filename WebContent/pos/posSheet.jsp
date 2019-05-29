<%@page import="kiosk.ProductBean"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="psMgr" class="kiosk.PosMgr" />
<jsp:useBean id="kMgr" class="kiosk.KioskMgr" />
<jsp:useBean id="pMgr" class="kiosk.ProductMgr"/>

<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<% 
		request.setCharacterEncoding("UTF-8");
		Vector<OrderHistoryBean> onelist = psMgr.getOneOrderHistoryList();
		Vector<OrderHistoryBean> twolist = psMgr.getTwoOrderHistoryList();
%>
<style>
:root { -
	-teal-color: #24A9A7; -
	-purple-color: #9E41CC;
}

body {
	background-color: #fff;
	color: var(- -teal-color);
}

ul {
	padding: 0;
	list-style: none;
}

.topics-table {
	margin-top: 1rem;
	padding: 8px;
	border: 2px solid var(- -teal-color);
	border-radius: 10px;
}

.topics-table a {
	/*color: var(--purple-color);*/
	
}

ul.header-titles, li.topics-body, li.topics-body ul {
	overflow: hidden;
}

li.topics-header, ul[class^='topic-item-'] {
	padding: 8px;
}

ul[class^='topic-item-'] {
	border-top: 1px solid var(- -teal-color);
}

.header-titles li, ul[class^='topic-item-'] li {
	width: 25%;
	float: left;
}

.badge {
	font-weight: normal;
}

/* button start */
.myButton {
	-moz-box-shadow: 0px 10px 14px -7px #276873;
	-webkit-box-shadow: 0px 10px 14px -7px #276873;
	box-shadow: 0px 10px 14px -7px #276873;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #599bb3
		), color-stop(1, #408c99));
	background: -moz-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background: -webkit-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background: -o-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background: -ms-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background: linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#599bb3',
		endColorstr='#408c99', GradientType=0);
	background-color: #599bb3;
	-moz-border-radius: 14px;
	-webkit-border-radius: 14px;
	border-radius: 14px;
	border: 4px solid #29668f;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 30px;
	font-weight: bold;
	padding: 23px 32px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #3d768a;
}

.myButton:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #408c99
		), color-stop(1, #599bb3));
	background: -moz-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background: -webkit-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background: -o-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background: -ms-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background: linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#408c99',
		endColorstr='#599bb3', GradientType=0);
	background-color: #408c99;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.modal {
	text-align: center;
	padding: 0!important;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal-dialog {
	display: inline-block;
	vertical-align: middle;
	max-width: 100%;
	width: 60%;
	background: #fff;
	z-index: 11;
	padding: 10px;
}
</style>

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
