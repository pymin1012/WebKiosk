<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, kiosk.*"%>
<%@ page import="java.util.*, admin.*"%>
<jsp:useBean id="aMgr" class="admin.AdminMgr" />
<jsp:useBean id="eMgr" class="admin.EventoMgr" />
<jsp:useBean id="pMgr" class="admin.ProductMgr" />

<%
	if (request.getParameter("ev_num") != null) {
		int ev_num = Integer.parseInt(request.getParameter("ev_num"));
		eMgr.deleteEvento(ev_num);
	}
%>

<script>
	function productDelete(ev_num) {
		document.update.ev_num.value = ev_num;
		document.update.submit();
	}

	function productUpdate(ev_num) {
		document.update.ev_num.value = ev_num;
		document.update.submit();
	}
</script>
<html>
<head>
<title>Blue Bubble Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">

</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="tabs.jsp"%>
	<%
		Vector<EventoBean> elist = eMgr.getEventoList();
	%>
	<table width="75%" align="center" bgcolor="#FFFF99">
		<tr>
			<td align="center" bgcolor="#FFFFCC">

				<table width="95%" align="center" bgcolor="#FFFF99" border="1">
					<tr align="center" bgcolor="#996600">
						<td><font color="#FFFFFF">이벤트명</font></td>
						<td><font color="#FFFFFF">이벤트시작일</font></td>
						<td><font color="#FFFFFF">이벤트종료일</font></td>
						<td><font color="#FFFFFF">제품번호</font></td>
						<td><font color="#FFFFFF">이벤트가격</font></td>
						<td colspan=2><font color="#FFFFFF">수정/삭제</font></td>
					</tr>
					<%
						for (int i = 0; i < elist.size(); i++) {
							EventoBean mBean = elist.get(i);
					%>
					<tr align="center">
						<td><%=mBean.getEv_name()%></td>
						<td><%=mBean.getEv_start()%></td>
						<td><%=mBean.getEv_end()%></td>
						<td><%=mBean.getProd_num()%></td>
						<td><%=mBean.getEv_price()%></td>
						<td><a
							href="javascript:location.href='updateEvento.jsp?ev_num=<%=mBean.getEv_num()%>'">수정</a></td>
						<td><a
							href="javascript:productDelete('<%=mBean.getEv_num()%>')">삭제</a></td>
					</tr>
					<%
						}
					%>
				</table>
			</td>
	</table>

	<%@ include file="bottom.jsp"%>
	<form name="update" method="get">
		<input type=hidden name="ev_num">
	</form>
	<%@ include file="middle.jsp"%>
	<form name="update" method="get">
		<input type=hidden name="ev_num">
		
		
		<%
		Vector<EventoBean> xlist = eMgr.getEndeventoList();
		%>
		<table width="75%" align="center" bgcolor="#FFFF99">
			<tr>
				<td align="center" bgcolor="#FFFFCC">

					<table width="95%" align="center" bgcolor="#FFFF99" border="1">
						<tr align="center" bgcolor="#996600">
							<td><font color="#FFFFFF">이벤트명</font></td>
							<td><font color="#FFFFFF">이벤트시작일</font></td>
							<td><font color="#FFFFFF">이벤트종료일</font></td>
							<td><font color="#FFFFFF">제품번호</font></td>
							<td><font color="#FFFFFF">이벤트가격</font></td>
						</tr>
						<%
							for (int j = 0; j < xlist.size(); j++) {
								EventoBean xBean = xlist.get(j);
						%>
						<tr align="center">
							<td><%=xBean.getEv_name()%></td>
							<td><%=xBean.getEv_start()%></td>
							<td><%=xBean.getEv_end()%></td>
							<td><%=xBean.getProd_num()%></td>
							<td><%=xBean.getEv_price()%></td>
						</tr>
						<%}%>
					</table>
				</td>
		</table>
	</form>
</body>
</html>
