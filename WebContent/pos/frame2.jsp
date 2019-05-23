<%@page import="kiosk.PosMgr"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="psMgr" class="kiosk.PosMgr" />

<% 
		request.setCharacterEncoding("EUC-KR");
		Vector<OrderHistoryBean> vl = psMgr.getPreOrderHistoryList();
%>

<html>

<body>
<div align="center">
	<%
	for (int i=0; i<vl.size(); i++) {
		OrderHistoryBean vlbean = vl.get(i);
%>
	<table border="1">
		<caption>PreOrder</caption>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문상태</th>
				<th>고객번호</th>
				<th>주문날짜</th>
				<th>장소</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th><%=vlbean.getOh_num() %></th>
				<th><%=vlbean.getOh_status() %></th>
				<th><%=vlbean.getOh_num() %></th>
				<th><%=vlbean.getOh_date() %></th>
				<th><%=vlbean.getOh_io() %></th>
			</tr>
			<tr></tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">comment:<%=vlbean.getOh_comment() %></td>
			</tr>
			<tr>
			</tr>
			<tr style="border: 0px">
				<td colspan="2" style="border: 0px">point:<%=vlbean.getOh_point()%>원</td>
				<td colspan="3" style="border: 0px" align="right">total:<%=vlbean.getOh_total() %>원</td>
			</tr>
		</tfoot>
	</table>

	<br>
	<%
	}
%>
</div>
</body>
</html>

