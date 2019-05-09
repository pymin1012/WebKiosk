<%@page import="kiosk.OrderHistoryBean"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="kiosk.OrdersBean"%>
<%@ page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="kiosk.KioskMgr" />

<%
	session.setAttribute("idKey", "pos");
	
	Vector<OrderHistoryBean> hv = mgr.getOrderHistoryList();
%>

<html>
<body>
<%
	Iterator<OrderHistoryBean> it = hv.iterator();
	while (it.hasNext()) {
		OrderHistoryBean bean = it.next();
%>
	<table id="orders" border="1">
		<tr>
			<td colspan="7" align="center">�ֹ� ����</td>
		</tr>
		<tr>
			<td>�ֹ���ȣ</td>
			<td>�ֹ�����</td>
			<td>�ֹ���</td>
			<td>�ֹ���¥</td>
			<td>����/����</td>
			<td>�ڸ�Ʈ</td>
			<td>����Ʈ</td>
		</tr>
		<tr>
			<td><%= bean.getOh_num() %></td>
			<td><%= bean.getOh_status() %></td>
			<td><%= bean.getMb_num() %></td>
			<td><%= bean.getOh_date() %></td>
			<td><%= bean.getOh_io() %></td>
			<td><%= bean.getOh_comment() %></td>
			<td><%= bean.getOh_point() %></td>
		</tr>
		<tr>
			<td colspan="7" align="center">�ֹ� ��ǰ</td>
		</tr>
		<tr>
			<td>��ȣ</td>
			<td>ǰ��</td>
			<td>������</td>
			<td>����</td>
			<td>���߰�</td>
			<td>����</td>
			<td>HOT/ICE</td>
		</tr>
<%
		Vector<OrdersBean> v = mgr.getOrdersList(bean.getOh_num());
		Iterator<OrdersBean> its = v.iterator();
		while (its.hasNext()) {
			OrdersBean obean = its.next();
%>
		<tr>
			<td><%= obean.getOr_basket()%></td>
			<td><%= obean.getProd_num() %></td>
			<td><%= obean.getOr_size() %></td>
			<td><%= obean.getOr_count() %></td>
			<td><%= obean.getOr_shot() %></td>
			<td><%= obean.isOr_whip() %></td>
			<td><%= obean.getOr_hi() %></td>
		</tr>
<%
		}
%>
	</table><br />
<%
	}
%>
</body>
</html>