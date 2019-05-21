<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />

<%
		request.setCharacterEncoding("UTF-8");
		String flag = request.getParameter("flag");
		
		if (flag.equals("all")) {
			session.removeAttribute("bMgr");
			response.sendRedirect("orderPage.jsp");
		} else {
			int key = Integer.parseInt(flag);
			bMgr.deleteBasket(key);
			if (bMgr.isBasketEmpty()) {
				response.sendRedirect("orderPage.jsp");
			} else {
				response.sendRedirect("payment.jsp");
			}
		}
%>
