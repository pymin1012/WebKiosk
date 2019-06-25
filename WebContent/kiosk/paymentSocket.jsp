<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="kiosk.ProductBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pMgr" class="kiosk.ProductMgr"/>
<jsp:useBean id="mMgr" class="kiosk.MemberMgr"/>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<jsp:useBean id="kMgr" class="kiosk.KioskMgr" />

<%
	int oh_total = Integer.parseInt(request.getParameter("oh_total"));
	int oh_point = Integer.parseInt(request.getParameter("oh_point"));
	String oh_comment = request.getParameter("oh_comment");

	int mb_num = 0;
	if (session.getAttribute("mb_num") != null) {
		mb_num = ((Integer)(session.getAttribute("mb_num"))).intValue();
	}

	String oh_io = null;
	if (session.getAttribute("oh_io") != null) {
		oh_io = (String)session.getAttribute("oh_io");
	}

	OrderHistoryBean ohBean = new OrderHistoryBean();
	ohBean.setMb_num(mb_num);
	ohBean.setOh_comment(oh_comment);
	ohBean.setOh_io(oh_io);
	ohBean.setOh_point(oh_point);
	ohBean.setOh_total(oh_total);
	
	session.setAttribute("idKey", "clients");
	session.setAttribute("ohBean", ohBean);
%>

<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script type="text/javascript">
	var webSocket = new WebSocket('ws://' + location.host + ':80/WebKiosk/broadcasting');

	webSocket.onerror = function(event) {
		onError(event)
	};

	webSocket.onopen = function(event) {
		onOpen(event)
	};

	webSocket.onmessage = function(event) {
		onMessage(event)
	};

	function onMessage(event) {
		var oh_num = event.data;
		swal({title: "결제가 완료되었습니다.", icon: "success", timer: 2000}).then(function() {
			location.href = "orderHistoryPage.jsp?oh_num=" + oh_num;
		});
	}

	function onOpen(event) {
		var message = { "type": 1 };
		webSocket.send(JSON.stringify(message));
	}

	function onError(event) {
		alert(event.data);
	}
</script>
</body>
</html>

