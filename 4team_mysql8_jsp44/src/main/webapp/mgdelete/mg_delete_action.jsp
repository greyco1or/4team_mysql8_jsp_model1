<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<- send_id");
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev44id";
String dbPass = "dev44pw";
Connection conn = null;
PreparedStatement pstmt = null;
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement(
		"DELETE FROM tb_goods WHERE g_code=?");
System.out.println(pstmt + "<-- pstmt 1");
pstmt.setString(1, send_id);
System.out.println(pstmt + "<-- pstmt 2");
pstmt.executeUpdate();
pstmt.close(); 
conn.close();
response.sendRedirect(request.getContextPath() + "/mgsearch/mg_search_list1.jsp");
//response.sendRedirect(request.getContextPath() + "/mlist/m_list.jsp");

/* 
jdbc 1~7단계 처리하면 된다. 
DELETE FROM tb_member WHERE m_id='id007'
*/
%>