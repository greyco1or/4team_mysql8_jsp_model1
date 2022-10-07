<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");
String m_id = request.getParameter("m_id");
String g_name = request.getParameter("g_name");
String g_cate = request.getParameter("g_cate");
String g_price = request.getParameter("g_price");
String g_level = request.getParameter("g_level");
String g_local = request.getParameter("g_local");
String g_weight = request.getParameter("g_weight");
//콘솔창에 출력한다
System.out.println(m_id + "<-- m_id goods_insert_pro.jsp");
System.out.println(g_name + "<-- g_name goods_insert_pro.jsp");
System.out.println(g_cate + "<-- g_cate goods_insert_pro.jsp");
System.out.println(g_price + "<-- g_price goods_insert_pro.jsp");
System.out.println(g_level + "<-- g_level goods_insert_pro.jsp");
System.out.println(g_local + "<-- g_local goods_insert_pro.jsp");
System.out.println(g_weight + "<-- g_weight goods_insert_pro.jsp");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
PreparedStatement pstmt_insert = null;
ResultSet rs_insert = null;

Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev44db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev44id";
	String dbPass = "dev44pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	//pstmt = conn.prepareStatement("select max(CAST(substring(g_code,7) AS DECIMAL)) from tb_goods");
	pstmt = conn.prepareStatement("select max(CAST(substring(g_code,7) AS DECIMAL)) as maxcol from tb_goods");
	
	rs = pstmt.executeQuery();
	
	int max = 0;
	String tempCode = "goods_";
	String g_code = "goods_1";
	if(rs.next()){
		max = rs.getInt(1);
		//max = rs.getInt("maxcol");
		System.out.println(max + "<-- max 1");
		max = max + 1;
		System.out.println(max + "<-- max 2");
		g_code = tempCode + max;	//예) goods_3
	}
	System.out.println(g_code + "<-- g_code");
/*  1단계 최대값을 구해서 상품코드 생성 End	*/	
	pstmt_insert = conn.prepareStatement(
	"INSERT INTO tb_goods VALUES (?, ?, ?, ?, ?, ?, ?, ?, now())");
	pstmt_insert.setString(1, g_code);
	pstmt_insert.setString(2, m_id);
	pstmt_insert.setString(3, g_name);
	pstmt_insert.setString(4, g_cate);
	pstmt_insert.setString(5, g_weight);
	pstmt_insert.setString(6, g_price);
	pstmt_insert.setString(7, g_local);
	pstmt_insert.setString(8, g_level);
	
	int insertResult = pstmt_insert.executeUpdate();
	System.out.println(insertResult + "<-- insertResult 상품등록결과");
	

	//rs_insert.close();
	//pstmt_insert.close();
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close();  } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close();  } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	response.sendRedirect(request.getContextPath()+"/mgsearch/mg_search_list1.jsp");
}



%>