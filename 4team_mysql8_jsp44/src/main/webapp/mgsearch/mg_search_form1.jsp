<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="<%=request.getContextPath()%>/mgsearch/mg_search_list1.jsp" method="post">
<input type="date" name="start_date">
<input type="date" name="end_date">
<select name="sk">
    <option value="g_name">상품명</option>
    <option value="g_local">원산지</option>
    <option value="m_name">판매자명</option>
</select>
<input type="text" name="stext">
<input type="submit" value="검색버튼">
</form>


