<%@page import="kiosk.ProductBean"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="psMgr" class="kiosk.PosMgr" />
<jsp:useBean id="kMgr" class="kiosk.KioskMgr" />
<jsp:useBean id="pMgr" class="kiosk.ProductMgr"/>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<% 
		request.setCharacterEncoding("UTF-8");
		Vector<OrderHistoryBean> ohlist = psMgr.getReadyOrderHistoryList();
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
	for (int i=0; i<ohlist.size(); i++) {
		OrderHistoryBean vlbean = ohlist.get(i);
%>
<div class="container">
	<div class="row">
		<div class="col-4">
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
<%
		Vector<OrdersBean> olist = kMgr.getOrdersList(vlbean.getOh_num());
		for(int j=0; j<olist.size(); j++) {
			OrdersBean obean = olist.get(j);
			ProductBean pbean = pMgr.getProduct(obean.getProd_num());
%>	        
		     
		        <li class="topics-body">
		            <ul class="topic-item-2" >
		            	<li style="width:5%"><%=obean.getOr_basket() %></li>
		        		<li style="color:blue"><%=pbean.getProd_name()%></li>
		        		<li style="width:70%">size:<%=obean.getOr_size()%>, 수량:<%=obean.getOr_count()%>, 샷:<%=obean.getOr_shot()%>, 휘핑:<%=obean.isOr_whip()%>, tem:<%=obean.getOr_hi()%></li>
		        	</ul>
		        </li>		        		        

<%
		}
%>	        
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
