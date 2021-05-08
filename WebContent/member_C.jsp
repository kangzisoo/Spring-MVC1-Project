<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<hr color="blue">
	<form action="db연결_C.jsp">
		아이디: <input name="id" required="required"> <a href="member_R.jsp"><button type="button">중복체크</button></a><br> 
		비밀번호: <input name="pw" required="required"><br> 
		이름: <input name="name" required="required"> <br> <!-- 주의: 현재 한글 인식이 안됨! --> 
		생년월일: <input name="birthdate" required="required"> <br> 
		연락처(선택): <select name="company">
				<option value="SK">SK</option>
				<option value="LG">LG</option>
				<option value="KT">KT</option>
				<option value="알뜰폰">알뜰폰</option>
		</select> <input name="tel"> <br>
			<button type="submit">회원가입완료</button>
	</form>
</body>
</html>