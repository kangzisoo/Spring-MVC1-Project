<%@page import="lol.join_membershipVO"%>
<%@page import="lol.join_membershipDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = request.getParameter("id");

                join_membershipDAO db = new join_membershipDAO();
                join_membershipVO bag = db.read(id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 표현식, expression -->
검색된 id: <%= bag.getId()%><br>
(id: null이어야 사용가능한 아이디입니다.)<br>
<a href="member_C.jsp"><button>돌아가기</button></a>
</body>
</html>