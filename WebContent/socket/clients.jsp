<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client</title>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost:80/WebKiosk/broadcasting');
    var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event) { onError(event) };
    webSocket.onopen = function(event) { onOpen(event) };
    webSocket.onmessage = function(event) { onMessage(event)};
    
    function onMessage(event) {

    }
    
    function onOpen(event) {

    }
    
    function onError(event) {
      alert(event.data);
    }
    
    function send() {
    	var prod = document.orderFrm.prod.value;
    	var count = document.orderFrm.count.value;
    	var ih = document.orderFrm.ih.value;
    	var message = { "type": 3, "prod": prod, "count": count, "ih": ih };
        webSocket.send(JSON.stringify(message));
        
        orderFrm.reset();
    }
  </script>
</head>
<body>
	<form name="orderFrm">
		상품 : <input type="text" name="prod" value="americano" /><br />
		수량 : <select name="count">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select><br />
		ice <input type="radio" name="ih" value="cold" />
		hot <input type="radio" name="ih" value="hot" /><br />
		<input type="button" value="결제" onclick="send()" />
	</form>
</body>
</html>