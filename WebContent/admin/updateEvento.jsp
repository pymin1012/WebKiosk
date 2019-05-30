<%@page import="kiosk.EventoBean"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*,admin.*"%>
<jsp:useBean id="eMgr" class="admin.EventoMgr" />
<jsp:useBean id="pMgr" class="admin.ProductMgr" />
<%	
	int ev_num = Integer.parseInt(request.getParameter("ev_num"));
	EventoBean eBean = eMgr.getEvento(ev_num);
%>
<html>
<head>
<title>회원가입 확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600">
	<br>

	<%@ include file="tabs.jsp"%>
	<form name="regForm" method="post" action="updateEventoProc.jsp">
		<input type="hidden" name="prod_num" value="<%=eBean.getProd_num()%>">
	
	<table width="75%" align="center" bgcolor="#FFFF99">
		<tr>
			<td align="center" bgcolor="#FFFFCC">
				<table width="95%" align="center" bgcolor="#FFFF99" border="1">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b>  이벤트 수정 : <%= pMgr.getProductName(eBean.getProd_num()) %>
								</b></font></td>
						</tr>
				
						<tr>
							<td>이벤트번호</td>
							<td><%=eBean.getEv_num()%></td>
						</tr>
						<tr>
							<td>이벤트이름</td>
							<td><input  name="ev_name" value="<%=eBean.getEv_name()%>"></td>
						</tr>
						<tr>
							<td>이벤트시작일</td>
							<td><input type="date" name="ev_start" value="<%=eBean.getEv_start()%>"></td>
						</tr>
						<tr>
							<td>이벤트종료일</td>
							<td><input type="date" name="ev_end" value="<%=eBean.getEv_end()%>"></td>
						</tr>
						<tr>
							<td>이벤트가격</td>
							<td><input name="ev_price" value="<%=eBean.getEv_price()%>"></td>
							
						</tr>
						
					<tr>
					
						<td colspan="2" align="center">
						<input type="submit" value="수정완료"> 
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						<input type="button" value="다시쓰기" onClick="history.back()"></td>
					</tr>
				
				</table>
			</td>
			
		</tr>
		
	</table>
		<input type=hidden name="ev_num" value="<%=eBean.getEv_num()%>">
	</form>

	<%@ include file="bottom.jsp"%>
</body>
	
</html>

