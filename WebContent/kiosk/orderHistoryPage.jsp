<%@page import="kiosk.OrderHistoryBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="kMgr" class="kiosk.KioskMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	OrderHistoryBean ohBean = new OrderHistoryBean();
	int oh_num = Integer.parseInt(request.getParameter("oh_num"));
	session.removeAttribute("oh_io");
	session.removeAttribute("bMgr");
%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script>
	history.pushState(null, null, location.href);

	window.onpopstate = function(event) {	
		history.go(1);
	}
</script>
<style>
.h1 {
	background-color: white;
	height: 200px;
	text-align: center;
	line-height: 200px;
	font-size: 100px;
}

.html, body {
	margin-top: 100px;
	background-color: white;
	height: 200px;
	text-align: center;
	line-height: 200px;
	font-size: 100px;
}

.panel-title {
	display: inline;
	font-weight: bold;
}

.checkbox.pull-right {
	margin: 0;
}

.pl-ziro {
	padding-left: 0px;
}

.section {
	width: 70%;
	height: 70%;
	float: center;
	background: #ffffff;
}
</style>

<body>
	<div>
		<h1>주문 번호</h1>
		<!-- bean --><%= oh_num %>
		<h3>주문 완료 되었습니다.</h3>
	</div>

	<div align="center">
		<a href="../index.jsp" class="btn btn-primary" role="button">처음으로</a>
	</div>
</body>
