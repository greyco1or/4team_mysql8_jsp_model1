<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="/layoutMG/css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main2.css" />
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>

<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%@ include file="/mgsearch/mg_search_form1.jsp" %>

상품 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>이름</td><td>상품코드</td><td>상품명</td><td>분류</td><td>무게</td><td>가격</td><td>원산지</td><td>등급</td><td>등록일</td><td>수정</td><td>삭제</td>
</tr>
<%
request.setCharacterEncoding("euc-kr");	//post한글처리
String sName = request.getParameter("sk");
String sText = request.getParameter("stext");
String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");
System.out.println(sName + "<- start_date ");
System.out.println(sText + "<- end_date ");
System.out.println(start_date + "<- start_date ");
System.out.println(end_date + "<- end_date ");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");

String selectQuery1="select tb_member.*, tb_goods.* " +
"from tb_member inner join tb_goods on tb_member.m_id = tb_goods.m_id  order by g_date";
System.out.println(selectQuery1 + "<- selectQuery1 ");

String selectQuery2="select tb_member.*, tb_goods.* " +
"from tb_member inner join tb_goods on tb_member.m_id = tb_goods.m_id "+ 
"and DATE_FORMAT(g_date,'%Y-%m-%d') between ? and ? " +  
"and " + sName + "=?" +
"order by g_date";

String selectQuery3="select tb_member.*, tb_goods.* " +
"from tb_member inner join tb_goods on tb_member.m_id = tb_goods.m_id "+ 
"and " + sName + "=?" +
"order by g_date";
System.out.println(selectQuery3 + "<- selectQuery2 ");


try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev44id";
	String dbPass = "dev44pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
//02단계 :DB연결(Connection)끝
	System.out.println(conn + "<-- conn ");
//쿼리실행 준비 단계 : 다양한 조건문을 작성 하면 끝!~~~~~~~~~~~	
	
	if(start_date==null && end_date==null){
		System.out.println("다 비어있음.");
		pstmt = conn.prepareStatement(selectQuery1);
	}else{
		if(sName==null && sText==null){
			System.out.println("옵션이랑 text 다 비어있음");
			pstmt = conn.prepareStatement(selectQuery1);
		}else if(sName!=null && sText.equals("")){
			System.out.println("text는 비어있음.");
			pstmt = conn.prepareStatement(selectQuery1);
		}else if(sName!=null && sText!=null){
			if(start_date.equals("") || end_date.equals("")){
				pstmt = conn.prepareStatement(selectQuery3);
				System.out.println(selectQuery3 + "<-- selectQuery3 ");
				pstmt.setString(1, sText);
			}else{
				pstmt = conn.prepareStatement(selectQuery2);
				pstmt.setString(1, start_date);
				pstmt.setString(2, end_date);	
				pstmt.setString(3, sText);
			}
		}
	}

	
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs m_search_form.jsp");
	//System.out.println(rs.next() + "<-- rs.next() m_search_form.jsp");
	boolean next = rs.next();
	if(next==false){
		out.println("검색결과 없음");
	}
	while(next){
		

%>		
		
		<tr>
		<td><%= rs.getString("m_id")%></td>
		<td><%= rs.getString("m_name")%></td>
		
		<td><%= rs.getString("g_code")%></td>
		<td><%= rs.getString("g_name")%></td>
		<td><%= rs.getString("g_cate")%></td>
		<td><%= rs.getString("g_weight")%></td>
		<td><%= rs.getString("g_price")%></td>
		<td><%= rs.getString("g_local")%></td>
		<td><%= rs.getString("g_level")%></td>
		<td><%= rs.getString("g_date")%></td>
		<td>
<a href="<%= request.getContextPath() %>/mgupdate/mg_update_form.jsp?send_id=<%= rs.getString("g_code")%>">수정</a>			
		</td>
		<td>
<a href="<%= request.getContextPath() %>/mgdelete/mg_delete_action.jsp?send_id=<%= rs.getString("g_code")%>">삭제</a>			
		</td>
	</tr>			
<%		
	next = rs.next();
	}		
		
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</table>			 
<%@ include file="/module/hadan.jsp" %>

</body>
</html>
