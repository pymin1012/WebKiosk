<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>POS</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="style.css" />

<script>
	function changeIframe(url) {
		document.getElementById("pos").src = url;
	}
</script>
</head>
<body>
	<div class="wrapper">	
		<section id="tabs">
			<div class="container main-container">
				<div class="head row">
					<div class="title col-md-12 ">
						<div class="row">
							<div class="col-md-3"><div class="section-title-img">
								<img src="../pic/logo.png" class="brand_logo" alt="Logo" style="width: auto; height:140px;">
							</div></div>
							<div class="col-md-9 pl-5"><h6 class="section-title">Blue Bubble</h6></div>
						</div>
					</div>
				</div>
				
				<div class="frame row">
					<div class="col-md-10">
						<iframe id="pos" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" src="posSheet.jsp" scrolling="auto" allowTransparency="false" style="background-color: white"></iframe>
					</div>
					<!-- 버튼 -->
					<div class="col-md-2">
						<button class="btn btn-primary btn-lg mt-5 mb-5" style="width: 100%; height: 20%" onclick="javascript:changeIframe('posSheet.jsp')">주문 내역</button>
						<button class="btn btn-primary btn-lg mt-5 mb-5" style="width: 100%; height: 20%" onclick="javascript:changeIframe('preOrder2.jsp')">이전 주문</button>				
						<button class="btn btn-warning btn-lg mt-5 mb-5" style="width: 100%; height: 10%" onclick="javascript:changeIframe('frame3.jsp')">정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;산</button>
					</div>
				</div>
			</div>
  		</section>
	</div>
</body>
</html>