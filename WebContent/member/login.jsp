<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>My Awesome Login Page</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function login() {
		if (document.loginFrm.mb_phone.value == "") {
			alert("전화번호를 입력하세요.");
			document.loginFrm.mb_phone.focus();
			return;
		}

		if (document.loginFrm.mb_pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			document.loginFrm.mb_pwd.focus();
			return;
		}

		document.loginFrm.submit();
	}
</script>
</head>
<body>
	<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="../pic/123.jpg" class="brand_logo" alt="Logo">
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
							<input type="password" name="mb_pwd" class="form-control input_pass" value="" placeholder="password" maxlength="4">
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
</body>

<script>
	function autoHypenPhone(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}

	document.getElementById("mb_phone").onkeyup = function(event) {
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val);
	}
</script>
</html>
