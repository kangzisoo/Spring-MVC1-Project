package lol;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class tier_distribution_plotDAO {
	public ArrayList<tier_distribution_plotVO> list() throws Exception {
		ArrayList<tier_distribution_plotVO> list = new ArrayList<>();

		// 1. 커넥터 사용 설정
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		// 2. db연결하기
		String url = "jdbc:mysql://localhost:3306/lol";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		System.out.println("2. db연결 성공. <br>");

		// 3. SQL문 만들기
		String sql = "select * from tier_distribution_plot";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. SQL문을 만들기 성공. <br>");

		// 4. SQL문을 mySQL서버로 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");

		
		while (rs.next()) {
			// true이면 각 항목의 값들을 꺼내주어야 한다.
			// 꺼내주는 방법은 2가지, 1)항목명, 2)항목의 인덱스
			String tier = rs.getString(1);// "apple"
			String rate = rs.getString(2);
			String accumulation_rate = rs.getString(3);

			// 가방을 만들어서 꺼내준 값들을 가방에 넣는다.
			tier_distribution_plotVO bag = new tier_distribution_plotVO();
			bag.setTier(tier);
			bag.setRate(rate);
			bag.setAcummulation_rate(accumulation_rate);

			// 가방들을 넣어줄 컨테이너에 하나씩 넣어준다.
			list.add(bag);
		}
		System.out.println(list.size() + "================");

		return list;
	}
}
