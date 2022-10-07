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
		System.out.println("rs.next() ���ǽ� next�޼��� ȣ�� �� ���������� ������ ������ ���ϰ��� true-���ǹ� ����");
		System.out.println(rs.getString("m_id") + "<-- m_id  �÷��� ��� �ִ� ��");
		System.out.println(rs.getString("m_pw") + "<-- m_pw  �÷��� ��� �ִ� ��");
		System.out.println(rs.getString("m_level") + "<-- m_level  �÷��� ��� �ִ� ��");
		System.out.println(rs.getString("m_name") + "<-- m_name  �÷��� ��� �ִ� ��");
		System.out.println(rs.getString("m_email") + "<-- m_email  �÷��� ��� �ִ� ��");
		//1�� ��� : ����ȭ�� ���� �� �ִ�.
%>
<form action="<%= request.getContextPath() %>/minsert/m_insert_action.jsp" method="post">
<table border="1">
<tr>
	<td>���̵�</td>
	<td><input type="text" name="m_id" size="20" readonly value="<%= rs.getString("m_id") %>"></td>
<tr>
<tr>
	<td>��ȣ</td>
	<td><input type="text" name="m_pw" size="20" value="<%= rs.getString("m_pw") %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="m_level" size="20" value="<%= rs.getString("m_level") %>"></td>
<tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="m_name" size="20" value="<%= rs.getString("m_name") %>"></td>
<tr>
<tr>
	<td>�̸���</td>
	<td><input type="text" name="m_email" size="20" value="<%= rs.getString("m_email") %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="ȸ�����Թ�ư"></td>
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
 
 
<!--  m_insert_form.jsp �����ؼ� ����ȭ�� ������
m_list.jsp ����
1�ܰ� : mysql ����̹��ε�
2�ܰ� : DB����
3�ܰ� : SELECT * FROM tb_member WHERE m_id='id001' ���� �غ�
4�ܰ� : ���� ����
5�ܰ� : ���� ���� ��� ��� ( ����ȭ�鿡 �ѷ��ش�. )
6,7,8�ܰ� : ��ü ����
10�� 20�б��� �ϼ��ϼ���! -->