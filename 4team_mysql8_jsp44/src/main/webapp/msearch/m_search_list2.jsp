<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ include file="/msearch/m_search_form.jsp" %>
회원 검색 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>수정</td><td>삭제</td>
</tr>
<!-- jdbc 순서
1단계 : 드라이버로딩
2단계 : DB연결 -->
<%
request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<- sk ");
System.out.println(sv + "<- sv ");
//3단계 : 쿼리 실행 준비 (가장 중요 함)
if(sk == null && sv == null){
	System.out.println("01 sk,sv변수에 담겨있는 값이 둘다 null 인 조건");
	//어떤 처리를 할 것인가? //3단계 : 쿼리 실행 준비	
}else if(sk != null && sv.equals("")){
	System.out.println("02 sk변수에 담겨있는 값은 null이 아니고 sv변수에 담겨있는 값은 공백 조건");
	//어떤 처리를 할 것인가? //3단계 : 쿼리 실행 준비
}else if(sk != null && sv != null){
	System.out.println("03 sk,sv변수에 담겨있는 값이 둘다 null이 아닌 조건");
	//어떤 처리를 할 것인가? //3단계 : 쿼리 실행 준비
}
//4단계 : 쿼리 실행 
//5단계 : 쿼리 실행결과 사용 ( 화면에 잘 뿌려준다. )
%>
<tr>
	<td>아이디 검색결과 값</td>
	<td>비번 검색결과 값</td>
	<td>권한 검색결과 값</td>
	<td>이름 검색결과 값</td>
	<td>이메일 검색결과 값</td>
	<td>수정버튼</td>
	<td>삭제버튼</td>
</tr>
<%
//6,7단계 : 객체 종료
%>
</table>