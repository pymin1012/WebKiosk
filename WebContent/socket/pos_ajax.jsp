<%@ page import="java.util.Iterator"%>
<%@ page import="kiosk.OrdersBean"%>
<%@ page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="kiosk.KioskMgr" />

<%
	session.setAttribute("idKey", "pos");

	Vector<OrdersBean> v = mgr.getOrdersList();
%>

<html>
<body>
	<table id="orders" border="1">
		<tr>
			<th>주문번호</th>
			<th>주문날짜</th>
			<th>상품번호</th>
			<th>주문자</th>
			<th>사이즈</th>
			<th>수량</th>
			<th>샷추가</th>
			<th>휘핑</th>
			<th>매장/포장</th>
			<th>HOT/ICE</th>
		</tr>
<%
	Iterator<OrdersBean> it = v.iterator();
	while (it.hasNext()) {
		OrdersBean bean = it.next();
%>
		<tr>
			<td><%= bean.getOr_num() %></td>
			<td><%= bean.getOr_date() %></td>
			<td><%= bean.getProd_num() %></td>
			<td><%= bean.getMb_num() %></td>
			<td><%= bean.getOr_size() %></td>
			<td><%= bean.getOr_count() %></td>
			<td><%= bean.getOr_shot() %></td>
			<td><%= bean.isOr_whip() %></td>
			<td><%= bean.getOr_io() %></td>
			<td><%= bean.getOr_hi() %></td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>