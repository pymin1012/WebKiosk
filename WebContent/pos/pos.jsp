<%@ page contentType="text/html; charset=UTF-8"%>

<%
	session.setAttribute("idKey", "pos");
%>

<!DOCTYPE html>
<html>
<head>
<title>POS</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<link rel="stylesheet" href="style.css" />
<script>
	var webSocket = new WebSocket('ws://' + location.host + ':80/WebKiosk/broadcasting');

	webSocket.onerror = function(event) { onError(event) };
	webSocket.onopen = function(event) { onOpen(event) };
	webSocket.onmessage = function(event) { onMessage(event) };

	function onMessage(event) {
		var flag = event.data;
		if (flag == 'order') {
			changeIframe('posCheck.jsp');
		}
	}

	function onOpen(event) { }

	function onError(event) {
		alert(event.data);
	}

	function sendMessage() {
		var message = { "type": 2 };
		webSocket.send(JSON.stringify(message));
	}
	
	function sendReady() {
		var message = { "type": 3 };
		webSocket.send(JSON.stringify(message));
	}
	
	function changeIframe(url) {
		document.getElementById("pos").src = url;
	}
	
	function calculate() {
		var con = confirm("정말로 마감하시겠습니까?");
		if (con == true) {
			webSocket.close();
			location.href = "close.jsp";
		}
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
						<iframe id="pos" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" src="posCheck.jsp" scrolling="auto" allowTransparency="false" style="background-color: white"></iframe>
					</div>
					<!-- 버튼 -->
					<div class="col-md-2">
						<button class="btn btn-lg mt-3 mb-3" style="background-color: #18A8F1; color:white; width: 100%; height: 20%" onclick="javascript:changeIframe('posCheck.jsp')">주문 확인</button>
						<button class="btn btn-lg mt-3 mb-3" style="background-color: #18A8F1; color:white; width: 100%; height: 20%" onclick="javascript:changeIframe('posSheet.jsp')">주문 내역</button>
						<button class="btn btn-lg mt-3 mb-3" style="background-color: #18A8F1; color:white; width: 100%; height: 20%" onclick="javascript:changeIframe('preOrder.jsp')">이전 주문</button>				
						<button class="btn btn-success btn-lg mt-3 mb-2" style="width: 100%; height: 10%" onclick="javascript:changeIframe('calculate.jsp')">정산 내역</button>
						<button class="btn btn-warning btn-lg mt-2 mb-3" style="width: 100%; height: 10%" onclick="javascript:calculate()">마&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;감</button>
					</div>
				</div>
			</div>
  		</section>
	</div>
</body>
</html>