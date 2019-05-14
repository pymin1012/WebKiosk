<%@ page contentType="text/html; charset=UTF-8" %>
<%
		request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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

</style>
</head>
<body >
	<div class="container h-100" style="width:850px;">
	<div style="height:100px"></div>
		<div class="d-flex justify-content-center h-100">
			<div class="main_title">
				<img src="pic/bb2.png" class="img-responsive img-radio">
			</div>
			<div class="main_button mx-auto">
				<div class="row">
					<div class="col-md-12">
						<form class="form-horizontal well" role="form">
							<div class="row">
								<div class="col-xs-6 text-center">
									<img src="pic/in2.png" class="img-responsive img-radio">
									<button type="button" class="btn btn-radio" onclick="javascript:toLogin('IN')">매&nbsp;&nbsp;&nbsp;장</button>
									<input type="checkbox" id="left-item" class="hidden">
								</div>
								<div class="col-xs-6 text-center">
									<img src="pic/out2.png" class="img-responsive img-radio">
									<button type="button" class="btn btn-radio" onclick="javascript:toLogin('OUT')">포&nbsp;&nbsp;&nbsp;장</button>
									<input type="checkbox" id="right-item" class="hidden">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
