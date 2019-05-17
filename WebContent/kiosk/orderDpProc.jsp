<%@page import="kiosk.ProductBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<jsp:useBean id="oBean" class="kiosk.OrdersBean" />
<jsp:setProperty property="*" name="oBean"/>

<%
	bMgr.addBasket(oBean);
%>

<script>
	self.close();
</script>