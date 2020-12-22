package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.FcommentVO;
import com.control.vo.ReviewVO;


public class FcommentDAO {
	
	
	private Connection con;
	PreparedStatement pstmt;
	public ResultSet resuletSet;
	FcommentVO vo;
	public List<FcommentVO> list;
	
	public String insertfcomment(FcommentVO vo){
		
		String sql = "insert into fcomment(no,fno,id,name,grade,text)"
		 		+  "values(fcomment_seq.nextval, ?, ?, ?, ?,?)";
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);	

				pstmt.setString(1,vo.getFno());
				pstmt.setString(2,vo.getId());
				pstmt.setString(3,vo.getName());
				pstmt.setDouble(4,vo.getGrade());
				pstmt.setString(5,vo.getText());
				int r = pstmt.executeUpdate();				
				pstmt.close();
				con.close();
				
				return "success";			
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}			
			
		}
	
	public void setidfcomment(String id) {
		list = null;
		list = new ArrayList<FcommentVO>();
		
		String sql ="select no,fno,id,name,text,grade,rdate" + 
				" from fcomment" +					
				" where id='"+id+"'";	
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new FcommentVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setFno(rs.getString("fno"));
				vo.setId(rs.getString("id"));	
				vo.setName(rs.getString("name"));			
				vo.setText(rs.getString("text"));
				vo.setGrade(rs.getDouble("grade"));
				vo.setRdate(rs.getDate("rdate"));	

				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void setfestivalfcomment(String fno) {
		list = null;
		list = new ArrayList<FcommentVO>();
		
		String sql ="select no,fno,id,name,text,grade,rdate" + 
				" from fcomment" +					
				" where fno='"+fno+"'";	
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new FcommentVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setFno(rs.getString("fno"));
				vo.setId(rs.getString("id"));	
				vo.setName(rs.getString("name"));			
				vo.setText(rs.getString("text"));
				vo.setGrade(rs.getDouble("grade"));
				vo.setRdate(rs.getDate("rdate"));	

				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public String checkfcomment(String fno,String id) {
		String sql ="select fno,id " + 
				" from fcomment" +					
				" where fno='"+fno+"' and id='"+id+"'";	
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			if(rs.next()) {
				rs.close();
				con.close();
				return "Y";
			}
			else {
				rs.close();
				con.close();
				return "N";
			}		
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "N";
		}
		
	}

}
