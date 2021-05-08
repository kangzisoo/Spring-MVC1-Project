<%@page import="lol.join_membershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//미리 객체를 생성해서 제공하고 있는 객체: 빌트인 객체(내장된 객체)
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
        join_membershipDAO db = new join_membershipDAO();
        boolean result = db.check(id, pw);
        //로그인이 성공을 한 경우, id를 사이트 내 여러 페이지에서 쓸 수 있도록 설정
        //세션이 유지되는 동안 쓸 수 있도록 해야함.
        if(result){
       		session.setAttribute("id", id);
        }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 결과는 <%= result %> <br> <!-- 표현식 -->
<a href = "login.jsp">로그인페이지로</a>
</body>
</html>