<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id ");
System.out.println(pw + "<- pw ");
//���̵� ��ġ ����ġ ���ǹ��� �ۼ��ϼ���! 
//������ : ���ǽ��� �ۼ� �� �� ����. ��? �Է��ڷ�� ���� ����ȸ�� ������ ����.
//���� �� ȸ������ ���� (DB�ִٶ�� ��������!)
String dbid = "id001";
String dbpw = "pw001";
String dbname = "�ϱ浿";
String dblevel = "������";	//�׽�Ʈ : ������ �Ǵ� �Ǹ��� �Ǵ� ������ ����
String message = null;
if(id.equals(dbid)){
	System.out.println("1-1 ���̵� ��ġ");
	//��� ��ġ ����ġ ���ǹ��� �ۼ��ϼ���! ���� �� �� �ִ�.
	if(pw.equals(dbpw)){
		System.out.println("2-1 ��� ��ġ(�α��� ����)");
//session ������ ���� : ���Ե� ���̵�,�̸�,���� 3������ ����
		session.setAttribute("S_ID", dbid);
		session.setAttribute("S_NAME", dbname);
		session.setAttribute("S_LEVEL", dblevel);
		message = "�α��� ����";
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
	}else{
		System.out.println("2-2 ��� ����ġ");
		message = "��� ����ġ";
	}
}else{
	System.out.println("1-2 ���̵� ����ġ");
	message = "���̵� ����ġ";
}
%>
<script type="text/javascript">
	alert('<%= message %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


