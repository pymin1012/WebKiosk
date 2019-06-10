<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

<%
	SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String nowdate = new_format.format(date);
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="d-flex justify-content-between p-3">
					<div id="dayCalender" class="project-calender">
						일별 정산 : <input type="date" id="dayCal" />
					</div>
					<div id="dayCalender" class="project-calender">
						월별 정산 : <input type="month" id="monCal" />
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	<div id="calBody"></div>
	
<script>
	$(function() {
		$('#dayCal').change(function() {
			$.ajax({
				type: "POST",
				url: "dayCalculate.jsp",
				data: "date=" + $(this).val(),
				dataType: "HTML",
				success: function(res) {
					$('#calBody').html(res);
 				}
			});
		});
		
		$('#monCal').change(function() {
			$.ajax({
				type: "POST",
				url: "monCalculate.jsp",
				data: "date=" + $(this).val(),
				dataType: "HTML",
				success: function(res) {
					$('#calBody').html(res);
 				}
			});
		});
		
		var date = '<%= nowdate %>';

		$.ajax({
			type: "POST",
			url: "dayCalculate.jsp",
			data: "date=" + date,
			dataType: "HTML",
			success: function(res) {
				$('#calBody').html(res);
			}
		});
	});
</script>
</body>
</html>