<%@page import="lol.itemVO"%>
<%@page import="lol.itemDB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//입력해서 전송된 데이터를 받아야 한다.
        String name = request.getParameter("name");    
    	itemDB db = new itemDB();
    	itemVO bag = db.read(name);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 검색</title>
<link rel="stylesheet" type="text/css" href="out.css">
</head>
<body>
	<h2>아이템 도감</h2>
    <hr color="red">
        <form action="items.jsp">
	        [목록으로 돌아가기]  &nbsp  <button> 전체 아이템</button><br>
		    <br>
		    <br>
		</form>

		<table border="1">
			
				<tr>
					<td>이미지</td>
					<td width ="200">아이템</td>
					<td>설명</td>
				</tr>
				<tr>
					<td><img src="img/<%=bag.getImg()%>.png"></td>
					<td><%=bag.getName()%></td>
					<td><%=bag.getContent()%></td>
				</tr>

			</table>		
</body>
</html>