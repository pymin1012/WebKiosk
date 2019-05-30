<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="kiosk.MemberMgr" />
<% 
	int mb_num = 0;
	if (session.getAttribute("mb_num") != null) {
		mb_num = ((Integer)(session.getAttribute("mb_num"))).intValue();
	}
	
	int totalRecord = 0;
	int recordPerPage = 10;
	int pagePerBlock = 5;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 1;
	int nowBlock = 1;
	
	int start = 0;
	int end = recordPerPage;
	
	totalRecord = mMgr.getTotalCount(mb_num);
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage - 1) * recordPerPage;
	
	totalPage = (int) Math.ceil((double) totalRecord / recordPerPage);
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>

<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>
$(function(){
	$('#orderHistoryModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget); 
		var oh_num = button.data('oh-num');
		var modal = $(this);
		modal.find('.modal-content').load('orderHistoryModal.jsp?oh_tnum=' + oh_tnum);
	});
});

function paging(page) {
	document.readFrm.nowPage.value = page;
	document.readFrm.submit();
}
</script>

<style>
.modal {
	text-align: center;
	padding: 0!important;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal-dialog {
	display: inline-block;
	vertical-align: middle;
	max-width: 100%;
	width: 40%;
	background: #fff;
	z-index: 11;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<jsp:include page="logout.jsp" />
				<div class="panel panel-primary mt-3">
					<div class="panel-heading">
						<span class="glyphicon glyphicon-list"></span>&nbsp;주문내역
					</div>
					<div class="panel-body">
						<ul class="list-group">
<%
	Vector<OrderHistoryBean> ohlist = mMgr.getMemberOrderHistory(mb_num, start, end);
	if (ohlist.isEmpty()) {
%>
							<li class="list-group-item">
								<div>
									<span>주문한 내역이 없습니다.</span>
								</div>
							</li>
<% 
	} else {
%>
							<li class="list-group-item">
								<table style="width:100%">
										<tr>
											<td style="width:15%">번호</td>
											<td style="width:35%">주문날짜</td>
											<td style="width:25%">사용 포인트</td>
											<td style="width:25%">총 계산금액</td>
										</tr>
								</table>
							</li>
<%
		for (int i=0; i< ohlist.size(); i++) {
			OrderHistoryBean ohbean = ohlist.get(i);
%>
							<li class="list-group-item">
									<table style="width:100%">
										<tr>
											<td style="width:15%"><%= ((nowPage - 1) * recordPerPage) + i + 1 %></td>
											<td style="width:35%"><a href="#" data-toggle="modal" data-target="#orderHistoryModal" data-oh-tnum="<%= ohbean.getOh_tnum() %>"><%= ohbean.getOh_date() %></a></td>
											<td style="width:25%"><%= ohbean.getOh_point() %> 점</td>
											<td style="width:25%"><%= ohbean.getOh_total() %> 원</td>
										</tr>
									</table>
							</li>
<%
		}
	}
%>
						</ul>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-md-6">
								<h6>
									총 주문 수 : <span class="label label-info"><%= totalRecord %></span>
								</h6>
							</div>
							<div class="col-md-6">
								<ul class="pagination pagination-sm pull-right">
<% 
	int pageStart = (nowBlock - 1) * pagePerBlock + 1;
	int pageEnd = (pageStart + pagePerBlock < totalPage) ? pageStart + pagePerBlock : totalPage + 1;
	if (totalPage != 0) { 

		if (nowBlock > 1) {
%>
									<li><a href="javascript:block('<%= nowBlock - 1 %>', 0)">«</a></li>
<% 
		}
		/* 페이징 */
		for(; pageStart < pageEnd; pageStart++) {
			if (pageStart == nowPage) {
%>
									<li><a href="javascript:paging('<%=pageStart %>')"><font color="red"><%=pageStart %></font></a></li>
<%
			} else {
%>
									<li><a href="javascript:paging('<%=pageStart %>')"><%=pageStart %></a></li>
<%
			}
		}
		
		/* 다음 블럭 */
		if (totalBlock > nowBlock) {
%>
									<li><a href="javascript:block('<%= nowBlock %>', 1)">»</a></li>
<% 
		}
	}
%>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<form name="readFrm">
		<input type="hidden" name="nowPage" value="<%= nowPage %>" />
		<input type="hidden" name="recordPerPage" value="<%= recordPerPage %>" />
	</form>
	
<!-- modal 창 -->
	<div class="modal fade" id="orderHistoryModal" tabindex="-1" role="dialog" aria-labelledby="orderHistoryModalLabel" aria-hidden="true">
		<div class="modal-dialog mx-auto my-auto">
			<div class="modal-content">
			</div>
		</div>
	</div></body>
</html>
