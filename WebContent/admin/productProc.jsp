<!-- productProc.jsp -->
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pMgr" class="admin.ProductMgr"/>
<%
		request.setCharacterEncoding("UTF-8");
		String flag= request.getParameter("flag");
		String msg ="오류가 발생 하였습니다.";
		boolean result =false;
		if(flag.equals("insert")){
			result=pMgr.insertProduct(request);
			if(result) msg="등록 하였습니다.";
		}else if(flag.equals("update")){
			result=pMgr.updateProduct(request);
			if(result) msg="수정 하였습니다.";
		}else if(flag.equals("delete")){
			int no =Integer.parseInt(request.getParameter("prod_num"));
			result=pMgr.deleteProduct(no);
			if(result) msg="삭제하였습니다.";
		}
%>
 <script>
		alert("<%=msg%>");
		location.href ="productMgr.jsp";
 </script>