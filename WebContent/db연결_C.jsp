<%@page import="lol.join_membershipVO"%>
<%@page import="lol.join_membershipDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	String id = request.getParameter("id");
         String pw = request.getParameter("pw");
         String name = request.getParameter("name");
         String birthdate = request.getParameter("birthdate");
         String tel = request.getParameter("tel");
         
         join_membershipVO bag = new join_membershipVO();

         bag.setId(id);
         bag.setPw(pw);
         bag.setName(name);
         bag.setBirthdate(birthdate);
         bag.setTel(tel);
         
         join_membershipDAO db = new join_membershipDAO();

         db.create(bag);
   %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원가입이 완료되었습니다.
<form action="login.jsp">
<button>로그인으로</button>
</form>
</body>
</html>