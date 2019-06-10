<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="kiosk.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String mb_phone = request.getParameter("mb_phone");
	int mb_pwd = Integer.parseInt(request.getParameter("mb_pwd"));
	int mb_num = mgr.loginMember(mb_phone, mb_pwd);

	String msg = "전화번호와 비밀번호를 확인해주세요!";
	String url = "login.jsp";
	if (mb_num != 0) {
		msg = "로그인 성공";
		url = "../kiosk/orderPage.jsp";
		session.setAttribute("mb_num", mb_num);
	}
%>
<script>
	alert("<%=msg%>");
	location.replace("<%=url%>");
</script>

