<%@page import="java.util.Date"%>
<%@page import="kiosk.CategoryBean"%>
<%@page import="kiosk.ProductBean"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<jsp:useBean id="psMgr" class="kiosk.PosMgr" />
<jsp:useBean id="pMgr" class="kiosk.ProductMgr" />

<%
	request.setCharacterEncoding("UTF-8");
	String date = request.getParameter("date");
%>

<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.project-tab {
	padding-top: 10%;
	margin-top: -8%;
}

.project-tab #tabs {
	background: #007b5e;
	color: #eee;
}

.project-tab #tabs h6.section-title {
	color: #eee;
}

.project-tab #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active
	{
	color: #0062cc;
	background-color: transparent;
	border-color: transparent transparent #f3f3f3;
	border-bottom: 3px solid !important;
	font-size: 16px;
	font-weight: bold;
}

.project-tab .nav-link {
	border: 1px solid transparent;
	border-top-left-radius: .25rem;
	border-top-right-radius: .25rem;
	color: #0062cc;
	font-size: 16px;
	font-weight: 600;
}

.project-tab .nav-link:hover {
	border: none;
}

.project-tab thead {
	background: #f3f3f3;
	color: #333;
}

.project-tab a {
	text-decoration: none;
	color: #333;
	font-weight: 600;
}

.table td {
	padding: 0.25rem;
}
</style>
</head>

<body>
	<h1 align=center><%= date %></h1>

	<section id="tabs" class="project-tab">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
							<%
	int productByCount = 0;

	Vector<CategoryBean> clist = pMgr.getCategoryList();
	
	for (int i=0; i<clist.size(); i++) {
		CategoryBean cbean = clist.get(i);
		int ctg_num = cbean.getCtg_num();
		String ctg_name = cbean.getCtg_name();
%>

							<table class="table" cellspacing="0">
								<thead>
									<tr>
										<th colspan=4 style="text-align: center"><%= ctg_name %></th>
									</tr>
									<tr style="text-align: center;">
										<th style="width:40%">품목명</th>
										<th style="width:20%">가격</th>
										<th style="width:20%">개수</th>
										<th style="width:20%">합계금액</th>
									</tr>

								</thead>
								<%
		Vector<ProductBean> plist = pMgr.getProductList(ctg_num);

		for (int j=0; j<plist.size(); j++) {
			ProductBean pbean = plist.get(j);
			String prod_name = pbean.getProd_name();
			int prod_price = pbean.getProd_price();
			int prod_num = pbean.getProd_num();
			int totalCount = psMgr.getProductStatistics(prod_num, date);
			productByCount += prod_price * totalCount;
			
%>
								<tbody>
									<tr>
										<td><%=prod_name%></td>
										<td style="text-align:right"><%=prod_price%> 원</td>
										<td style="text-align:right"><%=totalCount %> 개</td>
										<td style="text-align:right"><%=prod_price * totalCount %> 원</td>
									</tr>
									<%}%>
								</tbody>
							</table>
							<%	
	}
%>
							<hr style="border: solid 2px black;">
							<hr style="border: solid 2px black;">
							
							<!-- 총 정산금액 START-->
							<table class="table" cellspacing="0">
								<% 
	int total = psMgr.getDayTotal(date);
	int shot = psMgr.getDayShot(date);
	int point = psMgr.getDayPoint(date);
	int gsize = psMgr.getDayGsize(date);
	int vsize = psMgr.getDayVsize(date);              
%>
								<tbody>
									<tr>
										<td style="width: 80%"><font size="5px" style="color: blue">총금액</font></td>
										<td style="width: 20%; text-align: right;"><%=productByCount %> 원</td>
									</tr>
									<tr>
										<td style="width: 80%"><font size="5px" style="color: blue">총 샷 추가(금액)</font></td>
										<td style="width: 20%; text-align: right;"><%=(shot)*500 %> 원</td>
									</tr>

									<tr>
										<td style="width: 80%"><font size="5px" style="color: blue">총 G-Size(금액)</font></td>
										<td style="width: 20%; text-align: right;"><%=(gsize) * 500%> 원</td>
									</tr>
									<tr>
										<td style="width: 80%"><font size="5px" style="color: blue">총 V-Size(금액)</font></td>
										<td style="width: 20%; text-align: right;"><%=(vsize)*1000%> 원</td>
									</tr>
									<tr>
										<td style="width: 80%"><font size="5px" style="color: blue">총 사용된 Point</font></td>
										<td style="width: 20%; text-align: right;"><%=point %> 점</td>
									</tr>

									<tr>
										<td style="width: 80%"><font size="5px" style="color: RED">순이익</font></td>
										<td style="width: 20%; text-align: right; color: RED"><%=total%> 원</td>
									</tr>
								</tbody>
							</table>
							<!-- 총 정산금액 END-->
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
</body>
</html>

