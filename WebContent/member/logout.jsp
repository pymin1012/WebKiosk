<%@page import="kiosk.MemberBean"%>
<%@page import="kiosk.MemberMgr"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	int mb_num = 0;
	if (session.getAttribute("mb_num") != null) {
		mb_num = ((Integer)(session.getAttribute("mb_num"))).intValue();
		MemberBean bean = new MemberMgr().getMember(mb_num);
%>
<div class="container">
	<div class="row">
		<div class="col-12" >
				<div style="text-align:right">
					<span style="margin-right: 30px">
						<%= bean.getMb_name() %> 님 환영합니다.
					</span>
					<span style="margin-right: 30px">
						<%= bean.getMb_point() %> 점
					</span>
					<a href="/WebKiosk/member/loginOutProc.jsp">로그아웃</a>
			</div>
		</div>
	</div>
</div>
<%
	}
%>