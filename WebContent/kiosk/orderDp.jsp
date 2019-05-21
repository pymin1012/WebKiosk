<%@page import="kiosk.ProductBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pMgr" class="kiosk.ProductMgr"/>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />

<%
	int prod_num = Integer.parseInt(request.getParameter("prod_num"));
	ProductBean pBean = pMgr.getProduct(prod_num);
	int prod_price = pBean.getProd_price();
	int ctg_num = pBean.getCtg_num();
	String prod_img = pBean.getProd_img();
	String prod_iimg = pBean.getProd_iimg();
	
	int or_basket = 0;
%>

<html lang="ko">
<head>
<!-- main -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<!-- count -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
.card {
	width: 800px;
	margin-top: 40px;
}

.qty .count {
    color: #000;
    display: inline-block;
    vertical-align: top;
    font-size: 25px;
    font-weight: 700;
    width : 50px;
    line-height: 20px;
    padding: 0 2px
    ;min-width: 25px;
    text-align: center;
}

.qty .plus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 30px;
    height: 30px;
    font: 30px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
}

.qty .minus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 30px;
    height: 30px;
    font: 30px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    background-clip: padding-box;
}

.card-body {
	margin-top: 20px;
}

.form-select {
	margin-top: 10px;
	margin-bottom: 10px;
}

#ice, #hot {
	display: none;
	margin: 10px;
}

.img-big-wrap {
	margin-top: 50px;
}

.order-button {
	margin-top: 60px;
	padding-left: 5px;
}
</style>
<script type="text/javascript">
	function changeImg(hi) {
		document.getElementById("or_hi").value = hi;
		if (hi == 'ICE') {
			var i = document.getElementById("prod_img");
			i.src = "../menu_pic/<%= pBean.getProd_iimg() %>";
		} else if (hi == 'HOT') {
			var i = document.getElementById("prod_img");
			i.src = "../menu_pic/<%= pBean.getProd_img() %>";
		}
	}

	/* +-button */
	$(document).ready(function() {
		$('.count').prop('disabled', true);
		
		$(document).on('click', '.plus', function() {
			$('.count').val(parseInt($('.count').val()) + 1);
			$('.price-total').text($('.count').val() * <%= prod_price %>);
		});
		
		$(document).on('click', '.minus', function() {
			$('.count').val(parseInt($('.count').val()) - 1 );
			if ($('.count').val() == 0) {
				$('.count').val(1);
			}
			$('.price-total').text($('.count').val() * <%= prod_price %>);
    	});
		
		var $frm = $(".orderFrm");
		$frm.on('submit', function(e) {
			e.preventDefault();
			$('#or_count').removeAttr('disabled');
			var myData = $frm.serialize();
			
			$.ajax({
				type: "POST",
				url: $frm.attr("action"),
				data: myData,
				dataType: "JSON",
				success: function(res) {
					var ctg_num = <%= pBean.getCtg_num() %>;
					
					var src = $('#prod_img').attr('src');
					var price = $('.price-total').text();
					var id = <%= prod_num %>;
					var decription = '<%= pBean.getProd_name() %>';
					var count = $('#or_count').val();
					var shot = $("#or_shot option:selected").val();
					var size = $(':radio[name="or_size"]:checked').val();
					switch (size) {
					case 'S':
						size = 'Small'; break;
					case 'T':
						size = 'Tall'; break;
					case 'G':
						size = 'Grande'; break;
					case 'V':
						size = 'Venti'; break;
					}
					var whipping = $("input:checkbox[id='or_whip']").is(":checked")?'휘핑 추가':'휘핑 없음';
					var or_basket = res.result;
					
					$(opener.productData).attr('img', src);
					$(opener.productData).attr('price', parseInt(price));
					$(opener.productData).attr('id', parseInt(id));
					$(opener.productData).attr('decription', decription);
					$(opener.productData).attr('count', parseInt(count));
					if (shot != undefined) $(opener.productData).attr('shot', parseInt(shot));
					if (size != undefined) $(opener.productData).attr('size', size);
					if (ctg_num == 1) $(opener.productData).attr('whipping', whipping);
					$(opener).attr('productCounter', or_basket);
					$(opener.fns.addToCard());
 					self.close();
 				}
			});
		});
		
		$(document).on('click', '.cancle', function() {
			self.close();
		});
	});
</script>
</head>

