<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>01메인화면</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>

<body>
   
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
		       
상품등록화면 <br><br>	 
       
<form action="<%= request.getContextPath() %>/goods/goods_insert_pro.jsp" method="post">
<!-- 	<input type="hidden" name="g_code"> -->	
<input type="hidden" name="m_id" value="<%= S_ID %>">
<!-- 상품코드 / 상품명 / 카테고리 - 청과,야채 / 무게 / 가격 / 원산지 / 등급 / 등록일 -->
	상품명 : <input type="text" name="g_name"> <br>
	카테고리 : <input type="text" name="g_cate"> <br>
	무게 : <input type="text" name="g_weight"> <br>
	가격 : <input type="text" name="g_price"> <br>
	원산지 : <input type="text" name="g_local"> <br>
	등급 : <input type="text" name="g_level"> <br>
	
	<input type="submit" value="상품등록버튼">
</form>	          		 

<%@ include file="/module/hadan.jsp" %>

   
</body>
</html>
