<%@page import="java.util.ArrayList"%>
<%@page import="lol.tier_distribution_plotVO"%>
<%@page import="lol.tier_distribution_plotDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   tier_distribution_plotDAO db = new tier_distribution_plotDAO(); //객체생성
   ArrayList<tier_distribution_plotVO> list = db.list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>유저별 티어 분포표(실시간)</h2>
<hr color = "blue">
<table border="1"> <!-- 테이블 생성 -->
<tr>
	<td>티어</td>
	<td>비율</td>
	<td>누적비율</td>
</tr>
<% //for문을 사용하여 한줄씩 가져오기
for (int i = 0; i < list.size(); i++) {
	tier_distribution_plotVO bag = list.get(i);
%>
<tr> <!-- 가방 가져오기 -->
	<td><%= bag.getTier() %></td>
	<td><%= bag.getRate() %></td>
	<td><%= bag.getAcummulation_rate() %></td>
</tr>
<% } %>
</table>
</body>
</html>
