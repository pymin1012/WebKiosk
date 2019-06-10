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
	
	// 이벤트 금액
	int ev_price = pMgr.getEventProductPrice(prod_num);
%>

<html>
<head>
<link rel="stylesheet" href="style2.css" />
<script type="text/javascript">
	window.document.onselectstart = new Function("return false");    //더블클릭시 선택되지 않게
	window.document.ondragstart = new Function("return false");
	
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
		var ev_price =  <%= ev_price %>;
		var prod_price = <%= prod_price %>;
		var now_price = (ev_price!=0) ? ev_price : prod_price;
		var size_price = 0;
		var shot_price = 0;
		
		$('.count').prop('disabled', true);
		
		$('#size1').click(function() {
			size_price = 0;
			var tot = (now_price + size_price + shot_price) * $('.count').val();
			$('.price-total').text(tot);
		})
		
		$('#size2').click(function() {
			size_price = 500;
			var tot = (now_price + size_price + shot_price) * $('.count').val();
			$('.price-total').text(tot);
		})
		
		$('#size3').click(function() {
			size_price = 1000;
			var tot = (now_price + size_price + shot_price) * $('.count').val();
			$('.price-total').text(tot);
		})
		
		$('#or_shot').change(function() {
			var value = $(this).val();
			if (value != '') {
				shot_price = value * 500;
			} else {
				shot_price = 0;
			}
			var tot = (now_price + size_price + shot_price) * $('.count').val();
			$('.price-total').text(tot);
		})
		
		$('.plus').click(function() {
			$('.count').val(parseInt($('.count').val()) + 1);
			$('.price-total').text($('.count').val() * (now_price + size_price + shot_price));
			console.log("hi : " + $('.count').val())
		});
		
		$('.minus').click(function() {
			$('.count').val(parseInt($('.count').val()) - 1 );
			if ($('.count').val() == 0) {
				$('.count').val(1);
			}
			$('.price-total').text($('.count').val() * (now_price + size_price + shot_price));
		});
		
		var $frm = $(".orderFrm");
		$frm.on('submit', function(e) {
			e.preventDefault();
			$('#or_count').removeAttr('disabled');
			$('#or_event').val((ev_price != 0)?((prod_price - ev_price)* $('#or_count').val()):0);
			var myData = $frm.serialize();
			
			$.ajax({
				type: "POST",
				url: $frm.attr("action"),
				data: myData,
				dataType: "JSON",
				success: function(res) {
					var ctg_num = <%= pBean.getCtg_num() %>;
					productData.img = $('#prod_img').attr('src');
					productData.price = parseInt($('.price-total').text());
					productData.id = parseInt(<%= prod_num %>);
					productData.decription = '<%= pBean.getProd_name() %>';
					productData.count = parseInt($('#or_count').val());
					var shot = $("#or_shot option:selected").val();
					if (shot != undefined) productData.shot = parseInt(shot);
					var size = $(':radio[name="or_size"]:checked').val();
					switch (size) {
					case 'T':
						size = 'Tall'; break;
					case 'G':
						size = 'Grande'; break;
					case 'V':
						size = 'Venti'; break;
					}
					if (size != undefined) productData.size = size;
					var whipping = $("input:checkbox[id='or_whip']").is(":checked")?'휘핑 추가':'휘핑 없음';
					if (ctg_num == 1) productData.whipping = whipping;
					productCounter = res.result;
					fns.addToCard();
					console.log('hi');
					$(".modal").modal('hide');
					$('body').removeClass('modal-open');
					$('.modal-backdrop').remove(); 
 				}
			});
		});
	});
</script>
</head>

<body>
	<div class="card">
		<form class="orderFrm" action="orderModalProc.jsp">
			<input type="hidden" name="or_event" id="or_event" />
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
							<input type="submit" class="btn btn-lg btn-primary ml-3 text-uppercase" value="담기">
							<a href="#" class="btn btn-lg btn-danger mr-3 text-white text-uppercase" data-dismiss="modal">취소</a>
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
						
						<input type="hidden" name="prod_num" value="<%= pBean.getProd_num() %>" />												
