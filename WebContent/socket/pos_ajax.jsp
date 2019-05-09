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
			<td colspan="7" align="center">주문 내역</td>
		</tr>
		<tr>
			<td>주문번호</td>
			<td>주문상태</td>
			<td>주문자</td>
			<td>주문날짜</td>
			<td>매장/포장</td>
			<td>코멘트</td>
			<td>포인트</td>
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
			<td colspan="7" align="center">주문 상품</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>품번</td>
			<td>사이즈</td>
			<td>개수</td>
			<td>샷추가</td>
			<td>휘핑</td>
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