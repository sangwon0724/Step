package com.control.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.aspectj.lang.annotation.Before;

import com.control.connector.Connector;
import com.control.vo.UserVO;

public class UserDAO {
	private Connection con;
	PreparedStatement pstmt;
	
	public String Login(UserVO CVO) {
		
		String sql ="select id,password,name" + 
				" from jfuser" + 
				" where id='"+CVO.getId()+"'";
		Connector conn=new Connector();
		con=conn.getCon();
		
		try {
			Statement stmt= con.createStatement();			
			ResultSet rs=stmt.executeQuery(sql);
			
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��.
			if(rs.next()) {
				if(rs.getString("password").equals(CVO.getPassword())){
					String name= rs.getString("name");
					rs.close();
					con.close();
					return name;
				}
				else {
					rs.close();
					con.close();
					return null;
				}			
				
			}
			else {
				rs.close();
				con.close();
				return null;				
			}		
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return null;	
		}		
		
		
	};
	
	public String Update(UserVO CVO) {
		String sql = "select id" +
				" from jfuser" +
				" where id='"+CVO.getId()+"'";
		Connector conn = new Connector();
		con=conn.getCon();
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	};
	
	public String Join(UserVO CVO) {
		
		String sql ="select id" + 
				" from jfuser" + 
				" where id='"+CVO.getId()+"'";
		Connector conn=new Connector();
		con=conn.getCon();
		
		try {
			Statement stmt= con.createStatement();			
			ResultSet rs=stmt.executeQuery(sql);
			
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��.
			if(rs.next()) {				
					return "sameid";
				}		
			else {
				sql="insert into jfuser(id,password,name,phone) values(?,?,?,?)";
				
				pstmt= con.prepareStatement(sql);				
				pstmt.setString(1, CVO.getId());
				pstmt.setString(2, CVO.getPassword());
				pstmt.setString(3, CVO.getName());
				pstmt.setString(4, CVO.getPhone());
				int r=pstmt.executeUpdate();					
				return "join";				
			}		
			
				
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
			return "fail";	
		}		
		
		
		
		
	}
	public String updatePassword(UserVO vo) {
		 String sql = "update jfuser set password=? where id=?";		 
			try {				
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);	
					pstmt.setString(1, vo.getPassword()); 
					pstmt.setString(2,vo.getId());			
					int r = pstmt.executeUpdate();				
					pstmt.close();
					con.close();
					return "success";		
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "fail";
			}
	}
	
	public String updatePhone(UserVO vo) {
		 String sql = "update jfuser set phone=? where id=?";		 
			try {				
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);	
					pstmt.setString(1, vo.getPhone()); 
					pstmt.setString(2,vo.getId());			
					int r = pstmt.executeUpdate();				
					pstmt.close();
					con.close();
					return "success";		
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "fail";
			}
	}
	
	public String selectName(String id) {

		String sql ="select id,name" + 
				" from jfuser" + 
				" where id='"+id+"'";
		Connector conn=new Connector();
		con=conn.getCon();
		
		try {
			Statement stmt= con.createStatement();			
			ResultSet rs=stmt.executeQuery(sql);
			
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��.
			if(rs.next()) {
		
					String name= rs.getString("name");
					rs.close();
					con.close();
					return name;
				}
			else {
				return "fail";
				
			}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return null;	
		}		
		
		
	}
	
	public String checkid(String id) {

		
		  Connector conn=new Connector();
	      con=conn.getCon();
	      
	      String sql ="select id" + 
	            " from jfuser" + 
	            " where id='"+id+"'";
	      
	      
	      try {
	         Statement stmt= con.createStatement();         
	         ResultSet rs=stmt.executeQuery(sql);         
	         

	         if(rs.next()) {                     
	               return "yes";
	            }
	         else {
	            return "no";
	            
	         }
	            
	         
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         
	         e.printStackTrace();
	         return "error";   
	      }      
	      
	      
	   }
	

}
