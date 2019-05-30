<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*,admin.*"%>
<jsp:useBean id="eMgr" class="admin.EventoMgr" />
<jsp:useBean id="pMgr" class="admin.ProductMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int prod_num = Integer.parseInt(request.getParameter("prod_num"));
	
	if (eMgr.overlapEvento(prod_num)) {
%>
<script>
	alert("이미 이벤트가 존재하는 상품입니다.");
	location.href= history.back();
</script>
<%
	}
%>
<html>
<head>
<title>이벤트 입력</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600">
	<br>

	<%@ include file="tabs.jsp"%>
	<form name="regForm" method="post" action="insertEventoProc.jsp">
	<input	type="hidden" name="prod_num" value="<%= prod_num %>"/>
	<table width="75%" align="center" bgcolor="#FFFF99">
		<tr>
			<td align="center" bgcolor="#FFFFCC">
				<table width="95%" align="center" bgcolor="#FFFF99" border="1">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b>이벤트 등록 : <%= pMgr.getProductName(prod_num) %>
								</b></font></td>
						</tr>
					<%-- 	<tr>
							<td>이벤트번호</td>
							<td><%=eBean.getEv_num()%></td>
						</tr> --%>
						<tr>
							<td>이벤트이름</td>
							<td><input name="ev_name"></td>
						</tr>
						<tr>
							<td>이벤트시작일</td>
							<td><input type="date" name="ev_start" id="ev_start" onchange="javasciprt:changeEnd();"></td>
						</tr>
						<tr>
							<td>이벤트종료일</td>
							<td><input  type="date" name="ev_end" id="ev_end" disabled></td>
						</tr>

						<tr>
							<td>이벤트가격</td>
							<td><input type="number" name="ev_price" min=0 max="<%= pMgr.getProductPrice(prod_num) %>"></td>
						</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="입력완료"> 
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						<input type="button" value="다시쓰기" onClick="history.back()"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
	<%@ include file="bottom.jsp"%>
</body>
<script>
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("ev_start").setAttribute("min", today);
	
	function changeEnd() {
		document.getElementById("ev_end").disabled = false;
		document.getElementById("ev_end").setAttribute("min", document.getElementById("ev_start").value);
	}
</script>
</html>
