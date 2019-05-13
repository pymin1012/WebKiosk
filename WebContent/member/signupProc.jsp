<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bean" class="kiosk.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="mgr" class="kiosk.MemberMgr"/>
<%
		request.setCharacterEncoding("UTF-8");
		boolean success = mgr.signMember(bean);
		
		String msg = "가입에 실패하셨습니다.";
		String url  = "signup.jsp";
		if (success) {
			msg = "가입을 축하합니다.";
			url = "login.jsp";
		}
%>
<script>
	alert("<%= msg%>");
	location.href = "<%= url %>";
</script>

