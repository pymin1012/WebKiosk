<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="tabs.jsp"%>
	<form method="post" action="productProc.jsp?flag=insert" enctype="multipart/form-data">
		<input type="hidden" name="ctg_num" size="20" value="<%= Integer.parseInt(request.getParameter("ctg_num"))%>">
		<table width="75%" align="center" bgcolor="#FFFF99">
			<tr>
				<td align="center" bgcolor="#FFFFCC">
					<table width="95%" bgcolor="#FFFF99" border="1">
						<tr bgcolor="#996600">
							<td colspan="2" align="center"><font color="#FFFFFF">상품
									등록</font></td>
						</tr>
						<tr>
							<td align="center">상품이름</td>
							<td align="left"><input name="prod_name" size="20"></td>
						</tr>
						<tr>
							<td align="center">상품이미지</td>
							<td><input type="file" name="prod_img"></td>
						</tr>
						<tr>
							<td align="center">상품ice이미지</td>
							<td><input type="file" name="prod_iimg"></td>
						</tr>
						<tr>
							<td align="center">상품가격</td>
							<td align="left"><input name="prod_price" size="20">원</td>
						</tr>
						<tr>
							<td align="center">상품kcal</td>
							<td align="left"><input name="prod_kcal" size="20">kcal</td>
						</tr>
						<tr>
							<td align="center">상품원산지</td>
							<td align="left"><input name="prod_coo" size="20"></td>
						</tr>
						<tr>
							<td align="center">상품유무</td>
							<td align="left">
								유<input type="radio" name="prod_so" size="10" value="true" >
								무<input type="radio" name="prod_so" size="10" value="false" >
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"value="상품등록">&nbsp;&nbsp;&nbsp;
							<input type="reset"value="다시쓰기"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="bottom.jsp"%>
</body>
</html>

