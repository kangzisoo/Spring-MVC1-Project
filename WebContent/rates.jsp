<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="lol.ChampionsDAO"%>
<%@page import="lol.ChampionsVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
			String lane = request.getParameter("lane");
		   ChampionsDAO db = new ChampionsDAO();
		   //ArrayList<ChampionsVO> list = db.all(cat);
		   
		   //입력해서 전송된 데이터를 받아야 한다.

		   //db전담하는 부품에 db에 넣어달라고 요청 예정.
		   //ChampionsDB db = new ChampionsDB();
		   //db.read(id);
		   //ChampionsVO bag = db.read(lane);
		   ArrayList<ChampionsVO> list = db.list(lane);
		%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="out.css">
<style type="text/css">
#center ul {
   list-style: none;
}

#center ul li {
   list-style: none;
   display: inline-block;
   padding-top: 10px;
   padding-right: :10px;
   width: 150px;
   height: 60px;
   border-radius: 0px 0px 50px 50px;
   background: gray;
   margin-left: 20px;
   margin-right: 20px;
}
</style>
</head>
<body>
   <div id="total">
      <div id="top">
         <jsp:include page="top.jsp"></jsp:include>
      </div>
      <div id="login">
         <jsp:include page="login.jsp"></jsp:include>
      </div>
      <div id="center">
         <ul>
            <li><a href="rates.jsp?lane=top">TOP</a></li>
            <li><a href="rates.jsp?lane=jg">JG</a></li>
            <li><a href="rates.jsp?lane=mid">MID</a></li>
            <li><a href="rates.jsp?lane=bot">BOT</a></li>
            <li><a href="rates.jsp?lane=sup">SUP</a></li>
         </ul>
<hr>
<table style="width:100%">
  <tr>
    <th>Name</th>
    <th>Image</th>
    <th>Lane</th>
    <th>Winrate</th>
    <th>Pickrate</th>
    <th>Tier</th>
    <tr>
    <%
    for (int i = 0; i < list.size(); i++) {
    	ChampionsVO bag2 = list.get(i);
    	%>
    <tr>
       <td><%=bag2.getName()%></td>
       <td><img src="img/<%=bag2.getImage()%>"></td>
       <td><%=bag2.getLane()%></td>
       <td><%=bag2.getWinrate()%></td>
       <td><%=bag2.getPickrate()%></td>
       <td><%=bag2.getTier()%></td>
       <tr>
       <%
    }
       %>
     
</table>
 

      </div>
   </div>
</body>
</html>