<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
    
<head>
	<title>My Awesome Sing Up Page</title>
	<link rel="stylesheet" href="../css/style2.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="sign-card mx-auto">
				<div class="col-md-8 mx-auto text-center">
					<div class="header-title">
						<h1 class="wv-heading--title">환영합니다!</h1>
						<h2 class="wv-heading--subtitle">Blue Bubble</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 mx-auto">
						<div class="myform-form">
							<form action="signupProc.jsp" method="post" name="signup">
								<div class="form-group">
									<input type="tel" name="mb_phone" id="phone" class="form-control my-input" placeholder="Phone" maxlength="13">
								</div>
								<div class="form-group" id="nameInput">
									<input type="text" name="mb_name" class="form-control my-input" id="name" placeholder="Name">
								</div>
								<div class="pwdInfo">
									<span>* 비밀번호는 4자리</span>
								</div>
								<div class="form-group">
									<input type="password" name="mb_pwd" class="form-control my-input" id="pwd" placeholder="Password" maxlength="4">
								</div>
								<div class="text-center ">
									<button type="submit" class=" btn btn-block send-button tx-tfm">Create Your Account</button>
								</div>
							</form>
						</div>
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

	document.getElementById("phone").onkeyup = function(event) {
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val);
	}
</script>
</html>