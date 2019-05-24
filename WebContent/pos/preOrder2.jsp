<%@page import="kiosk.PosMgr"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="psMgr" class="kiosk.PosMgr" />

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<% 
		request.setCharacterEncoding("EUC-KR");
		Vector<OrderHistoryBean> vl = psMgr.getPreOrderHistoryList();
%>
<style>
:root {
	--teal-color: #24A9A7;
	--purple-color: #9E41CC;
}

body {
    background-color: #fff;
    color: var(--teal-color);
}

ul {
    padding: 0;
    list-style: none;
}

.topics-table {
    margin-top: 1rem;
    padding: 8px;
    border: 2px solid var(--teal-color);
    border-radius: 10px;
}

.topics-table a {
    /*color: var(--purple-color);*/
}

ul.header-titles, li.topics-body, li.topics-body ul {
    overflow: hidden;
}

li.topics-header, ul[class^='topic-item-'] {
    padding: 8px;
}

ul[class^='topic-item-'] {
    border-top: 1px solid var(--teal-color);
}

.header-titles li, ul[class^='topic-item-'] li {
    width: 25%;
    float: left;

}

.badge {
    font-weight: normal;
}
</style>

<html>

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
