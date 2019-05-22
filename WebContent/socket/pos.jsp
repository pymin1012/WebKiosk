<%@ page contentType="text/html; charset=UTF-8" %>
<%
	session.setAttribute("idKey", "pos");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pos</title>
<script type="text/javascript">
	var webSocket = new WebSocket('ws://localhost:80/WebKiosk/broadcasting');
    
    webSocket.onerror = function(event) { onError(event) };
    webSocket.onopen = function(event) { onOpen(event) };
    webSocket.onmessage = function(event) { onMessage(event)};
    
	function onMessage(event) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("ajax_jsp").innerHTML = xhttp.responseText;
			}
		};
				
		xhttp.open("POST", "http://localhost/WebKiosk/socket/pos_ajax.jsp", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	    xhttp.send(null);
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
	<div id="ajax_jsp"></div>
</body>
</html>