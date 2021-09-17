package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Category;


public class CategoryDao {
	// 사용 유무 수정
	public void updateCategoryStateByadmin(String categoryName, String categoryState) throws ClassNotFoundException, SQLException {
		//디버깅
		System.out.println(categoryName + "<--categoryName");
		System.out.println(categoryState + "<--categoryState");
		//DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn + "<--conn");
		// 이름을 입력하여 일치하는 정보의 사용 유무를 변경하는 쿼리
		String sql = "UPDATE category SET category_state = ? WHERE category_name = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		//?순서대로 입력
		stmt.setString(1, categoryState);
		stmt.setString(2, categoryName);
		//디버깅
		System.out.println(stmt + "<--stmt");
		
		stmt.executeQuery();
		
		return;
	}
	
	
	
	
	// 카테고리 이름 중복 검사
	public String selectCategoryName(String categoryNameCheck) throws ClassNotFoundException, SQLException {
		//디버깅
		System.out.println(categoryNameCheck + "<--memberIdCheck");
		
		String categoryName = null;
		//DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//디버깅
		System.out.println(conn + "<--conn");
		
		String sql = "SELECT category_name categoryName FROM category WHERE category_name=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		//?에 입력할 값
		stmt.setString(1, categoryNameCheck);
		ResultSet rs = stmt.executeQuery();
		//디버깅
		System.out.println(rs + "<-- rs");
		if(rs.next()) {
			categoryName = rs.getString("categoryName");
		}
		return categoryName;
		
	}
	
	
	//카테고리 추가
	public void insertCategory(String categoryName, String categoryState) throws ClassNotFoundException, SQLException {
		//DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//디버깅
		System.out.println(conn + "<-- conn");
		//카테고리를 추가하는 쿼리
		String sql = "INSERT INTO category(category_name, category_state, update_date, create_date) VALUES(?,?,now(),now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		//?에 들어갈 값
		stmt.setString(1, categoryName);
		stmt.setString(2, categoryState);
		//디버깅
		System.out.println(stmt + "<-- stmt");
		stmt.executeUpdate();
		return;
	}
	
	
	//카테고리 리스트를 출력
	public ArrayList<Category> selectCategoryListAllByPage() throws ClassNotFoundException, SQLException{
		ArrayList<Category> list = new ArrayList<Category>();
		//DB실행
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//디버깅
		System.out.println(conn + "<-- conn");
		String sql = "SELECT category_name categoryName, category_state categoryState, update_date updateDate, create_date createDate FROM category ORDER BY category_name DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, 0);
		stmt.setInt(2, 10);
		//?안에 들어갈 입력값
		System.out.println(stmt + "<--stmt");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Category c = new Category();
			c.setCategoryName(rs.getString("categoryName"));
			c.setCategoryState(rs.getString("categoryState"));
			c.setUpdateDate(rs.getString("updateDate"));
			c.setCreateDate(rs.getString("createDate"));
			list.add(c);
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
