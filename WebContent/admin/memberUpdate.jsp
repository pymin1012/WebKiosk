<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,kiosk.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="aMgr" class="admin.AdminMgr" />
<html>
<head>
<title>ȸ������</title>
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
										ȸ������ ������ �����մϴ�.
								</b></font></td>
						</tr>
						<tr>
							<td>ȸ����ȣ</td>
							<td><%=mBean.getMb_num()%></td>
						</tr>
						<tr>
							<td>��ȭ��ȣ</td>
							<td><input name="mb_phone" value="<%=mBean.getMb_phone()%>"></td>
						</tr>
						<tr>
							<td>�̸�</td>
							<td><input name="mb_name" value="<%=mBean.getMb_name()%>"></td>
						</tr>
						<tr>
							<td>�н�����</td>
							<td><input name="mb_pwd" value="<%=mBean.getMb_pwd()%>"></td>
						</tr>
						<tr>
							<td>point</td>
							<td><input name="mb_point" value="<%=mBean.getMb_point()%>"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" value="�����Ϸ�"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<input type="reset" value="�ٽþ���"></td>
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
