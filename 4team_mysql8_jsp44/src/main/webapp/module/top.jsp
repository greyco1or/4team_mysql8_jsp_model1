<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String S_ID = (String)session.getAttribute("S_ID");
String S_NAME = (String)session.getAttribute("S_NAME");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
System.out.println(S_ID + "<- S_ID ");
System.out.println(S_NAME + "<- S_NAME ");
System.out.println(S_LEVEL + "<- S_LEVEL ");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자-회원관리</title>
<!-- 상대 경로로 경로 설정 -->
<!-- <link rel="stylesheet" type="text/css" href="./css/main.css" /> -->
<!-- 절대 경로로 경로 설정 --> 
<!-- 1억개의 경로가 jsp파일내에 있다면 1억개의 파일을 수정해야 한다.(문제점) -->
<!-- <link rel="stylesheet" type="text/css" href="/layoutMG44/css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<!-- getContextPath() 메서드 호출 후 리턴 값은 /프로젝트명 /layoutMG44 -->
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
   <!-- Begin Wrapper -->
   <div id="wrapper">
         <!-- Begin Header -->
         <div id="header">
/module/top.jsp	<br/>         
상단 메뉴 <br/><br/>
<%	if(S_LEVEL == null){	%>
<!-- 01로그인 전 화면 시작 -->
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a><br/><br/>
<form action="<%= request.getContextPath() %>/login/login_action.jsp" method="post">
아이디 : <input type="text" name="id">
비번 : <input type="password" name="pw">
	<input type="submit" value="로그인 버튼">
</form>
<!-- 01로그인 전 화면 끝 -->
<%	}else{	%>
<!-- 02 로그인 후 화면 시작 -->
<%		if(S_LEVEL.equals("구매자")){ %>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>
<a href="#">04상품리스트</a><br/><br/>
<%		}else if(S_LEVEL.equals("판매자")){ %>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03상품등록</a>
<a href="<%= request.getContextPath() %>/mgsearch/mg_search_list1.jsp">04회원과상품</a>	<br/><br/>
<%		}else if(S_LEVEL.equals("관리자")){ %>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>
<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">02회원리스트</a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03상품등록</a>
<a href="<%= request.getContextPath() %>/mgsearch/mg_search_list1.jsp">04회원과상품</a>	<br/><br/>
<%		} %>
<%= S_ID %> 아이디 / <%= S_NAME %> 님 / <%= S_LEVEL %> 권한 로그인 중
<a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>
<!-- 02 로그인 후 화면 끝 -->
<%	}	%>
		 </div>
		 <!-- End Header -->
		 
		 






		 
		 