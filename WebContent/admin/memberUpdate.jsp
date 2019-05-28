<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,kiosk.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="aMgr" class="admin.AdminMgr" />
<html>
<head>
<title>회원수정</title>
<link href="../style.css" rel="stylesheet" type="text/css">

</head>
<body bgcolor="#996600">
	<br>
	<%@ include file="tabs.jsp"%>
	<%
		int mb_num = Integer.parseInt(request.getParameter("mb_num"));
		MemberBean mBean = aMgr.getMember(mb_num);
	%>
	<form name="regForm" method="post" action="memberUpdateProc.jsp">
		<table width="75%" align="center" bgcolor="#FFFF99">
			<tr>
				<td align="center" bgcolor="#FFFFCC">
					<table width="95%" align="center" bgcolor="#FFFF99" border="1">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b> <%=mBean.getMb_name()%>
										회원님의 정보를 수정합니다.
								</b></font></td>
						</tr>
						<tr>
							<td>회원번호</td>
							<td><%=mBean.getMb_num()%></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input name="mb_phone" value="<%=mBean.getMb_phone()%>"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="mb_name" value="<%=mBean.getMb_name()%>"></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input name="mb_pwd" value="<%=mBean.getMb_pwd()%>"></td>
						</tr>
						<tr>
							<td>point</td>
							<td><input name="mb_point" value="<%=mBean.getMb_point()%>"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" value="수정완료"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<input type="reset" value="다시쓰기"></td>
						</tr>
						<input type="hidden" name="mb_num" value="<%=mb_num%>">
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="bottom.jsp"%>
</body>
</html>
