package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Member;

public class MemberDao {
	
	//검색 후 마지막페이지
	public int totalSelectList(String searchMemberId) throws ClassNotFoundException, SQLException {
		//DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		//마지막페이지에 사용할 데이터들의 수를 변수선언
		int totalCount = 0;
		
		System.out.println(conn + "<-- conn");
		// 테이블에 들어있는것들의 수를 구하는  SQL
		String sql = "select count(*) from member WHERE member_id like ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		//like문을 사용하면 %를 사용하여 감싸주어야함.
		stmt.setString(1, "%"+searchMemberId+"%");
		// 디버깅
		System.out.println(stmt + "<--stmt");
		
		ResultSet rs = stmt.executeQuery(); // 참조값
		if(rs.next()){
			totalCount = rs.getInt("count(*)");	
		}
		// totalCount값 리턴
		return totalCount;
	}
	
	
	//[관리자] 검색
	public ArrayList<Member> selectMemberListAllBySearchMemberId(int beginRow, int rowPerPage, String searchMemberId) throws ClassNotFoundException, SQLException{
		//디버깅
		System.out.println(beginRow + "<-- beginRow");
		System.out.println(rowPerPage + "<-- rowPerPage");
		
		ArrayList<Member> list = new ArrayList<Member>();
		// DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//디버깅
		System.out.println(conn + "<-- conn");
		//특정 아이디를 입력할시 해당하는 정보가 출력되는 검색기등 SQL
		String sql = "SELECT member_no memberNo, member_id memberId, member_level memberLevel, member_name memberName, member_age memberAge, member_gender memberGender, update_date updateDate, create_date createDate FROM member WHERE member_id like ? ORDER BY create_date DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		//입력값.
		stmt.setString(1, "%"+searchMemberId+"%");	//like를 쓰기 때문에 %로 감싸주어야 함.
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		//디버깅
		System.out.println(stmt + "<-- stmt");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Member m = new Member();
			m.setMemberNo(rs.getInt("memberNo"));
			m.setMemberId(rs.getString("memberId"));
			m.setMemberLevel(rs.getInt("memberLevel"));
			m.setMemberName(rs.getString("memberName"));
			m.setMemberAge(rs.getInt("memberAge"));
			m.setMemberGender(rs.getString("memberGender"));
			m.setUpdateDate(rs.getString("updateDate"));
			m.setCreatedate(rs.getString("createdate"));
			// 선언했던 리스트에 출력될 값들 대입.
			list.add(m);
		}
		//리스트값 리턴
		return list;
	}
	
	
	//[관리자] 마지막페이지 출력
	public	int totalList() throws ClassNotFoundException, SQLException {
		//DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//디버깅
		System.out.println(conn + "<-- conn");
		
		int totalCount = 0;
		// 전체 갯수구하는 쿼리
		PreparedStatement stmt = conn.prepareStatement("select count(*) from member");
		//디버깅
		System.out.println(stmt + "<--stmt");
		
		ResultSet rs = stmt.executeQuery(); // 참조값
		if(rs.next()){
			totalCount = rs.getInt("count(*)");	
		}
		// totalCount값 리턴
		return totalCount;
	}
	
	//[관리자] 회원목록출력
	public ArrayList<Member> selectMemberListAllByPage(int beginRow, int rowPerPage) throws ClassNotFoundException, SQLException{
		//디버깅
		System.out.println(beginRow + "<-- beginRow");
		System.out.println(rowPerPage + "<-- rowPerPage");
		
		ArrayList<Member> list = new ArrayList<Member>();
		//DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//디버깅
		System.out.println(conn + "<-- conn");
		//create_date순서대로 member테이블을에 해당하는 정보를 출력
		String sql = "SELECT member_no memberNo, member_id memberId, member_level memberLevel, member_name memberName, member_age memberAge, member_gender memberGender, update_date updateDate, create_date createDate FROM member ORDER BY create_date DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		//?안에 들어갈 입력값
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		//디버깅
		System.out.println(stmt + "<-- stmt");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Member m = new Member();
			m.setMemberNo(rs.getInt("memberNo"));
			m.setMemberId(rs.getString("memberId"));
			m.setMemberLevel(rs.getInt("memberLevel"));
			m.setMemberName(rs.getString("memberName"));
			m.setMemberAge(rs.getInt("memberAge"));
			m.setMemberGender(rs.getString("memberGender"));
			m.setUpdateDate(rs.getString("updateDate"));
			m.setCreatedate(rs.getString("createdate"));
			list.add(m);
		}
		//리턴
		return list;
	}
	
	
	
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
	// [회원]로그인
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
			returnMember.setMemberLevel(rs.getInt("memberLevel"));
			return returnMember;
		}
		rs.close();
		stmt.close();
		conn.close();
		
		return null;
	}
	
}
