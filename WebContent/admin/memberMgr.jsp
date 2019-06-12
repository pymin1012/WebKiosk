<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, kiosk.*"%>
<jsp:useBean id="aMgr" class="admin.AdminMgr" />
<html>
<head>
<title>Blue Bubble Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script>
function update(id){
	document.update.mb_num.value=id;
	document.update.submit();
}
</script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="tabs.jsp" %> 
	<%Vector<MemberBean> vlist = aMgr.getMemberList();%>
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr align="center" bgcolor="#996600"> 
			<td><font color="#FFFFFF">회원번호</font></td>
			<td><font color="#FFFFFF">전화번호</font></td>
			<td><font color="#FFFFFF">회원이름</font></td>
			<td><font color="#FFFFFF">비밀번호</font></td> 
			<td><font color="#FFFFFF">point</font></td> 
		</tr>
		<%
		for(int i=0; i<vlist.size(); i++){
			MemberBean mBean = vlist.get(i);
		%>
		<tr align="center"> 
			<td><%=mBean.getMb_num()%></td>
			<td><%=mBean.getMb_phone()%></td>
			<td><%=mBean.getMb_name()%></td>
			<td><%=mBean.getMb_pwd()%></td>
			<td><%=mBean.getMb_point()%></td>
			<td><a href="javascript:update('<%=mBean.getMb_num()%>')">수정하기</a></td>
			</td>
		</tr>
		<%}%>
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="update" method="post" action="memberUpdate.jsp">
	<input type=hidden name="mb_num">
	</form>
</body>
</html>
