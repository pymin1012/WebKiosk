<%@page import="org.json.simple.JSONObject"%>
<%@page import="kiosk.ProductBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<jsp:useBean id="oBean" class="kiosk.OrdersBean" />
<jsp:setProperty property="*" name="oBean"/>
<%
	int num = bMgr.addBasket(oBean);

	JSONObject json = new JSONObject();
	json.put("result", num);
	
	response.setContentType("application/json");
	out.print(json.toJSONString());
%>