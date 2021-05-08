package lol;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ChampionsDAO {
		// 라인(lane)을 매개변수로 구분하여 담을  ArrayList 생성 => list()
	   public ArrayList<ChampionsVO> list(String lane) throws Exception {
		   ArrayList<ChampionsVO> list = new ArrayList<>();
		   // 1. 커넥터 사용하도록 설정
		   Class.forName("com.mysql.jdbc.Driver");
		   // 2. DB 연결 및 한글 사용 설정  => lol, root, 1234
		   String url = "jdbc:mysql://localhost:3306/lol?useUnicode=true&characterEncoding=utf8";
		   Connection con = DriverManager.getConnection(url, "root", "1234");
		   // 3. SQL문 생성 => 라인으로 검색한 후, 이름 오름차순으로 정렬하여 가져오기.
		   String sql = "select name, image, characteristic from champions where lane = ? order by name";
		   PreparedStatement ps = con.prepareStatement(sql);
		   ps.setString(1, lane);
		   // 4. SQL문을 mySQL서버로 전송함.
		   ResultSet rs = ps.executeQuery();
		   // 1. 검색결과가 있는지 체크.
		   System.out.println(rs.next());
		   // 있으면 true, 없으면 false
		   // rs.next()를 호출할 때 마다 한 행씩 내려가서 그 행이 존재하는지 체크 : boolean
		   // 2. 만약에 결과 true이면, 테이블에서 원하는 데이터 항목의 값들을 꺼낸다.
		   while (rs.next()) { // DB에서 값을 꺼내서 bag에 넣고, 그 bag을 다시 list에 넣고 => 한 row당 bag 하나
			   // 꺼내주는 방법은 2가지, 1)항목명, 2)항목의 인덱스
			   String name2 = rs.getString("name");
			   String image = rs.getString("image");
			   String characteristic = rs.getString("characteristic");
			   // 꺼내준 값들을 bag에 넣는다
			   ChampionsVO bag = new ChampionsVO();
			   bag.setName(name2);
			   bag.setImage(image);
			   bag.setCharacteristic(characteristic);
			   // bag들을 리스트에 넣어준다.
			   list.add(bag);
		   }
		   return list;
	   }
	   // 특징(characteristic)을 매개변수로 구분하여 담을  ArrayList 생성 => list2()
	   public ArrayList<ChampionsVO> list2(String characteristic) throws Exception {
		   ArrayList<ChampionsVO> list2 = new ArrayList<>();
		   // 1. 커넥터 사용 설정
		   Class.forName("com.mysql.jdbc.Driver");
		   // 2. 디비연결 및 한글사용 설정
		   String url = "jdbc:mysql://localhost:3306/lol?useUnicode=true&characterEncoding=utf8";
		   Connection con = DriverManager.getConnection(url, "root", "1234");
		   // 3. SQL문 생성
		   String sql = "select name, image, characteristic from champions where characteristic like '%" + characteristic + "%'";
		   PreparedStatement ps = con.prepareStatement(sql);
		   // 4. SQL문 서버로 전송
		   ResultSet rs = ps.executeQuery();
		   
		   // 검색 결과 있는지 체크 - 있으면, 값을 꺼내서 - 한 row씩 bag2에 넣고 - 그 bag2들을 list에 쌓아 - 리스트 리턴
		   while (rs.next()) {
			   // 꺼내주는 방법은 2가지, 1)항목명, 2)항목의 인덱스
			   String name2 = rs.getString("name");// "apple"
			   String image = rs.getString("image");
			   String characteristic2 = rs.getString("characteristic");
			   
			   // bag2에 한 행씩 넣는다.
			   ChampionsVO bag2 = new ChampionsVO();
			   bag2.setName(name2);
			   bag2.setImage(image);
			   bag2.setCharacteristic(characteristic2);
			   
			   // bag2들을 list에 넣어준다.
			   list2.add(bag2);
		   }
		   System.out.println(list2.size()); //검색된 리스트 사이즈 (행 수) 확인
		   return list2;
	   }
}