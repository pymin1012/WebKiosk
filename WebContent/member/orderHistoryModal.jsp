<%@page import="kiosk.ProductBean"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="java.util.Vector"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="psMgr" class="kiosk.PosMgr" />
<jsp:useBean id="kMgr" class="kiosk.KioskMgr" />
<jsp:useBean id="pMgr" class="kiosk.ProductMgr" />

<%
	int oh_tnum = Integer.parseInt(request.getParameter("oh_tnum"));
	OrderHistoryBean ohBean = psMgr.getOrderHistory(oh_tnum);
	
	String flag = request.getParameter("flag");
	int totalEvent = 0;
%>

<link rel="stylesheet" href="style2.css" />

<div class="container w-100">
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="check-table col-12">
					<ul class="topics-table">
						<li class="topics-header">
							<ul class="header-titles" style="color: blue">
								<li>주문번호</li>
								<li>고객번호</li>
								<li>장소</li>
								<li style="width: 40%;">주문날짜</li>
							</ul>
						</li>

						<li class="topics-body">
							<ul class="topic-item">
								<li><%=ohBean.getOh_num()%></li>
								<li><%=ohBean.getMb_num()%></li>
								<li><%=ohBean.getOh_io()%></li>
								<li style="width: 40%"><%=ohBean.getOh_date()%></li>
							</ul>
						</li>

						<li class="product-header">
							<ul class="product-titles" style="color: Blueviolet">
								<li>No.</li>
								<li style="width: 35%">상품</li>
								<li>수량</li>
								<li>사이즈</li>
								<li>샷</li>
								<li>휘핑</li>
								<li style="width: 15%">HOT/ICE</li>
							</ul>
						</li>
<%
		Vector<OrdersBean> olist = kMgr.getOrdersList(ohBean.getOh_num());
		for (int j = 0; j < olist.size(); j++) {
			OrdersBean obean = olist.get(j);
			ProductBean pbean = pMgr.getProduct(obean.getProd_num());
			String or_size = obean.getOr_size();
			String or_hi = obean.getOr_hi();
			if (or_size == null) or_size = "&nbsp;";
			if (or_hi == null) or_hi = "&nbsp;";
			totalEvent += obean.getOr_event();

%>

						<li class="product-body">
							<ul class="product-item">
								<li><%=obean.getOr_basket()%></li>
								<li style="width: 35%"><%=pbean.getProd_name()%></li>
								<li><%= obean.getOr_count() %></li>
								<li><%= or_size %></li>
								<%
			int ctg_num = pbean.getCtg_num();
			if (ctg_num != 1) {
%>
								<li>&nbsp;</li>
								<li>&nbsp;</li>
								<%
			} else {
%>
								<li><%=obean.getOr_shot()%></li>
								<li><%=obean.isOr_whip()?"추가":"없음"%></li>
								<%
			}
%>
								<li style="width: 15%"><%= or_hi %></li>
							</ul>
						</li>

						<%
	}
%>

						<li class="footer-body">
							<ul class="footer-item"
								style="color: black; border-top: 2px solid var(--teal-color);">
								<li>comment</li>
								<li style="width: 75%; text-align: left"><%=ohBean.getOh_comment()%></li>
							</ul>

							<ul class="footer-item">
								<li style="color: #d39e00">point</li>
								<li style="color: #d39e00"><%=ohBean.getOh_point()%>p</li>
								<li style="color: red">event</li>
								<li style="color: red"><%= totalEvent %>원</li>
							</ul>
									
							<ul class="footer-item">
								<li style="color: black; width: 50%;">total</li>
								<li style="color: black; width: 50%;"><%=ohBean.getOh_total()%>원</li>
							</ul>	
						</li>
					</ul>
				</div>
				<div class="check-button col-12 mb-3">
					<div class="d-flex justify-content-end">
						<div>
							<button class="btn btn-warning" data-dismiss="modal">이전</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>