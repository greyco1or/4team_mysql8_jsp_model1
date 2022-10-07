<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
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
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");

request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<- sk ");
System.out.println(sv + "<- sv ");
//3단계 : 쿼리 실행 준비 (가장 중요 함)
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev44id";
	String dbPass = "dev44pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	
	if(sk == null && sv == null){
		System.out.println("01 sk,sv변수에 담겨있는 값이 둘다 null 인 조건");
		pstmt = conn.prepareStatement("select * from tb_member");	
	}else if(sk != null && sv.equals("")){
		System.out.println("02 sk변수에 담겨있는 값은 null이 아니고 sv변수에 담겨있는 값은 공백 조건");
		pstmt = conn.prepareStatement("select * from tb_member");	
	}else if(sk != null && sv != null){
		System.out.println("03 sk,sv변수에 담겨있는 값이 둘다 null이 아닌 조건");
		if(sk.equals("m_id")){
			pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
			pstmt.setString(1, sv);
		}else if(sk.equals("m_level")){
			pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_level=?");
			pstmt.setString(1, sv);
		}else if(sk.equals("m_name")){
			pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_name=?");
			pstmt.setString(1, sv);
		}else if(sk.equals("m_email")){
			pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_email=?");
			pstmt.setString(1, sv);
		}
		
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
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">수정버튼</a>			
		</td>
		<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_action.jsp?send_id=<%= rs.getString("m_id")%>">삭제버튼</a>			
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
//4단계 : 쿼리 실행 
//5단계 : 쿼리 실행결과 사용 ( 화면에 잘 뿌려준다. )

//6,7단계 : 객체 종료
%>
</table>