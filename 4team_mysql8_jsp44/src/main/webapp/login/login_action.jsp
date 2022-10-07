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
		System.out.println("1-1 아이디 일치");
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		dbemail = rs.getString("m_email");
		if(pw.equals(dbpw)){
			System.out.println("2-1 비번 일치(로그인 성공)");
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_NAME", dbname);
			session.setAttribute("S_LEVEL", dblevel);
			message = "로그인 성공";
		}else{
			System.out.println("2-2 비번 불일치");
			message = "비번 불일치";
		}
	}else{
		System.out.println("1-2 아이디 불일치");
		message = "아이디 불일치";
	}
	
}catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

//1~2단계 : 드라이버로딩 및 DB연결
//SELECT * FROM tb_member WHERE m_id='id001';
//3단계 : select 쿼리 준비
//4단계 : 쿼리 실행
//5단계 : 쿼리 실행 결과 사용
//첫번째 if 조건식 (rs.next()) 을 변경 해야 한다.
//두번째 if 조건색 (입력받은 비번와 가입비번 일치) <- 로그인 성공 조건

%>
<script type="text/javascript">
	alert('<%= message %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