<%
	if (ctg_num != 4) {
%>
						<div class="form-group">
<%
		if (prod_img != null && prod_iimg != null){
%>
							<input type="hidden" name="or_hi" id="or_hi" value="ICE"/>
							<a href="javascript:changeImg('HOT')" class="btn btn-lg btn-danger text-white text-uppercase"><i class="fa fa-coffee" aria-hidden="true"></i>hot</a>
							<a href="javascript:changeImg('ICE')" class="btn btn-lg btn-primary text-white text-uppercase"><i class="fa fa-snowflake" aria-hidden="true"></i>&nbsp;ice</a>						
<% 
		} else if (prod_iimg != null) {
%>
							<input type="hidden" name="or_hi" id="or_hi" value="ICE"/>
							<a href="javascript:changeImg('ICE')" class="btn btn-lg btn-primary text-white text-uppercase"><i class="fa fa-snowflake" aria-hidden="true"></i>&nbsp;ice</a>						
<%
		} else if (prod_img != null) {
%>
							<input type="hidden" name="or_hi" id="or_hi" value="HOT"/>
							<a href="javascript:changeImg('HOT')" class="btn btn-lg btn-danger text-white text-uppercase"><i class="fa fa-coffee" aria-hidden="true"></i>hot</a>
<%
		}
%>
						</div>

						<div class="form-group">
							<label class="form-check form-check-inline h5">
								<span class="form-check-label"></span><span class="text-center">Tall<br><small class="text-danger">(+0)</small></span>&nbsp;
								<input class="form-check-input" type="radio" name="or_size" id="size1" value="T" required>&nbsp;&nbsp;&nbsp;&nbsp;
<% 
		if (ctg_num == 1) {
%>
								<span class="form-check-label"></span><span class="text-center">Grande<br><small class="text-danger">(+500)</small></span>&nbsp;
								<input class="form-check-input" type="radio" name="or_size" id="size2" value="G">&nbsp;&nbsp;&nbsp;&nbsp;
<%
		}
%>
								<span class="form-check-label"></span><span class="text-center">Venti<br><small class="text-danger">(+1000)</small></span>&nbsp;
								<input class="form-check-input" type="radio" name="or_size" id="size3" value="V">
							</label>
						</div>
<% 
	} 

	if (pBean.getCtg_num() == 1) {
%>
						<div class="form-group">
							<small class="text-danger">* 샷 한번 추가시 500원</small><br>
							<label class="form-select-title h5">SHOT  :</label>&nbsp;&nbsp;
							<select class="form-control-inline form-control-sm" name="or_shot" id="or_shot" style="width: 80px;" required>
							    <option value="">선택</option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
							
						<div class="form-check" style="padding-left:0px;">
							<label class="form-select-title h5">Whipping</label>&nbsp;&nbsp;&nbsp;&nbsp;
        					<label class="switch">
            					<input type="checkbox" class="form-check-input-inline" name="or_whip" id="or_whip" value="true">
            					<span class="slider"></span>
        					</label>
						</div>
<% 
	}
%>

						<div class="form-select">
							<div class="qty mt-6">
								<span class="minus bg-success"> - </span>&nbsp;&nbsp;
								<input type="text" class="count" name="or_count" id="or_count" value="1">&nbsp;&nbsp;
								<span class="plus bg-success"> + </span>
							</div>
						</div>
						<hr>
							
						<div class="price-detail-wrap">
							<input type="hidden" name="price" id="price" value="0"/>
							<label class="price h5">Price</label>
							<p class="price h3 text-right">
								<span class="price-total"><%= (ev_price != 0)?ev_price:prod_price %></span> 원 
							</p>
						</div>
					</article>
				</aside>
			</div>
		</form>	
	</div>
</body>
</html>