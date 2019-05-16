<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="ko">
<head>
<!-- main -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<!-- count -->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
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
</style>
<script type="text/javascript">
/* +-button */
$(document).ready(function(){
    $('.count').prop('disabled', true);
		$(document).on('click','.plus',function(){
		$('.count').val(parseInt($('.count').val()) + 1 );
	});
	$(document).on('click','.minus',function(){
		$('.count').val(parseInt($('.count').val()) - 1 );
			if ($('.count').val() == 0) {
				$('.count').val(1);
			}
    	});
	});
</script>

<body>



<div class="container">


<!-- mainNavi Start-->
  <div class="card">
    <div class="row">
      <aside class="col-sm-5">
        <article class="gallery-wrap">
          <div class="img-big-wrap">
            <div align="center">
              <a href="#">
              <img src="../pic/ia.jpg"></a>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <div align="center">
					<a href="#" class="btn btn-lg btn-primary text-uppercase" style=width:100pt> 담기 </a>
			  </div>	
			  
				
          </div>
          </div>
<!-- mainNavi End -->
        </article>
        <!-- gallery-wrap .end// -->
      </aside>
      <aside class="col-sm-7">
        <article class="card-body p-5">
          <a href="#" class="btn btn-lg btn-primary text-uppercase"><i class="fa fa-coffee" aria-hidden="true"></i> hot </a>
          <a href="#" class="btn btn-lg btn-primary text-uppercase"><i class="fa fa-snowflake" aria-hidden="true"></i>&nbsp;cold</a>
          
          <hr>
          <h3 class="title mb-3">아이스아메리카노</h3>

          <p class="price-detail-wrap">
            <span class="price h3 "> <span class="currency">
                </span><span class="num">가격</span>
            </span>
          </p>
          <!-- price-detail-wrap .// -->
          <dl class="item-property">
            <dt>제품수량</dt>
            <br>
					<div class="qty mt-6">
                        <span class="minus bg-primary"> - </span>
                        <input type="number" class="count" name="qty" value="1">
                        <span class="plus bg-primary"> + </span>
                    </div>
          </dl>
          <dl class="param param-feature">
            <dt>SIZE</dt>
            	<dd>
                  <label class="form-check form-check-inline"> 
                  Small&nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                    <span class="form-check-label"></span>&nbsp;
                  Tall&nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                    <span class="form-check-label"></span>&nbsp;
                  Grande&nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                    <span class="form-check-label"></span>&nbsp;
                  Venti&nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                    <span class="form-check-label"></span>&nbsp;
                  </label>
                </dd>
            <dd>
              
              <div class="row">
                <div class="col-sm-5">
                  <dl class="param param-inline">
                    <dt>샷 추가:</dt>
                    <dd>
                      <select class="form-control form-control-sm"
                        style="width: 70px;">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                      </select>
                </dd>
              </dl></dd>
          </dl>
          <!-- item-property-hor .// -->
          <dl class="param param-feature">
            <dt>휘핑크림</dt>
            	<dd>
                  <label class="form-check form-check-inline"> 
                  O&nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                    <span class="form-check-label"></span>&nbsp;
                  X&nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                    <span class="form-check-label"></span>
                  
                  </label>
                </dd>
          </dl>
          <hr>
          <!-- item-property-hor .// -->
          <dl class="param param-feature">
            <dt>제품정보 & 원산지 & 칼로리</dt>
            <dd>여기에 제품정보, 원산지, 칼로리가 들어오게끔설정</dd>
            <div align="right">
            	<a href="#" class="btn btn-lg btn-primary text-uppercase"> 취소 </a>
            </div>
          </dl>
          <!-- item-property-hor .// -->
          <!-- item-property .// -->
            </div>
            <!-- col.// -->
            <div class="col-sm-7">
              <dl class="param param-inline">
              </dl>
              <!-- item-property .// -->
            </div>
            <!-- col.// -->
				
			</div>

			<!-- row.// -->
      
         

 		        
        </article>
        <!-- card-body.// -->
      </aside>
      <!-- col.// -->
    </div>
    <!-- row.// -->
  </div>
  <!-- card.// -->


</div>
<!--container.//-->
</body>
</html>