package lol;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class join_membershipDAO {
	public void create(join_membershipVO bag) throws Exception {

		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/lol?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "insert into join_membership values (?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getId());
		ps.setString(2, bag.getPw());
		ps.setString(3, bag.getName());
		ps.setString(4, bag.getBirthdate());
		ps.setString(5, bag.getTel());

		ps.executeUpdate();
	}
	// 로그인을 위한 check
	public boolean check(String id, String pw) throws Exception {
		// 1. 커넥터 사용하겠다고 설정해야함.
	    Class.forName("com.mysql.jdbc.Driver");
	    // PrinterWriter out = new PrintWriter();
	    System.out.println("1. 커넥터 사용 설정 성공. <br>");
	    // 2. db연결해보자! - shop, root, 1234
	    String url = "jdbc:mysql://localhost:3306/lol?useUnicode=true&characterEncoding=utf8";
	    // jsp에서의 자동 import: 컨트롤+쉬프트+m
	    Connection con = DriverManager.getConnection(url, "root", "1234"); 
	    System.out.println("2. db연결 성공. <br>");
	    // 3. SQL문을 만든다. => 해당부품을 써서 SQL으로 인식하게 해야함.
	    String sql = "select * from join_membership where id = ? and pw = ?";
	    PreparedStatement ps = con.prepareStatement(sql);
	    ps.setString(1, id);
	    ps.setString(2, pw);
	    System.out.println("3. SQL문을 만들기 성공. <br>");
	    // 4. SQL문을 mySQL서버로 전송함.
	    ResultSet rs = ps.executeQuery(); //sql에서 불러오는 명령어
	    System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");
	    boolean result = false; //결과를 담기 위한 변수

	    if(rs.next()){
	    	result = true;
	    }
	    return result;
	}

	// id 중복체크를 위한 R
	public join_membershipVO read(String id) throws Exception {

		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/lol?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "select * from join_membership where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);

		ResultSet rs = ps.executeQuery();

		join_membershipVO bag = new join_membershipVO();
		if (rs.next())
		{
			String id2 = rs.getString("id");

			bag.setId(id2);

		}
		return bag;
	}
	// 회원정보 수정을 위한 U
	public void update(join_membershipVO bag) throws Exception {// 매개변수(입력값) -> bag
		// 1. (다운받은)커넥터 사용하겠다고 설정
		Class.forName("com.mysql.jdbc.Driver"); // Driver(클래스는 대문자)
		// 2. db 연결 - lol(db) , root(id), 1234(pw)
		String url = "jdbc:mysql://localhost:3306/lol"; // jdbc:mysql//ip:0000/db명
		// url 너무 길어서 변수로 따로 뺌.
		Connection con = DriverManager.getConnection(url, "root", "1234");
		// 반환값이 있어서 con (참조형)변수에 넣음
		// 3. SQL문을 만든다.
		String sql = "update join_membership set pw = ?, tel = ? where id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getPw());
		ps.setString(2, bag.getTel());
		ps.setString(3, bag.getId());
		// 4. SQL문을 mySQL서버로 전송
		ps.executeUpdate();
	}
	// 회원 탈퇴를 위한 D
	public void delete(String id) throws Exception {
		// 1. 커넥터 사용하겠다고 설정해야함.
		Class.forName("com.mysql.jdbc.Driver");

		// 2. db 연결-lol, root, 1234
		String url = "jdbc:mysql://localhost:3306/lol";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		// 3. SQL문을 만든다.
		String sql = "delete from join_membership where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);

		// 4. SQL문을 mySQL서버로 전송함.
		ps.executeUpdate();
	}

}