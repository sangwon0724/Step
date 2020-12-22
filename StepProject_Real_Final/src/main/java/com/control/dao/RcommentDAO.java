package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.CcommentVO;
import com.control.vo.FcommentVO;
import com.control.vo.RcommentVO;

public class RcommentDAO {
	private Connection con;
	PreparedStatement pstmt;
	public ResultSet resuletSet;
	RcommentVO vo;
	public List<RcommentVO> list;
	
	public String insertRcomment(RcommentVO vo){
		
		String sql = "insert into rcomment(no,rno,id,text)"
		 		+  "values(rcomment_seq.nextval, ?, ?,?)";
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);	
				pstmt.setString(1,vo.getRno());
				pstmt.setString(2,vo.getId());
				pstmt.setString(3,vo.getText());
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
	
	public void setreviewcomment(int rno) {
		list = null;
		list = new ArrayList<RcommentVO>();
		
		String sql ="select no,rno,id,text,rdate" + 
				" from rcomment" +					
				" where rno="+rno+"";	
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new RcommentVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setRno(rs.getString("Rno"));
				vo.setId(rs.getString("id"));			
				vo.setText(rs.getString("text"));
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
	
	public void setidrcomment(String id) {
		list = null;
		list = new ArrayList<RcommentVO>();
		
		String sql ="select no,Rno,id,name,text,rdate" + 
				" from Rcomment" +					
				" where id='"+id+"'";	
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new RcommentVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setRno(rs.getString("fno"));
				vo.setId(rs.getString("id"));	
				vo.setName(rs.getString("name"));			
				vo.setText(rs.getString("text"));				
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
	
	
}
