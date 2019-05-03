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
			<th>�ֹ���ȣ</th>
			<th>�ֹ���¥</th>
			<th>��ǰ��ȣ</th>
			<th>�ֹ���</th>
			<th>������</th>
			<th>����</th>
			<th>���߰�</th>
			<th>����</th>
			<th>����/����</th>
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