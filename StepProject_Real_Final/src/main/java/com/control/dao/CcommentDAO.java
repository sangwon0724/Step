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

public class CcommentDAO {

	
	private Connection con;
	PreparedStatement pstmt;
	public ResultSet resuletSet;
	CcommentVO vo;
	public List<CcommentVO> list;
	
	public String insertccomment(CcommentVO vo){
		
		String sql = "insert into ccomment(no,cno,id,name,text)"
		 		+  "values(ccomment_seq.nextval, ?, ?, ?, ?)";
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);	
				pstmt.setString(1,vo.getCno());
				pstmt.setString(2,vo.getId());
				pstmt.setString(3,vo.getName());
				pstmt.setString(4,vo.getText());
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
	
	public void setccomment(int cno) {
		list = null;
		list = new ArrayList<CcommentVO>();
		
		String sql ="select no,cno,id,text,rdate" + 
				" from ccomment" +					
				" where cno="+cno+"";	
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new CcommentVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setCno(rs.getString("cno"));
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
	
	public void setidccomment(String id) {
		list = null;
		list = new ArrayList<CcommentVO>();
		
		String sql ="select no,cno,id,name,text,rdate" + 
				" from Ccomment" +					
				" where id='"+id+"'";	
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new CcommentVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setCno(rs.getString("fno"));
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
