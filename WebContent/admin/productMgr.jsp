<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,admin.*"%>
<jsp:useBean id="pMgr" class="admin.ProductMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script>
function productDetail(no) {
	document.detail.prod_num.value=no;
	document.detail.submit();
}
</script>
</head>
<body bgcolor="#996600" topmargin="100">
<%@ include file="tabs.jsp"%>
<table width="75%" align="center" bgcolor="#FFFF99">
	<tr>
<%	
			Vector<CategoryBean> clist =pMgr.getCategoryList();
			for(int i=0; i<clist.size(); i++) {
				CategoryBean cbean = clist.get(i);
%>
		<td align="center" bgcolor="#FFFFCC" style="vertical-align: top">
		<table width="100%" align="center" bgcolor="#FFFF99" border="1">
			<tr>
				<td colspan=2><%= cbean.getCtg_name() %></td>
			</tr>
			<tr  align="center" bgcolor="#996600">
				<td><font color="#FFFFFF">상품명</font></td>		
				<td>&nbsp;</td>
			</tr>
			<%
			Vector<ProductBean> vlist = pMgr.getProductList(cbean.getCtg_num());
				if (vlist .size() == 0) {
			%>
			<tr>
				<td align="center" colspan="5">등록된 상품이 없습니다.</td>
			</tr>
			<%
				} else {
					for (int j = 0; j < vlist.size(); j++) {
						ProductBean product = vlist.get(j);
			%>
			<tr  align="center">
				<td><%=product.getProd_name()%></td>
				<td>
				<a href="javascript:productDetail('<%=product.getProd_num()%>')">상세보기</a></td>
			</tr>
			<%
					}//for
				}//if
			%>
			<tr>
				<td colspan="5" align="center">
					<a href="productInsert.jsp?ctg_num=<%=cbean.getCtg_num()%>">상품등록</a>
				</td>
			</tr>
		</table>
		</td>
<%
	}
%>
	</tr>
</table>
<%@ include file="bottom.jsp"%>
<form name="detail" method="post" action="productDetail.jsp">
	<input type="hidden" name="prod_num">
</form>
</body>
</html>