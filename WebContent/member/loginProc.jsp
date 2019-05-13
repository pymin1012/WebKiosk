<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="kiosk.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String mb_phone = request.getParameter("mb_phone");
	int mb_pwd = Integer.parseInt(request.getParameter("mb_pwd"));
	int mb_num = mgr.loginMember(mb_phone, mb_pwd);

	String msg = "로그인 실패";
	String url = "login.jsp";
	if (mb_num != 0) {
		msg = "로그인 성공";
		url = "../kiosk/orderPage.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>

