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
String dbname = null;
String dbcate = null;
String dbweight = null;
String dbprice = null;
String dblocal = null;
String dblevel = null;
String dbcode = null;

try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev44id";
	String dbPass = "dev44pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn m_update_form.jsp");
	pstmt = conn.prepareStatement("SELECT * FROM tb_goods WHERE g_code=?");
	System.out.println(pstmt + "<-- pstmt 1");
	pstmt.setString(1, send_id);
	System.out.println(pstmt + "<-- pstmt 2");
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_update_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_update_form.jsp");
	if(rs.next()){
		System.out.println("rs.next() ���ǽ� next�޼��� ȣ�� �� ���������� ������ ������ ���ϰ��� true-���ǹ� ����");
		System.out.println(rs.getString("g_name") + "<-- g_name  �÷��� ��� �ִ� ��");
		System.out.println(rs.getString("g_cate") + "<-- g_cate  �÷��� ��� �ִ� ��");
		System.out.println(rs.getString("g_weight") + "<-- g_weight  �÷��� ��� �ִ� ��");
		System.out.println(rs.getString("g_price") + "<-- g_price  �÷��� ��� �ִ� ��");
		System.out.println(rs.getString("g_local") + "<-- g_local  �÷��� ��� �ִ� ��");
		System.out.println(rs.getString("g_level") + "<-- g_level  �÷��� ��� �ִ� ��");
		//1�� ��� : ����ȭ�� ���� �� �ִ�.
		dbname = rs.getString("g_name");
		dbcate = rs.getString("g_cate");
		dbweight = rs.getString("g_weight");
		dbprice = rs.getString("g_price");
		dblocal = rs.getString("g_local");
		dblevel = rs.getString("g_level");
		dbcode = rs.getString("g_code");
		System.out.println(dbname + "<-- dbname ������ ��� �ִ� ��");
		System.out.println(dbcate + "<-- dbcate ������ ��� �ִ� ��");
		System.out.println(dbweight + "<-- dbweight ������ ��� �ִ� ��");
		System.out.println(dbprice + "<-- dbprice ������ ��� �ִ� ��");
		System.out.println(dblocal + "<-- dblocal ������ ��� �ִ� ��");
		System.out.println(dblevel + "<-- dblevel ������ ��� �ִ� ��");
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
<!-- 2�� ��� : ����ȭ�� ���� �� �ִ�. -->
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>	
<form action="<%= request.getContextPath() %>/mgupdate/mg_update_action.jsp" method="post">
<input type="hidden" name="g_code" value="<%= dbcode %>">
<table border="1">
<tr>
	<td>��ǰ��</td>
	<td><input type="text" name="g_name" size="20" readonly value="<%= dbname %>"></td>
<tr>
<tr>
	<td>ī�װ�</td>
	<td><input type="text" name="g_cate" size="20" value="<%= dbcate %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="g_weight" size="20" value="<%= dbweight %>"></td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="g_price" size="20" value="<%= dbprice %>"></td>
<tr>
<tr>
	<td>������</td>
	<td><input type="text" name="g_local" size="20" value="<%= dblocal %>"></td>
<tr>
<tr>
	<td>���</td>
	<td><input type="text" name="g_level" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="��������"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>	