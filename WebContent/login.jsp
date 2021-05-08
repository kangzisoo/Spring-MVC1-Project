<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<hr color="blue">
<!--null이면 id이름으로 세션이 설정된 것이 없다라는 의미! => 로그인이 안됨! =>로그인 입력폼을 보어주어야 함 -->
<%if(session.getAttribute("id") == null) { %>
<form action="check.jsp">
아이디:<input name="id" required="required"><br>
패스워드:<input name="pw" required="required"><br>
 <button>로그인</button>
 <%} else {%>
 <%=session.getAttribute("id") %>님 환영합니다.<br><!-- =은 표현식 -->
 <a href='Main공사중이다.jsp'> <!--☆ 추후 메인이랑 연결필요!!! -->
    <button type="button">메인으로 돌아가기</button><!--type="button" 안하면 default가 submit  -->
 </a><br>
 <a href="logout.jsp">로그아웃</a>
 <%}%>
</form><br>
<a href="member_C.jsp"><button>회원가입</button></a>
<a href="member_U.jsp"><button>회원정보수정</button></a>
<a href="member_D.jsp"><button>회원탈퇴</button></a>
<a href="main.jsp"><button>메인으로</button></a> 
</html>