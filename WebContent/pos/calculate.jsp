<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>


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
	});
</script>
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
</body>
</html>