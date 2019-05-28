<%@ page contentType="text/html;charset=EUC-KR" %>
<jsp:useBean id="aMgr" class="admin.AdminMgr" />
<%
	int mb_num = Integer.parseInt(request.getParameter("mb_num"));
	int mb_pwd = Integer.parseInt(request.getParameter("mb_pwd"));
	boolean adminCheck = aMgr.adminCheck(mb_num, mb_pwd);
    if(adminCheck) {
	    session.setAttribute("adminKey", mb_num);
%>
   <script>
   location.href="home.jsp";
   </script>
<%}else{%>
   <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="adminLogin.jsp";
   </script>
<%}%>
