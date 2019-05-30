<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
	
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM");
	Date monDate = transFormat.parse(date);
	Calendar cal = Calendar.getInstance();
	cal.setTime(monDate);
	int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
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
							<table class="table" cellspacing="0">
								<thead>
									<tr style="text-align: center;">
										<th style="width:25%">일</th>
										<th style="width:25%">판매금액</th>
										<th style="width:25%">point</th>
										<th style="width:25%">매출액</th>
									</tr>

								</thead>
<%
		for (int i=1; i<=maxDay; i++) {
			int day_point = psMgr.getDayPoint(date + "-" + i);
			int day_total = psMgr.getDayTotal(date + "-" + i);
			int sales_amount = day_point + day_total;
%>
								<tbody>
									<tr>
										<td style="text-align:center"><%= i %> 일</td>
										<td style="text-align:right"><%= sales_amount %> 원</td>
										<td style="text-align:right"><%= day_point %> 점</td>
										<td style="text-align:right"><%= day_total %> 원</td>
									</tr>
									<%}%>
								</tbody>
							</table>
							
							<hr style="border: solid 2px black;">
							<hr style="border: solid 2px black;">
							
							<!-- 총 정산금액 START-->
							<table class="table" cellspacing="0">
<% 
	int total = psMgr.getMonTotal(date);
	int point = psMgr.getMonPoint(date);
%>
								<tbody>
									<tr>
										<td style="width: 80%"><font size="5px" style="color: blue">총금액</font></td>
										<td style="width: 20%; text-align: right;"><%= total+point %> 원</td>
									</tr>
									<tr>
										<td style="width: 80%"><font size="5px" style="color: blue">총 사용된 Point</font></td>
										<td style="width: 20%; text-align: right;"><%=point %> 점</td>
									</tr>
									<tr>
										<td style="width: 80%"><font size="5px" style="color: RED">매출액</font></td>
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
