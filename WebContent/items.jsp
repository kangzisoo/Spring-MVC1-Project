<%@page import="java.util.ArrayList"%>
<%@page import="lol.itemVO"%>
<%@page import="lol.itemDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	itemDB db = new itemDB();
	ArrayList<itemVO> list = db.list();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 도감</title>
<link rel="stylesheet" type="text/css" href="out.css">
</head>
<body>
	<h2>아이템 도감</h2>
    <hr color="red">
    <form action="list.jsp">
		[아이템] : <input name="name"> &nbsp <button>아이템 검색</button>      
    </form>
	<div id="total">
		<div id="top">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div>
			<table border="1">
				<tr>
					<td>이미지</td>
					<td width ="200">아이템</td>
					<td>설명</td>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
					itemVO bag = list.get(i); //꺼내기
				%>
				<tr>
					<td><img src="img/<%=bag.getImg()%>.png"></td>
					<td><%=bag.getName()%></td>
					<td><%=bag.getContent()%></td>
				</tr>
			<%
				}
			%>
			</table>
		</div>

	</div>
</body>
</html>