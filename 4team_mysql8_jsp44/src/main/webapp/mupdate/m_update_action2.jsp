<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");	//post��� �ѱ�ó��
Connection conn = null;
PreparedStatement pstmt = null;
//ȭ�鿡�� �Է��ڷ� �޾Ƽ� �ܼ�â�� ��� ����
String m_id = request.getParameter("m_id");
String m_pw = request.getParameter("m_pw");
String m_level = request.getParameter("m_level");
String m_name = request.getParameter("m_name");
String m_email = request.getParameter("m_email");
System.out.println(m_id + "<-- m_id /mupdate/m_update_action.jsp.jsp");
System.out.println(m_pw + "<-- m_pw /mupdate/m_update_action.jsp.jsp");
System.out.println(m_level + "<-- m_level /mupdate/m_update_action.jsp.jsp");
System.out.println(m_name + "<-- m_name /mupdate/m_update_action.jsp.jsp");
System.out.println(m_email + "<-- m_email /mupdate/m_update_action.jsp.jsp");
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev44id";
String dbPass = "dev44pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement(
		"UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?");
System.out.println(pstmt + "<-- pstmt 1");
pstmt.setString(1, m_pw);
pstmt.setString(2, m_level);
pstmt.setString(3, m_name);
pstmt.setString(4, m_email);
pstmt.setString(5, m_id);
System.out.println(pstmt + "<-- pstmt 2");
int result = pstmt.executeUpdate();
System.out.println(result + "<-- result");
pstmt.close(); 
conn.close();
response.sendRedirect(request.getContextPath() + "/mlist/m_list.jsp");
%>







<!--
 m_insert_action.jsp �����ϸ� �Ϸ� �� �� �ִ�.
 
jdbc ����
1. mysql ����̹� �ε�
2. DB����
3. ���� ���� �غ� 
UPDATE tb_member SET m_pw='22',m_level='������',m_name='44',m_email='55' WHERE m_id='id007'
4. ���� ����
5. ���� ���� ��� ��� ( ���� )
6.7. ��ü ����

 -->