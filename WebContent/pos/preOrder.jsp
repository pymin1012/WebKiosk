<%@page import="kiosk.PosMgr"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="psMgr" class="kiosk.PosMgr" />

<% 
	request.setCharacterEncoding("EUC-KR");
	Vector<OrderHistoryBean> vl = psMgr.getPreOrderHistoryList();
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="style2.css" />
</head>

<body>
	<div align="center">
<%
	for (int i=0; i<vl.size(); i++) {
		OrderHistoryBean vlbean = vl.get(i);
%>
		<div class="container">
			<div class="row">
				<div class="col-12">
				   
				    <ul class="topics-table">
				        <li class="topics-header">
				           <ul class="header-titles" style="color:blue">
				               <li>주문번호</li>
				               <li>주문상태</li>
				               <li>고객번호</li>
				               <li>장소</li>
				           </ul>
				        </li>
				        
				        <li class="topics-body">
				           <ul class="topic-item-1">
				               <li> <%=vlbean.getOh_num() %></li>
			                    <li><%=vlbean.getOh_status() %></li>
			                    <li><%=vlbean.getMb_num() %></li>
		                        <li><%=vlbean.getOh_io() %></li>
				           </ul>
				        </li>
				        
				        <li class="topics-body">
				            <ul class="topic-item-2" >
				        		<li style="color:blue">주문날짜</li>
				        		<li style="width:75%"><%=vlbean.getOh_date() %></li>
				        	</ul>
				        </li>		        
				        
				        <li class="topics-body">
				            
				            <ul class="topic-item-3" style="color:black">
								<li>comment</li>
								<li style="width:75%"><%=vlbean.getOh_comment() %></li>
				            </ul>
				            
				            <ul class="topic-item-3">
				            	<li style="color:#d39e00">point</li>
				            	<li style="color:#d39e00"><%=vlbean.getOh_point()%>p</li>
				            	<li style="color:red">total</li>
								<li style="color:red"><%=vlbean.getOh_total() %>원</li>
				            </ul>
				        </li>
				    </ul>
				</div>
			</div>
		</div>
<%
	}
%>
</div>
</body>
</html>
