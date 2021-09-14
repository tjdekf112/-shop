package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import commons.DBUtil;
import vo.Member;

public class MemberDao {
	
	//회원가입
	public int insertMember(Member member) throws ClassNotFoundException, SQLException {
		// 매개변수를 잘 받아왔는지 디버깅
		System.out.println(member.getMemberId() + "<--memberId");
		System.out.println(member.getMemberPw() + "<--memberPw");
		System.out.println(member.getMemberName() + "<--memberName");
		System.out.println(member.getMemberAge() + "<--memberAge");
		System.out.println(member.getMemberGender() + "<--memberGender");
		
		//DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//디버깅
		System.out.println(conn +"<-- conn");
		
		// 삽입sql
		String sql = "INSERT INTO member(member_id, member_pw, member_level, member_name, member_age, member_gender, update_date, create_date )VALUES(?,PASSWORD(?),0,?,?,?,now(),now())";
		PreparedStatement stmt = conn.prepareStatement(sql);

		// sql에 입력해야되는 값
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.setInt(4, member.getMemberAge());
		stmt.setString(5, member.getMemberGender());
		
		//디버깅
		System.out.println(stmt + "<-- stmt");
		int rs = stmt.executeUpdate();
		return rs;
		
	}
	// 로그인
	public Member login(Member member) throws ClassNotFoundException, SQLException {
		// 받아온 값 디버깅
		System.out.println(member.getMemberId() + "<--memberId");
		System.out.println(member.getMemberPw() + "<--memberPw");
		//DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//디버깅
		System.out.println(conn +"<-- conn");
		// 로그인하기위한 sql
		String sql = "SELECT member_id memberId, member_pw memberPw,member_name memberName, member_level memberLevel FROM member WHERE member_id =? AND member_pw =PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 로그인을 하기위한 조건에 해당하는 값 .
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		//디버깅
		System.out.println(stmt + "<-- stmt");
		ResultSet rs = stmt.executeQuery();

		// 출력에 사용할 정보
		if(rs.next()) {
			Member returnMember = new Member();
			returnMember.setMemberId(rs.getString("memberId"));
			returnMember.setMemberPw(rs.getString("memberPw"));
			returnMember.setMemberName(rs.getString("memberName"));
			return returnMember;
		}
		rs.close();
		stmt.close();
		conn.close();
		
		return null;
	}
	
}
