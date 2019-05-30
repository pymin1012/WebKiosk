<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,admin.*"%>
<jsp:useBean id="pMgr" class="admin.ProductMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
<%@ include file="tabs.jsp"%>
<%
	int prod_num = Integer.parseInt(request.getParameter("prod_num"));
	ProductBean product = pMgr.getProduct(prod_num);
	int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
%>
<table width="75%" align="center" bgcolor="#FFFF99">
	<tr>
		<td align="center" bgcolor="#FFFFCC">
		<form method="post" action="productProc.jsp?flag=update" enctype="multipart/form-data">
			<input type="hidden" name="ctg_num" value="<%= ctg_num %>">
		
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr bgcolor="#996600">
				<td colspan="2" align="center"><font color="#FFFFFF">상품수정</font></td>
			</tr>
			<tr>
				<td width="31%" align="center">상품이름</td>
				<td width="69%" align="left">
					<input name="prod_name" value="<%=product.getProd_name()%>">
				</td>
			</tr>
			<tr>
				<td height="21" align="center">상품가격</td>
				<td align="left">
					<input name="prod_price" size="20" value="<%=product.getProd_price()%>">원
				</td>
			</tr>
			
			<tr>
				<td align="center">상품kcal</td>
				<td align="left">
					<input name="prod_kcal" size="10" value="<%=product.getProd_kcal()%>">
				</td>
			</tr>
			<tr>
				<td align="center">상품원산지</td>
				<td align="left">
					<input name="prod_coo" size="10" value="<%=product.getProd_coo()%>">
				</td>
			</tr>
			
			<tr>
				<td align="center">상품유무</td>
				<td align="left">
					유<input type="radio" name="prod_so" size="10" value="true" <%= product.isProd_so() ? "checked":"" %>>
				
					무<input type="radio" name="prod_so" size="10" value="false" <%= product.isProd_so() ? "":"checked" %>>
				</td>
			</tr>
			<tr>
				<td align="center">상품사진</td>
				<td align="left">
				<input type="file" name="prod_img"></td>
			</tr>
			<tr>
				<td align="center">상품사진ice</td>
				<td align="left">
				<input type="file" name="prod_iimg"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="제품수정">&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시쓰기"></td>
			</tr>
		</table>
			<input type=hidden name="prod_num" value="<%=product.getProd_num()%>">
		</form>
		</td>
	</tr>
</table>
<%@ include file="bottom.jsp"%>
</body>
</html>