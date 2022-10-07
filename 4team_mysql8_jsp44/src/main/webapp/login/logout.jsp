<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	session.invalidate();	//세션 종료
%>
<script type="text/javascript">
	alert('로그아웃');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>












