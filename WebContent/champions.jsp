<%@page import="lol.ChampionsVO"%>
<%@page import="lol.ChampionsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 매개변수에 입력 및 전송된 데이터를 받아온다.
	String lane = request.getParameter("lane");
	ChampionsDAO db = new ChampionsDAO(); // db 사용
	ArrayList<ChampionsVO> list = db.list(lane); // list 사용
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="out.css">
<style type="text/css">
#center {
	float: left;
	padding-right: 20px;
	width: 100%;
	margin: 0 auto;
	text-align: center;
}
#center ul {
	list-style: none;
}
#center ul li {
	list-style: none;
	display: inline-block;
	width: 150px;
	height: 60px;
	border-radius: 10px 10px 10px 10px;
	background: #c2e9ff;
	padding: 10px 10px 10px 10px;
	margin: 20px 20px 20px 20px;
}
</style>
</head>
<body>
	<form action="search.jsp">
		[검색] : <input name="characteristic"><br>
		<button type="submit">챔피언 특성 검색</button>
	</form>

	<div id="total">
		<div id="top">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div id="login">
			<jsp:include page="login.jsp"></jsp:include>
		</div>
		<div id="center">
			<ul>
				<li><a href="champions.jsp?lane=top">TOP</a></li>
				<li><a href="champions.jsp?lane=jg">JG</a></li>
				<li><a href="champions.jsp?lane=mid">MID</a></li>
				<li><a href="champions.jsp?lane=bot">BOT</a></li>
				<li><a href="champions.jsp?lane=sup">SUP</a></li>
			</ul>

			<hr>
			<table border="1" style="width: 100%">
				<tr>
					<th>Name</th>
					<th width="10">Image</th>
					<th>Characteristic</th>
				</tr>

				<%  // 리스트 사이즈 = row 수 = 테이블의 행 수 만큼 반복.
					for (int i = 0; i < list.size(); i++) {
					ChampionsVO bag = list.get(i); //가방 꺼내기
				%>
				<tr><!-- 가방에서 보여줄 컬럼(값)들 꺼내기 -->
					<td><%=bag.getName()%></td>
					<td><img src="img/<%=bag.getImage()%>"></td>
					<td><%=bag.getCharacteristic()%></td>
				</tr>
				<%
					} //for문 끝.
				%>
			</table>

		</div>
	</div>
</body>
</html>