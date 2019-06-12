<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bMgr" class="kiosk.BoardMgr" />
<%
	session.setAttribute("idKey", "board");

	Vector<Integer> awaitList = bMgr.getAwaitOrderNum();
	Vector<Integer> readyList = bMgr.getReadyOrderNum();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문현황판</title>
<script>
	var webSocket = new WebSocket('ws://' + location.host + ':80/WebKiosk/broadcasting');
    
    webSocket.onerror = function(event) { onError(event) };
    webSocket.onopen = function(event) { onOpen(event) };
    webSocket.onmessage = function(event) { onMessage(event)};
	var audio = new Audio('dingdong.mp3');
    
    function onMessage(event) {
		var flag = event.data;
		if (flag == 'reload') {
			showBoard();
		}
		else if (flag == 'ready') {
			showBoard();
			audio.play();
			setTimeout(function() { audio.play() }, 3000);
		}
    }
    
    function onOpen(event) {
		showBoard();
    }
    
    function onError(event) {
      alert(event.data);
    }
    
    function showBoard() {
    	var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("boardAjax").innerHTML = xhttp.responseText;
			}
		};
				
		xhttp.open("POST", "http://" + location.host + "/WebKiosk/board/boardAjax.jsp", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	    xhttp.send(null);
    }
</script>
</head>

<body>
	<div id="boardAjax"></div>
</body>
