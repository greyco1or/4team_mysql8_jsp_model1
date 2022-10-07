<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<- send_id");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev44id";
	String dbPass = "dev44pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_update_form.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
	System.out.println(pstmt + "<-- pstmt 1");
	pstmt.setString(1, send_id);
	System.out.println(pstmt + "<-- pstmt 2");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_update_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
	if(rs.next()){
		System.out.println("rs.next() 조건식 next메서드 호출 후 쿼리실행결과 한줄이 있으면 리턴값이 true-조건문 실행");
		System.out.println(rs.getString("m_id") + "<-- m_id  컬럼에 담겨 있는 값");
		System.out.println(rs.getString("m_pw") + "<-- m_pw  컬럼에 담겨 있는 값");
		System.out.println(rs.getString("m_level") + "<-- m_level  컬럼에 담겨 있는 값");
		System.out.println(rs.getString("m_name") + "<-- m_name  컬럼에 담겨 있는 값");
		System.out.println(rs.getString("m_email") + "<-- m_email  컬럼에 담겨 있는 값");
		//1번 방법 : 수정화면 만들 수 있다.
%>
<form action="<%= request.getContextPath() %>/minsert/m_insert_action.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="m_id" size="20" readonly value="<%= rs.getString("m_id") %>"></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="m_pw" size="20" value="<%= rs.getString("m_pw") %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="m_level" size="20" value="<%= rs.getString("m_level") %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20" value="<%= rs.getString("m_name") %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20" value="<%= rs.getString("m_email") %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원가입버튼"></td>
</tr>
</table>
</form>

<%

	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
 
 
<!--  m_insert_form.jsp 참고해서 수정화면 만들자
m_list.jsp 참고
1단계 : mysql 드라이버로딩
2단계 : DB연결
3단계 : SELECT * FROM tb_member WHERE m_id='id001' 쿼리 준비
4단계 : 쿼리 실행
5단계 : 쿼리 실행 결과 사용 ( 수정화면에 뿌려준다. )
6,7,8단계 : 객체 종료
10시 20분까지 완성하세요! -->