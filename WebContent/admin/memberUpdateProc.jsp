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
			alert("���������� �����Ͽ����ϴ�");
			location.href="memberMgr.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("�������� ������ �߻��Ͽ����ϴ�.");
			history.back();
		</script>
<%}%>