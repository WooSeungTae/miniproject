package com.nike.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.nike.memberDTO.MemberDTO;

public class MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt =null;
	private ResultSet rs = null;
	
	//외부에서 함부로 DAO 객체를 못 시키게 생성자를 private으로 생성
	private static MemberDAO instance = new MemberDAO();
	
	//생성자 생성 
	private MemberDAO() {
		
	}
	
	public static MemberDAO getDAO() {
		return instance;
	}
	
	//데이터베이스 로직
	public void insert(MemberDTO data) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = null;
		PreparedStatement ppst = null;
		
		try {
			//JDBC Driver 로딩
			Class.forName(driver);
			//Connection 객체 생성 / DB연결
			conn = DriverManager.getConnection(url,"jsp","1234");
			//수행할 쿼리 정의 / no 칼럼의 데이터는 시퀀스로 입력하고, joinDate는 오라클의 sysdate로 입력
			ppst = conn.prepareStatement("insert into memberinfo values(seq_memberinfo.nextval,?,?,?,?,?,?,?,?,?,?,?)");
			//매개변수로 전달된 데이터를 쿼리문의 물음표에 값 매핑
			ppst.setString(1, data.getId());
			ppst.setString(2, data.getPwd());
			ppst.setString(3, data.getName());
			ppst.setString(4, data.getTel());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}















