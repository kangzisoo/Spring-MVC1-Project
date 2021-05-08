
<%@page import="lol.join_membershipDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
			//입력해서 전송된 데이터를 받아야 한다.
			String id = request.getParameter("id");
			
			//DAO클래스를 통해 db 객체 생성 -> 입력받은 값(id)에 해당하는 
			//row 찾아서 삭제(delete)
			join_membershipDAO db = new join_membershipDAO();
			db.delete(id);
	%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원탈퇴가 완료되었습니다.
</body>
</html>