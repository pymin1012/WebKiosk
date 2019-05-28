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
    <th><a href="home.jsp">홈</a></th>
    <th><a href="adminLogout.jsp">로그아웃</a></th>
    <th><a href="memberMgr.jsp">회원관리</a></th>
    <th><a href="productMgr.jsp">상품관리</a></th>
    <th><a href="eventoMgr.jsp">이벤트관리</a></th>
  </tr>
</table> 