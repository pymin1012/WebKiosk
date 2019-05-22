<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="kiosk.ProductBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pMgr" class="kiosk.ProductMgr"/>
<jsp:useBean id="mMgr" class="kiosk.MemberMgr"/>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<jsp:useBean id="kMgr" class="kiosk.KioskMgr" />

<%
	request.setCharacterEncoding("UTF-8");
	int oh_total = Integer.parseInt(request.getParameter("oh_total"));
	int oh_point = Integer.parseInt(request.getParameter("oh_point"));
	String oh_comment = request.getParameter("oh_comment");
	
	int mb_num = 0;
	if (session.getAttribute("mb_num") != null) {
		mb_num = ((Integer)(session.getAttribute("mb_num"))).intValue();
	}
	String oh_io= null;
	if (session.getAttribute("oh_io") != null) {
		oh_io = (String)session.getAttribute("oh_io");
	}
	OrderHistoryBean ohBean = new OrderHistoryBean();
	
	ohBean.setMb_num(mb_num);
	ohBean.setOh_comment(oh_comment);
	ohBean.setOh_io(oh_io);
	ohBean.setOh_point(oh_point);
	ohBean.setOh_total(oh_total);
	kMgr.insertOrderHistory(ohBean);
		
	int oh_num = kMgr.getRecentOrderNum();
	int or_basket = 0;
	LinkedHashMap<Integer, OrdersBean> blist = bMgr.getBasketList();
	for(int key: blist.keySet()) {
		OrdersBean obean = blist.get(key);
		ProductBean pbean = pMgr.getProduct(obean.getProd_num());
		obean.setOh_num(oh_num);
		or_basket++;
		obean.setOr_basket(or_basket);
		kMgr.insertOrders(obean);
	}
	mMgr.updatePoint(mb_num, -(oh_point));
	mMgr.updatePoint(mb_num, (int)(oh_total * 0.05));
	
	session.removeAttribute("oh_io");
	session.removeAttribute("bMgr");
%>

<script >
	alert('<%="결제가 완료되었습니다."%>');
	location.href ="orderHistoryPage.jsp?oh_num=<%= oh_num %>";
</script>
