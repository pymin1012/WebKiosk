<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="kiosk.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String mb_phone = request.getParameter("mb_phone");
	int mb_pwd = Integer.parseInt(request.getParameter("mb_pwd"));
	int mb_num = mgr.loginMember(mb_phone, mb_pwd);

	String msg = "로그인 실패";
	String url = "login.jsp";
	Boolean state = false;
	if (mb_num != 0) {
		msg = "로그인 성공";
		url = "../kiosk/orderPage.jsp";
		state = true;
		session.setAttribute("mb_num", mb_num);
	}
%>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script>
	var msg = "<%= msg %>";
	var state = <%= state %>;
	if (state) {
		swal({title: msg, icon: "success", timer: 2000}).then(function() {
			location.replace("<%=url%>");
		});
	} else {
		swal({title: msg, text: "전화번호와 비밀번호를 확인해주세요!", timer: 2000}).then(function() {
			location.replace("<%=url%>");
		});
	}
</script>
</body>
</html>
