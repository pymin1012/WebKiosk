<%@page import="admin.ProductBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,admin.*"%>
<jsp:useBean id="pMgr" class="admin.ProductMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script>
	function productDelete(no) {
		document.del.prod_num.value = no;
		document.del.submit();
	}

	function productUpdate(no, ctg) {
		document.update.ctg_num.value = ctg;
		document.update.prod_num.value = no;
		document.update.submit();
	}
</script>
</head>
<body bgcolor="#996600" topmargin="100">
<%@ include file="tabs.jsp"%>
<%
	int prod_num = Integer.parseInt(request.getParameter("prod_num"));
	ProductBean product = pMgr.getProduct(prod_num);
%>
<table width="75%" align="center" bgcolor="#FFFF99">
	<tr>
		<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr bgcolor="#996600">
				<td colspan="3" align="center"><font color="#FFFFFF"><%=product.getProd_num()%></font></td>
			</tr>
			<tr>
				<td width="20%" align="center">
<%
	if (product.getProd_img() != null) {
%>
							<img src="../menu_pic/<%=product.getProd_img()%>" height="150" width="150" >
<%
	} else {
%>
							<span>이미지없음</span>
<%
	}
%>				</td>
				<td width="20%" align="center">
<%
	if (product.getProd_iimg() != null) {
%>
							<img src="../menu_pic/<%=product.getProd_iimg()%>" height="150" width="150" >
<%
	} else {
%>
							<span>이미지없음</span>
<%
	}
%>
				</td>
				<td width="30%" valign="top">
				<table border="1" width="100%" height="100%">
					<tr>
						<td><b>상품이름 : </b><%=product.getProd_name()%></td>
					</tr>
					<tr>
					<td><b> 카테고리: </b><%=product.getCtg_num() %></td>					
					</tr>
					<tr>
						<td><b>가 격 : </b><%=UtilMgr.intFormat(product.getProd_price())%></td>
					</tr>
					<tr>
						<td><b> kcal: </b><%=product.getProd_kcal()%></td>
					</tr>
					<tr>
						<td><b> 원산지: </b><%=product.getProd_coo()%></td>
					</tr>
					<tr>
						<td><b> 상품 유무: </b><%=product.isProd_so()%></td>
					</tr>
				</table>
				</td>
				
			</tr>
			<tr>
				<td colspan="3" align="center">
				<a href="javascript:productUpdate('<%=product.getProd_num()%>', '<%=product.getCtg_num()%>')">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:productDelete('<%=product.getProd_num()%>')">삭제하기</a>			&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="insertEvento.jsp?prod_num=<%=prod_num%>">이벤트상품으로 추가하기</a>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<%@ include file="bottom.jsp"%>
<form name="update" method="post" action="productUpdate.jsp">
<input type=hidden name=ctg_num>
<input type=hidden name=prod_num></form>
<form name="del" method="post" action="productProc.jsp?flag=delete">
<input type=hidden name=prod_num></form>
</body>
</html>


