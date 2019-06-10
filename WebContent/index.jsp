<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>Blue Bubble에 오신 것을 환영합니다.</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('.btn-radio').click(
				function(e) {
					$('.btn-radio').not(this).removeClass('active').siblings(
							'input').prop('checked', false).siblings(
							'.img-radio').css('opacity', '0.5');
					$(this).addClass('active').siblings('input').prop(
							'checked', true).siblings('.img-radio').css(
							'opacity', '1');
				});
	});
	
	function toLogin(oh_io) {
		location.href = "member/login.jsp?oh_io=" + oh_io;
	}
</script>
<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	font-size: 1rem;
}

.btn-radio {
	width: 70%;
	font-size: 30px;
	color: white;
	background: #1B467C;
	
}

.img-radio {
	margin-bottom: 5px;
}

.well {
	background: #ffffff;
	border: 0;
}

.space-20 {
    margin-top: 20px;
}

.main_button {
	height: 460px;
	width: 820px;
	margin-top: auto;
	margin-bottom: auto;
	background: #ffffff;
	position: relative;
	
	justify-content: center;
	flex-direction: column;
	padding: 0px;
	border-radius: 5px;
}

#orderHistory {
	color:black;
}

</style>
</head>

<body>
	<div class="container d-flex flex-column h-100">
		<jsp:include page="member/logout.jsp" />
		<div class="d-flex justify-content-center align-items-center h-100">
			<div>
				<div class="main_title">
					<img src="pic/bb2.png" class="img-responsive img-radio">
				</div>
				<div class="main_button mx-auto mt-5">
					<div class="row">
						<div class="col-md-6 col-6 text-center">
							<a href="javascript:toLogin('IN')"><img src="pic/in2.png" class="img-responsive img-radio"></a>
							<button type="button" class="btn btn-radio" onclick="javascript:toLogin('IN')">매&nbsp;&nbsp;&nbsp;장</button>
						</div>
						<div class="col-md-6 col-6 text-center">
							<a href="javascript:toLogin('OUT')"><img src="pic/out2.png" class="img-responsive img-radio"></a>
							<button type="button" class="btn btn-radio" onclick="javascript:toLogin('OUT')">포&nbsp;&nbsp;&nbsp;장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
