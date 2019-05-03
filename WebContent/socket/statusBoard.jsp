<%@ page contentType="text/html; charset=UTF-8" %>
<%
	session.setAttribute("idKey", "board");
%>
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

    }
    
    function onOpen(event) {

    }
    
    function onError(event) {
      alert(event.data);
    }
    
    function send() {


    }
  </script>
</head>
<body>


</body>
</html>