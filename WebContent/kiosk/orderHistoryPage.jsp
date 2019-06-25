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

<html>
<head>
<title>주문완료</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
	history.pushState(null, null, location.href);

	window.onpopstate = function(event) {	
		history.go(1);
	}
</script>
</head>

<body>
	<div class="container h-100">
		<div class="d-flex justify-content-center align-items-center h-100">
			<div style="text-align: center">
				<h1>주문 번호</h1>
				<span style="font-size: 100px"><%= oh_num %></span>
				<h3>주문이 완료 되었습니다.</h3>
				<br><br>
				<a href="../index.jsp" class="btn btn-primary" role="button">처음으로</a>
			</div>
		</div>
	</div>
</body>
</html>