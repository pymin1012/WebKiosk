<%@ page contentType="text/html; charset=UTF-8" %>
<%
	session.setAttribute("idKey", "clients");
%>
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
    	var prod_num = document.orderFrm.prod_num.value;
    	var mb_num = document.memberFrm.mb_num.value;
    	var or_size = document.orderFrm.or_size.value;
    	var or_count = document.orderFrm.or_count.value;
    	var or_hi = document.orderFrm.or_hi.value;
    	
    	var message = { "type": 2, "prod_num": prod_num, "mb_num": mb_num, "or_size": or_size, "or_count": or_count, "or_hi": or_hi };
        webSocket.send(JSON.stringify(message));
        
        orderFrm.reset();
    }
  </script>
</head>
<body>
	<form name="orderFrm">
		상품 : <select name="prod_num">
			<option value="100000">아메리카노</option>
			<option value="100001">카페라떼</option>
			<option value="100002">밀크티</option>
			<option value="100003">핫쵸코</option>
			<option value="100004">허니브레드</option>
			<option value="100005">크로와상</option>
		</select><br />
		사이즈 : Short <input type="radio" name="or_size" value="S" />
		Tall <input type="radio" name="or_size" value="T" />
		Grande <input type="radio" name="or_size" value="G" />
		Venti <input type="radio" name="or_size" value="V" /><br />
		수량 : <select name="or_count">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select><br />
		ice <input type="radio" name="or_hi" value="ice" />
		hot <input type="radio" name="or_hi" value="hot" /><br />
		<input type="button" value="결제" onclick="send()" />
	</form>
	<form name="memberFrm">
		<input type="hidden" name="mb_num" value="20190001" />
	</form>
</body>
</html>