<%@page import="java.util.ArrayList"%>
<%@page import="java.util.stream.Collector.Characteristics"%>
<%@page import="lol.ChampionsVO"%>
<%@page import="lol.ChampionsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 매개변수에 입력 및 전송된 데이터를 받아온다.
	String characteristic = request.getParameter("characteristic");
	ChampionsDAO db = new ChampionsDAO(); //db 사용
	ArrayList<ChampionsVO> list2 = db.list2(characteristic); // list2 사용
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
	background: orange;
	padding: 10px 10px 10px 10px;
	margin: 20px 20px 20px 20px;
}
</style>
</head>
<body>
	<h2>챔피언 [특징] 검색 결과</h2>

	<form action="champions.jsp">
		<button>챔피언 전체 목록으로 돌아가기</button>
		<br> <br> <br>
	</form>

	<div id="total">

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
				<% // 리스트2 사이즈 = 가방 수 = 테이블의 행 수 만큼 반복.
					for (int i = 0; i < list2.size(); i++) {
					ChampionsVO bag3 = list2.get(i); //가방 꺼내기
				%>
				<tr><!-- 가방에서 보여줄 컬럼(값)들 꺼내기 -->
					<td><%=bag3.getName()%></td>
					<td><img src="img/<%=bag3.getImage()%>"></td>
					<td><%=bag3.getCharacteristic()%></td>
				</tr>
				<%
 					} // for문 끝.
 				%>
			</table>
		</div>
	</div>
</body>
</html>