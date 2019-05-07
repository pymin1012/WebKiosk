<%@page import="kiosk.OrderHistoryBean"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="kiosk.OrdersBean"%>
<%@ page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="kiosk.KioskMgr" />

<%
	session.setAttribute("idKey", "pos");
	
	Vector<OrderHistoryBean> hv = mgr.getOrderHistoryList();
/* 	Vector<OrdersBean> v = mgr.getOrdersList(); */
%>

<html>
<body>
	<table id="orders" border="1">
		<tr>
			<th>주문번호</th>
			<th>주문상태</th>
			<th>주문자</th>
			<th>주문날짜</th>
			<th>매장/포장</th>
			<th>코멘트</th>
			<th>포인트</th>
		</tr>
<%
	Iterator<OrderHistoryBean> it = hv.iterator();
	while (it.hasNext()) {
		OrderHistoryBean bean = it.next();
%>
		<tr>
			<td><%= bean.getOh_num() %></td>
			<td><%= bean.getOh_status() %></td>
			<td><%= bean.getMb_num() %></td>
			<td><%= bean.getOh_date() %></td>
			<td><%= bean.getOh_io() %></td>
			<td><%= bean.getOh_comment() %></td>
			<td><%= bean.getOh_point() %></td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>