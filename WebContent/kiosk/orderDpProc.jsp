<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<jsp:useBean id="oBean" class="kiosk.OrdersBean" />
<jsp:setProperty property="*" name="oBean"/>

<%= oBean.getOr_count() %>
<%= oBean.getOr_hi() %>
<%= oBean.getOr_shot() %>
<%= oBean.getOr_size()  %>
<%= oBean.getProd_num()  %>
<%= oBean.isOr_whip() %>