package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.control.connector.Connector;
import com.control.vo.UserDetailVO;

public class UserDetailsDAO {
	UserDetailVO UDVO;
	private Connection con;
	PreparedStatement pstmt;

	
	public UserDetailsDAO(UserDetailVO UDVO) {
		// TODO Auto-generated constructor stub
		this.UDVO=UDVO;
		
	}
	String Id;
	String Email;
	String Address;
	String question_1;
	String question_2;
	String question_3;
	String answer_1;
	String answer_2;
	String answer_3;
	
	public String setDetailDAO() {
		
		String sql ="select id" + 
				" from userdetail" + 
				" where id='"+UDVO.getId()+"'";
		Connector conn=new Connector();
		con=conn.getCon();
		
		try {
			Statement stmt= con.createStatement();			
			ResultSet rs=stmt.executeQuery(sql);
			
			
			//next 다음값이 있으면 true를 반환하면서 다음값으로 넘어간다.
			if(rs.next()) {	
				sql="insert into userdetails(id,email,address,question_1,answer_1,question_2,answer_2,question_3,answer_3) values(?,?,?,?,?,?,?,?,?)";				
				pstmt= con.prepareStatement(sql);				
				pstmt.setString(1, UDVO.getId());
				pstmt.setString(2, UDVO.getEmail());
				pstmt.setString(3, UDVO.getAddress());
				pstmt.setString(4, "aaa");
				pstmt.setString(5, UDVO.getAnswer_1());
				pstmt.setString(6, "bbb");
				pstmt.setString(7, UDVO.getAnswer_2());
				pstmt.setString(8, "ccc");
				pstmt.setString(9, UDVO.getAnswer_3());
				
				int r=pstmt.executeUpdate();					
				return "success";			
					
				}		
			else {
				sql="update userdetails set email=?,address=?,question_1=?,answer_1=?,question_2=?,answer_2=?,question_3=?,answer_3=? where id=?";
				
				pstmt= con.prepareStatement(sql);				
				
				pstmt.setString(1, UDVO.getEmail());
				pstmt.setString(2, UDVO.getAddress());
				pstmt.setString(3, "aaa");
				pstmt.setString(4, UDVO.getAnswer_1());
				pstmt.setString(5, "bbb");
				pstmt.setString(6, UDVO.getAnswer_2());
				pstmt.setString(7, "ccc");
				pstmt.setString(8, UDVO.getAnswer_3());
				pstmt.setString(9, UDVO.getId());
				int r=pstmt.executeUpdate();					
				return "success";			
				
			}		
			
				
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
			return "fail";	
		}		
		
		
		
		
		
	}
	
	
	

}
