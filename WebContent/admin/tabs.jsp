<%@ page pageEncoding="EUC-KR"%>
<%
	int adminKey = 0;

	if (session.getAttribute("adminKey") != null) {
	    adminKey = ((Integer)(session.getAttribute("adminKey"))).intValue();
	} else {
		response.sendRedirect("adminLogin.jsp");
	}
%>

<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#FFCC00"> 
    <th><a href="home.jsp">Ȩ</a></th>
    <th><a href="adminLogout.jsp">�α׾ƿ�</a></th>
    <th><a href="memberMgr.jsp">ȸ������</a></th>
    <th><a href="productMgr.jsp">��ǰ����</a></th>
    <th><a href="eventoMgr.jsp">�̺�Ʈ����</a></th>
  </tr>
</table> 