<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<- sk ");
System.out.println(sv + "<- sv ");
//3�ܰ� : ���� ���� �غ� (���� �߿� ��)
if(sk == null && sv == null){
	System.out.println("01 sk,sv������ ����ִ� ���� �Ѵ� null �� ����");
	//� ó���� �� ���ΰ�? //3�ܰ� : ���� ���� �غ�	
}else if(sk != null && sv.equals("")){
	System.out.println("02 sk������ ����ִ� ���� null�� �ƴϰ� sv������ ����ִ� ���� ���� ����");
	//� ó���� �� ���ΰ�? //3�ܰ� : ���� ���� �غ�
}else if(sk != null && sv != null){
	System.out.println("03 sk,sv������ ����ִ� ���� �Ѵ� null�� �ƴ� ����");
	//� ó���� �� ���ΰ�? //3�ܰ� : ���� ���� �غ�
}
//4�ܰ� : ���� ���� 
//5�ܰ� : ���� ������ ��� ( ȭ�鿡 �� �ѷ��ش�. )
%>
<tr>
	<td>���̵� �˻���� ��</td>
	<td>��� �˻���� ��</td>
	<td>���� �˻���� ��</td>
	<td>�̸� �˻���� ��</td>
	<td>�̸��� �˻���� ��</td>
	<td>������ư</td>
	<td>������ư</td>
</tr>
<%
//6,7�ܰ� : ��ü ����
%>
</table>