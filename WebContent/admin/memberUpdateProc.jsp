<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="aMgr" class="admin.AdminMgr" />
<jsp:useBean id="mBean" class="kiosk.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<%
    boolean flag = aMgr.updateMember(mBean);
	if(flag){
%>
		<script>
			alert("성공적으로 수정하였습니다");
			location.href="memberMgr.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("수정도중 에러가 발생하였습니다.");
			history.back();
		</script>
<%}%>