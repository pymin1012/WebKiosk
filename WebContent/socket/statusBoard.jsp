<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS</title>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost:80/WebKiosk/broadcasting');
    var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event) { onError(event) };
    webSocket.onopen = function(event) { onOpen(event) };
    webSocket.onmessage = function(event) { onMessage(event)};
    
    function onMessage(event) {
        textarea.value += "상대 : " + event.data + "\n";
    }
    
    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }
    
    function onError(event) {
      alert(event.data);
    }
    
    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
    }
  </script>
</head>
<body>
	<form name="orderFrm">
		<input type="text" name="상품명" />
		<input type="button" value="결제" onclick="" />
	</form>
    <fieldset>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
    </fieldset>
</body>
</html>