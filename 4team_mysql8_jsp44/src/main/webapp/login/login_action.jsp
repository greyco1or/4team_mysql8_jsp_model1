<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id ");
System.out.println(pw + "<- pw ");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;
String dbemail = null;
String message = null;
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev44id";
	String dbPass = "dev44pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
	System.out.println(pstmt + "<-- pstmt 1");
	pstmt.setString(1, id);
	System.out.println(pstmt + "<-- pstmt 2");
	rs = pstmt.executeQuery();
	if(rs.next()){
		System.out.println("1-1 ���̵� ��ġ");
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		dbemail = rs.getString("m_email");
		if(pw.equals(dbpw)){
			System.out.println("2-1 ��� ��ġ(�α��� ����)");
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_NAME", dbname);
			session.setAttribute("S_LEVEL", dblevel);
			message = "�α��� ����";
		}else{
			System.out.println("2-2 ��� ����ġ");
			message = "��� ����ġ";
		}
	}else{
		System.out.println("1-2 ���̵� ����ġ");
		message = "���̵� ����ġ";
	}
	
}catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

//1~2�ܰ� : ����̹��ε� �� DB����
//SELECT * FROM tb_member WHERE m_id='id001';
//3�ܰ� : select ���� �غ�
//4�ܰ� : ���� ����
//5�ܰ� : ���� ���� ��� ���
//ù��° if ���ǽ� (rs.next()) �� ���� �ؾ� �Ѵ�.
//�ι�° if ���ǻ� (�Է¹��� ����� ���Ժ�� ��ġ) <- �α��� ���� ����

%>
<script type="text/javascript">
	alert('<%= message %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


