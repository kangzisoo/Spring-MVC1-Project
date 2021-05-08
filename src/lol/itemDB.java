package lol;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class itemDB {

	public ArrayList<itemVO> list() throws Exception { // return type 변경
		ArrayList<itemVO> list = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		String url = "jdbc:mysql://localhost:3306/lol?useUnicode=true&characterEncoding=utf8"; //한글 인식 변경!!! 
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db 연결 성공. <br>");

		String sql = "select * from items"; // 뒤 삭제
		PreparedStatement ps = con.prepareStatement(sql);
		// ps.setString(1, id); 삭제
		System.out.println("3. sql문을 만들기 성공. <br>");

		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문을 mysql서버로 전송 성공. <br>");

		// 1. 검색 결과 체크, System.out.println(rs.next()); //true이면 있다라는 얘기
		// 2. 만약에 결과가 있으면, 테이블에서 원하는 데이터 항목을 꺼내주면 된다.
		while (rs.next()) {// if -> while로 변경, db 리스트 항목 꺼내어 가방에 집어넣음
			// rs.next()를 호출 할때마다 한 행씩 내려가서 그 행이 있는지를 체크: boolean
			// 있으면 true 없으면 false
			// true이면 각 항목의 값들을 꺼내주어야 한다.
			String name = rs.getString("name");
			String img = rs.getString(2);
			String content = rs.getString(3);

			// 가방을 만들어서 꺼내준 값들을 가방에 넣는다.
			itemVO bag = new itemVO(); // while 변경 후 아래로 이동
			bag.setName(name);
			bag.setImg(img);
			bag.setContent(content);

			// 가방들을 넣어줄 컨테이너에 하나씩 넣어준다
			list.add(bag);

		}
		return list;

	}

	public itemVO read(String name) throws Exception {
		System.out.println(name);
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		String url = "jdbc:mysql://localhost:3306/lol?useUnicode=true&characterEncoding=utf8";//한글 인식 변경!!! 
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db 연결 성공. <br>");

		String sql = "select * from items where name like '%" + name + "%'"; // 검색
//		String sql = "select * from items where name = '구원'";
//	    String sql = "select * from items where name like '%?%'";  
		// name like '%강철의 영약%'
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. sql문을 만들기 성공. <br>");
		//ps.setString(1, name);

		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문을 mysql서버로 전송 성공. <br>");
		//System.out.println(rs.next());
		itemVO bag = new itemVO();
		if (rs.next()) {
			String name2 = rs.getString("name");
			String img = rs.getString(2);
			String content = rs.getString(3);

			bag.setName(name2);
			bag.setImg(img);
			bag.setContent(content);

		}
		return bag;
	}
}
