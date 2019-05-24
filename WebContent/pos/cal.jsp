<%@page import="kiosk.ProductBean"%>
<%@page import="kiosk.OrdersBean"%>
<%@page import="kiosk.OrderHistoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bMgr" scope="session" class="kiosk.BasketMgr" />
<jsp:useBean id="psMgr" class="kiosk.PosMgr" />
<jsp:useBean id="kMgr" class="kiosk.KioskMgr" />
<jsp:useBean id="pMgr" class="kiosk.ProductMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	Vector<OrdersBean> olist = kMgr.getProductNum();
	
	
	
%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">calculate list</a>
                                
                            </div>
                        </nav>
                       
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>품목명</th>
                                            <th>가격</th>
                                            <th>개수</th>
                                            <th>합계금액</th>
                                        </tr>
                                   
                                    </thead>
                                	<%
									for (int i=0; i<olist.size(); i++) {
										OrdersBean obean = olist.get(i);
										Vector<ProductBean> plist = kMgr.getProductName();
										ProductBean pbean = pMgr.getProduct(obean.getProd_num());
									%>
                                    <tbody>
                                        <tr>
                                            <td><%=pbean.getProd_name()%></td>
                                            <td><%=pbean.getProd_price()%>원</td>
                                            <td><%=obean.getOr_count() %>개</td>
                                            <td><%=pbean.getProd_price() * obean.getOr_count() %>원</td>                                           
                                        </tr>
                               <%}%>
                                    </tbody>
                                </table>
                                   
                                
                                <hr style="border: solid 2px black;">
                                <hr style="border: solid 2px black;">      
                                <!-- 총 정산금액 START-->
                            
                                
                                <table class="table" cellspacing="0">
                               	<% 
                               		Vector<OrderHistoryBean> ohtlist = psMgr.getTotalOrderHistoryList();
	                                OrderHistoryBean otbean = new OrderHistoryBean();
	                            %>
                                	<tbody>
                                		<tr>
                                			<td><font size="5px" style="color:blue">총금액</font></td>
                                			<!-- 간격띄우기 START-->
                                			<td></td>
                                			<td></td>
                                			<td></td>
                                			<td></td>
                                			<td></td>
                                			<td></td>
                                			<td></td>
                                			<td></td>
                                			<td></td>
                                			<!-- 간격띄우기 End-->
                                			<td style="border : solid 1px gray; border-size:10px"><%=otbean.getOh_total() %></td>
                                			</tr>
											
											<% 
										
											%>
                                			<tr>
	                                			<td><font size="5px" style="color:blue">총 샷 추가(금액)</font></td>
	                                			<!-- 간격띄우기 START-->
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<!-- 간격띄우기 End-->
	                                			<td style="border : solid 1px gray; border-size:10px">원</td>
                                			</tr>
                                			
                                			<tr>
	                                			<td><font size="5px" style="color:blue">총 G-Size(금액)</font></td>
	                                			<!-- 간격띄우기 START-->
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<!-- 간격띄우기 End-->
	                                			<td style="border : solid 1px gray; border-size:10px">금액표시란</td>
                                			</tr>
                                			<tr>
	                                			<td><font size="5px" style="color:blue">총 V-Size(금액)</font></td>
	                                			<!-- 간격띄우기 START-->
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<!-- 간격띄우기 End-->
	                                			<td style="border : solid 1px gray; border-size:10px">금액표시란</td>
                                			</tr>
                                			<tr>
	                                			<td><font size="5px" style="color:blue">총 사용된 Point</font></td>
	                                			<!-- 간격띄우기 START-->
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<!-- 간격띄우기 End-->
	                                			<td style="border : solid 1px gray; border-size:10px">금액표시란</td>
                                				
                                			</tr>
                                			
                                			<tr>
                                			
	                                			<td><font size="5px" style="color:RED">순이익</font></td>
	                                			<!-- 간격띄우기 START-->
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<td></td>
	                                			<!-- 간격띄우기 End-->
	                                			<td style="border : solid 1px gray; border-size:10px">금액표시란</td>
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
        
        
        <style>
        	.project-tab {
			    padding: 10%;
			    margin-top: -8%;
			}
			.project-tab #tabs{
			    background: #007b5e;
			    color: #eee;
			}
			.project-tab #tabs h6.section-title{
			    color: #eee;
			}
			.project-tab #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
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
			.project-tab thead{
			    background: #f3f3f3;
			    color: #333;
			}
			.project-tab a{
			    text-decoration: none;
			    color: #333;
			    font-weight: 600;
			}
			
        </style>