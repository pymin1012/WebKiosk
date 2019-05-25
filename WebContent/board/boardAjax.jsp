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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet" media="all">

<style>
/*plans css*/
body {
	background: #000000;
}

.plans .title-head {
	color: #fff;
	font-size: 70px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: bold;
}

.panel-pricing {
	-moz-transition: all .3s ease;
	-o-transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

.panel-pricing .panel-heading {
	padding: 30px;
	color: #ffffff;
	border-color: #18A8F1;
}

.lpanel, .rpanel {
	background-color: black;
	border: 3px solid !important;
	border-color: #ffffff;
}

.p-title {
	color: #ffffff;
	font-size: 150px;
	font-weight: bold;
	text-align: center;
	text-transform: capitalize;
}

.p-title-a {
	font-size: 75px;
	font-weight: bold;
	text-align: center;
	text-transform: capitalize;
}
</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="plans col-md-12 col-sm-12 col-xs-12 text-center" style="margin-top:30px; margin-bottom:30px;">
				<div>
					<span class="title-head">주문하신 제품이 나왔습니다.</span>
				</div>
			</div>
		</div>
		
		<!-- 좌측패널 -->
		<div class="row">
			<div class="col-md-8 col-sm-8 col-xs-12 text-center">
				<div class="panel lpanel panel-pricing">
					<div class="panel-heading">
						<font size="100px">현재번호</font>
					</div>
					<!--panel-heading close-->
					<div class="panel-body text-center" style="height: 600px">
<%
	for (int i=0; i<readyList.size(); i++) {
		int rnum = readyList.get(i);
		out.println("<p class='p-title'>" + rnum + "</p>");
	}
%>
					</div>
				</div>
			</div>
		
			<!-- 우측패널 -->
			<div class="col-md-4 col-sm-4 col-xs-12 text-center">
				<div class="panel rpanel panel-pricing">
					<div class="panel-heading">
						<font size="100px">대기번호</font>
					</div>
					<!--panel-heading close-->
					<div class="panel-body text-center" style="height: 600px">
<%
	for (int i=0; i<awaitList.size(); i++) {
		int anum = awaitList.get(i);
		out.println("<p class='p-title-a'>" + anum + "</p>");
	}
%>					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
