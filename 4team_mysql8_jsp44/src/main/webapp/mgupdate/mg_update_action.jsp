<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");	//post방식 한글처리
Connection conn = null;
PreparedStatement pstmt = null;
//화면에서 입력자료 받아서 콘솔창에 출력 시작
String g_name = request.getParameter("g_name");
String g_cate = request.getParameter("g_cate");
String g_weight = request.getParameter("g_weight");
String g_price = request.getParameter("g_price");
String g_local = request.getParameter("g_local");
String g_level = request.getParameter("g_level");
String g_code = request.getParameter("g_code");
System.out.println(g_name + "<-- g_name /mupdate/m_update_action.jsp.jsp");
System.out.println(g_cate + "<-- g_cate /mupdate/m_update_action.jsp.jsp");
System.out.println(g_weight + "<-- g_weight /mupdate/m_update_action.jsp.jsp");
System.out.println(g_price + "<-- g_price /mupdate/m_update_action.jsp.jsp");
System.out.println(g_local + "<-- g_local /mupdate/m_update_action.jsp.jsp");
System.out.println(g_level + "<-- g_level /mupdate/m_update_action.jsp.jsp");
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev44id";
String dbPass = "dev44pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement(
		"UPDATE tb_goods SET g_name=?,g_cate=?,g_weight=?,g_price=?, g_local=?, g_level=? WHERE g_code=?");
System.out.println(pstmt + "<-- pstmt 1");
pstmt.setString(1, g_name);
pstmt.setString(2, g_cate);
pstmt.setString(3, g_weight);
pstmt.setString(4, g_price);
pstmt.setString(5, g_local);
pstmt.setString(6, g_level);
pstmt.setString(7, g_code);
System.out.println(pstmt + "<-- pstmt 2");
pstmt.executeUpdate();
pstmt.close(); 
conn.close();
response.sendRedirect(request.getContextPath() + "/mgsearch/mg_search_list1.jsp");
%>







<!--
 m_insert_action.jsp 참고하면 완료 할 수 있다.
 
jdbc 순서
1. mysql 드라이버 로딩
2. DB연결
3. 쿼리 실행 준비 
UPDATE tb_member SET m_pw='22',m_level='구매자',m_name='44',m_email='55' WHERE m_id='id007'
4. 쿼리 실행
5. 쿼리 실행 결과 사용 ( 생략 )
6.7. 객체 종료

 -->