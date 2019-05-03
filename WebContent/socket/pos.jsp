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
    	var msg = JSON.parse(event.data);
    	var row = orders.insertRow(orders.rows.length);
    	var cell1 = row.insertCell(0);
    	var cell2 = row.insertCell(1);
    	var cell3 = row.insertCell(2);
    	cell1.innerHTML = msg.prod;
    	cell2.innerHTML = msg.count;
    	cell3.innerHTML = msg.ih;
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
	<table id="orders" border="1">
		<tr>
			<th>상품</th>
			<th>수량</th>
			<th>Ice/Hot</th>
		</tr>
	</table>
</body>
</html>