<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");

%>
<html>
<head>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>
body {
  background-color: #1B467C;
}

.wrapper {
	position: relative;
	overflow-x: hidden;
	width: 100%;
}

.title {
	text-align: center;
	font-size: 200px;
	color: white;
}

.container {
  padding: 2em;
}

/* button style start*/
.myButton {
	-moz-box-shadow: 0px 10px 14px -7px #276873;
	-webkit-box-shadow: 0px 10px 14px -7px #276873;
	box-shadow: 0px 10px 14px -7px #276873;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #599bb3), color-stop(1, #408c99));
	background:-moz-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background:-webkit-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background:-o-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background:-ms-linear-gradient(top, #599bb3 5%, #408c99 100%);
	background:linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#599bb3', endColorstr='#408c99',GradientType=0);
	background-color:#599bb3;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:30px 76px;
	text-decoration:none;
	text-shadow:0px 1px 0px #3d768a;
}

.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #408c99), color-stop(1, #599bb3));
	background:-moz-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background:-webkit-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background:-o-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background:-ms-linear-gradient(top, #408c99 5%, #599bb3 100%);
	background:linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#408c99', endColorstr='#599bb3',GradientType=0);
	background-color:#408c99;
}

.myButton:active {
	position:relative;
	top:1px;
}


.section-title-img {
	text-align: center;
	color: #18A8F1;
	margin-bottom: 0px;
	text-transform: uppercase;
	font-size: 90px;
	font-family: Segoe Print;
}

.section-title {
	color: #18A8F1;
	padding-top: 20px;
	padding-bottom: 30px;
	margin-bottom: 0px;
	text-transform: uppercase;
	font-size: 90px;
	font-family: Segoe Print;
}

.main-container {
	height: 100%;
	padding: 0px;
}
</style>

<script>
	function changeIframe(url) {
		document.getElementById("pos").src = url;
	}
</script>
</head>
<body>
	<div class="wrapper wbody">
		<section id="tabs">
			<div class="container main-container">
				<div class="row">
					<div class="title col-md-12 ">
						<div class="row">
							<div class="col-md-3">
								<div class="section-title-img">
									<img src="../pic/logo.png" class="brand_logo" alt="Logo" style="width: auto; height:140px;">
								</div>
							</div>
							<div class="col-md-9 pl-5"><h6 class="section-title">Blue Bubble</h6></div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-10">
						<iframe id="pos" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" src="frame1.jsp" scrolling="auto" allowTransparency="false" style="background-color: white"></iframe>
					</div>
					<!-- 버튼 -->
					<div class="col-md-2">
						<a href="javascript:changeIframe('frame1.jsp')" class="myButton"avascript:changeIframe('frame1.jsp')">주문 내역</a>
						<a href="javascript:changeIframe('frame2.jsp')" class="myButton">이전 주문</a>
						<a href="javascript:changeIframe('frame3.jsp')" class="myButton">정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;산</a>
					</div>
				</div>
			</div>
  		</section>
	</div>
</body>
</html>