<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>		

<%@ include file="/msearch/m_search_form.jsp" %>
ȸ�� �˻� <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
</tr>
<!-- jdbc ����
1�ܰ� : ����̹��ε�
2�ܰ� : DB���� -->
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");

request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<- sk ");
System.out.println(sv + "<- sv ");
//3�ܰ� : ���� ���� �غ� (���� �߿� ��)
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev44id";
	String dbPass = "dev44pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	String query = "select * from tb_member";
	if(sk == null && sv == null){
		System.out.println("01 sk,sv������ ����ִ� ���� �Ѵ� null �� ����");
		pstmt = conn.prepareStatement(query);	
	}else if(sk != null && sv.equals("")){
		System.out.println("02 sk������ ����ִ� ���� null�� �ƴϰ� sv������ ����ִ� ���� ���� ����");
		pstmt = conn.prepareStatement(query);	
	}else if(sk != null && sv != null){
		System.out.println("03 sk,sv������ ����ִ� ���� �Ѵ� null�� �ƴ� ����");
		pstmt = conn.prepareStatement(query+" WHERE "+sk+"=?");
		pstmt.setString(1, sv);
	}
	out.println(pstmt + "<-- pstmt");
	rs = pstmt.executeQuery();
	while(rs.next()){
%>
	<tr>
		<td><%= rs.getString("m_id")%></td>
		<td><%= rs.getString("m_pw")%></td>
		<td><%= rs.getString("m_level")%></td>
		<td><%= rs.getString("m_name")%></td>
		<td><%= rs.getString("m_email")%></td>
		<td>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">������ư</a>			
		</td>
		<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_action.jsp?send_id=<%= rs.getString("m_id")%>">������ư</a>			
		</td>

	</tr>

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
//4�ܰ� : ���� ���� 
//5�ܰ� : ���� ������ ��� ( ȭ�鿡 �� �ѷ��ش�. )

//6,7�ܰ� : ��ü ����
%>
</table>
<%@ include file="/module/hadan.jsp" %>	 