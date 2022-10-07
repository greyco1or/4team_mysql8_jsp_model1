<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id ");
System.out.println(pw + "<- pw ");
//아이디 일치 불일치 조건문을 작성하세요! 
//문제점 : 조건식을 작성 할 수 없다. 왜? 입력자료와 비교할 가입회원 정보가 없다.
//가입 된 회원정보 가정 (DB있다라고 생각하자!)
String dbid = "id001";
String dbpw = "pw001";
String dbname = "일길동";
String dblevel = "관리자";	//테스트 : 관리자 또는 판매자 또는 구매자 변경
String message = null;
if(id.equals(dbid)){
	System.out.println("1-1 아이디 일치");
	//비번 일치 불일치 조건문을 작성하세요! 전원 할 수 있다.
	if(pw.equals(dbpw)){
		System.out.println("2-1 비번 일치(로그인 성공)");
//session 영역에 셋팅 : 가입된 아이디,이름,권한 3가지를 셋팅
		session.setAttribute("S_ID", dbid);
		session.setAttribute("S_NAME", dbname);
		session.setAttribute("S_LEVEL", dblevel);
		message = "로그인 성공";
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
	}else{
		System.out.println("2-2 비번 불일치");
		message = "비번 불일치";
	}
}else{
	System.out.println("1-2 아이디 불일치");
	message = "아이디 불일치";
}
%>
<script type="text/javascript">
	alert('<%= message %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


