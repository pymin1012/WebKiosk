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
									<input type="number" min="0" name="mb_phone" id="phone"
										class="form-control my-input" placeholder="Phone">
								</div>
								<div class="form-group">
									<input type="text" name="mb_name" class="form-control my-input"
										id="name" placeholder="Name">
								</div>
								<div>
									<span>* 비밀번호는 4자리</span>
								</div>
								<div class="form-group">
									<input type="password" name="mb_pwd" class="form-control my-input"
										id="pwd" placeholder="Password">
								</div>
								<div class="text-center ">
									<button type="submit" class=" btn btn-block send-button tx-tfm">Create
										Your Account</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>