<body>
		<div class="card mx-auto">
			<form class="orderFrm" action="orderDpProc.jsp">
				<div class="row">
					<aside class="col-sm-6 mx-auto my-auto">
						<article class="gallery-wrap">
							<div class="img-big-wrap p-1">
<% 
	if (prod_iimg != null) {
%>
								<img src="../menu_pic/<%= pBean.getProd_iimg() %>" id="prod_img" style="width: 100%; height: auto;">
<%
	} else {
%>
								<img src="../menu_pic/<%= pBean.getProd_img() %>" id="prod_img" style="width: 100%; height: auto;">
<% 
	}
%>						
							</div>
						</article>
						<div class="order-button">
							<div class="d-flex justify-content-between">
								<input type="submit" class="btn btn-lg btn-primary text-uppercase" value="담기">
								<a href="#" class="btn btn-lg btn-primary text-uppercase cancle">취소</a>
							</div>
						</div>
					</aside>
				
					<aside class="col-sm-6">
						<article class="card-body">
							<h3 class="title mb-3 text-center" id="prod_text"><%= pBean.getProd_name() %></h3>
							<hr>
							<span>제품설명</span><br>
							<span>칼로리 : <%=pBean.getProd_kcal() %> kcal</span><br>
							<span>원산지 : <%=pBean.getProd_coo() %></span>
							<hr />
						
							<input type="hidden" name="prod_name" value="<%= pBean.getProd_name() %>" />
							<input type="hidden" name="prod_num" value="<%= pBean.getProd_num() %>" />
							<input type="hidden" name="img_src" id="img_src" value="" />	
												

<%
	if (ctg_num != 4) {
%>
							<div class="form-group">
								<input type="hidden" name="or_hi" id="or_hi" value="ICE"/>
<%
		if (prod_img != null){
%>

								<a href="javascript:changeImg('HOT')" class="btn btn-lg btn-danger text-white text-uppercase"><i class="fa fa-coffee" aria-hidden="true"></i>hot</a>
<% 
		}
		if (prod_iimg != null) {
%>
								<a href="javascript:changeImg('ICE')" class="btn btn-lg btn-primary text-white text-uppercase"><i class="fa fa-snowflake" aria-hidden="true"></i>&nbsp;ice</a>						
<%
		}
%>
							</div>

							<div class="form-group">
								<label class="form-select-title h5">SIZE</label><br>
								<label class="form-check form-check-inline h6">
<% 
		if (ctg_num == 1) {
%>
									<span class="form-check-label"></span>Small&nbsp;
									<input class="form-check-input" type="radio" name="or_size" id="size1" value="S">
<%
		}
%>
									<span class="form-check-label"></span>&nbsp; Tall&nbsp;
									<input class="form-check-input" type="radio" name="or_size" id="size2" value="T">
<% 
		if (ctg_num == 1) {
%>
									<span class="form-check-label"></span>&nbsp; Grande&nbsp;
									<input class="form-check-input" type="radio" name="or_size" id="size3" value="G">
<%
		}
%>
									<span class="form-check-label"></span>&nbsp; Venti&nbsp;
									<input class="form-check-input" type="radio" name="or_size" id="size4" value="V">
								</label>
							</div>
<% 
	}
%>
<%
	if (pBean.getCtg_num() == 1) {
%>
							<div class="form-group">
								<label class="form-select-title h5">SHOT : </label>
								<select class="form-control-inline form-control-sm" name="or_shot" id="or_shot" style="width: 70px;">
									<option>0</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
							</div>
							
							<div class="form-check" style="padding-left:0px;">
								<label class="form-select-title h5">Whipping</label>
								<input type="checkbox" class="form-check-input-inline" name="or_whip" id="or_whip" value="true">
							</div>
<% 
	}
%>
							
							<div class="form-select">
								<div class="qty mt-6">
									<span class="minus bg-primary"> - </span>
									<input type="number" class="count" name="or_count" id="or_count" value="1">
									<span class="plus bg-primary"> + </span>
								</div>
							</div>
						
							<hr>
							
							<div class="price-detail-wrap">
								<input type="hidden" name="price" id="price" value="0"/>
								<label class="price h5">Price</label>
								<p class="price h3 text-right">
									<span class="price-total"><%= prod_price %></span> 원 
								</p>
							</div>
						</article>
					</aside>
				</div>
			</form>	
		</div>
</body>
</html>