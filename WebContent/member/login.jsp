<%@ page contentType="text/html; charset=UTF-8"%>
<%
	if (request.getParameter("oh_io") != null) {
		String oh_io = request.getParameter("oh_io");
		session.setAttribute("oh_io", oh_io);	
	}

	int mb_num =0;
	if (session.getAttribute("mb_num") != null) {
		mb_num = ((Integer)(session.getAttribute("mb_num"))).intValue();
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>Blue Bubble Login Page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<link rel="stylesheet" href="style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="script.js" charset="utf-8"></script>

</head>
	
<body>
<%
	if (mb_num != 0) {
%>
<script>location.href = "/WebKiosk/kiosk/orderPage.jsp";</script>
<%
	} else {
%>
	<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="/WebKiosk/pic/123.jpg" class="brand_logo" alt="Logo">
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
					<form name="loginFrm" action="loginProc.jsp">
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text "><i class="fas fa-mobile"></i></span>
							</div>
							<input type="tel" id="mb_phone" name="mb_phone" class="form-control input_user" value="" placeholder="phonenumber" maxlength="13">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="mb_pwd" class="form-control input_pass" value="" placeholder="password" maxlength="4" onkeypress="javascript:press()">
						</div>
					</form>
				</div>
				<div class="d-flex justify-content-center mt-3 login_container">
					<button type="button" name="button" class="btn login_btn" onclick="javascript:login()">Login</button>
				</div>
				<div class="mt-4">
					<div class="d-flex justify-content-center links">
						Don't have an account? <a href="signup.jsp" class="ml-2" id="whitetext">SignUp</a>
					</div>					
				</div>
			</div>
		</div>
	</div>
<%
	}
%>

<script>
	document.getElementById("mb_phone").onkeyup = function(event) {
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val);
	}
</script>
</body>
</html>
