package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;

import com.control.vo.FestivalApplyVO;
import com.control.vo.FestivalVO;


public class FestivalApplyDAO {
	
	private Connection con;
	PreparedStatement pstmt;
	public ResultSet resuletSet;
	FestivalApplyVO vo;
	public List<FestivalApplyVO> list;
	
	public String registFestival(FestivalApplyVO vo) { 
		
		 String sql = "insert into festival_apply(no,fname,title_image,text,big_area,small_area,sdate,edate,"
		 		+ "tag,id,email,phone,rdate,checkcode,location,url) values(festival_apply_seq.nextval, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, sysdate, ?,?,?)";		 
			
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);	
				pstmt.setString(1,vo.getFname()); 
				pstmt.setString(2,vo.getTitle_image());
				pstmt.setString(3,vo.getText());
				pstmt.setString(4,vo.getBig_area());
				pstmt.setString(5,vo.getSmall_area());
				pstmt.setDate(6,vo.getSdate());
				pstmt.setDate(7,vo.getEdate());
				pstmt.setString(8,vo.getTag());
				pstmt.setString(9,vo.getId());
				pstmt.setString(10,vo.getEmail());
				pstmt.setString(11,vo.getPhone());						
				pstmt.setString(12,"N");
				pstmt.setString(13,vo.getLocation());			
				pstmt.setString(14,vo.getUrl());			
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
	
	public void setallFestival() {
		list = null;
		list = new ArrayList<FestivalApplyVO>();
		
		String sql ="select no, fname,title_image, big_area, small_area, text,sdate,edate, rdate,tag,email,phone,rdate,checkcode" + 
				" from festival_apply"; 				
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new FestivalApplyVO();
				
				vo.setNo(rs.getInt("no"));				
				vo.setFname(rs.getString("fname"));
				vo.setTitle_image(rs.getString("title_image"));
				vo.setBig_area(rs.getString("big_area"));
				vo.setSmall_area(rs.getString("small_area"));
				vo.setText(rs.getString("text"));
				vo.setSdate(rs.getDate("sdate"));
				vo.setEdate(rs.getDate("edate"));				
				vo.setRdate(rs.getDate("rdate"));	
				vo.setTag(rs.getString("tag"));				
				vo.setTags();
				vo.setEmail(rs.getString("email"));
				vo.setCheckcode(rs.getString("checkcode"));
				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public void setonefestival(int no) {
		list = null;
		list = new ArrayList<>();
		
		String sql ="select no, fname,title_image, big_area, small_area, text,sdate,edate, rdate,tag,email,phone,rdate,checkcode" + 
				" from festival_apply" 	 + 
				" where no='"+no+"'";						
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new FestivalApplyVO();
				vo.setNo(rs.getInt("no"));				
				vo.setFname(rs.getString("fname"));
				vo.setTitle_image(rs.getString("title_image"));
				vo.setBig_area(rs.getString("big_area"));
				vo.setSmall_area(rs.getString("small_area"));
				vo.setText(rs.getString("text"));
				vo.setSdate(rs.getDate("sdate"));
				vo.setEdate(rs.getDate("edate"));				
				vo.setRdate(rs.getDate("rdate"));	
				vo.setTag(rs.getString("tag"));				
				vo.setTags();
				vo.setEmail(rs.getString("email"));
				vo.setCheckcode(rs.getString("checkcode"));
				list.add(vo);
			}
			rs.close();
			con.close();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	
	
	public String applyFestival(int no,String checkcode) {
		String sql = "update festival_apply set checkcode=? where no=?";		
			try {
				if(checkcode.equals("Y")) {
					
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);	
					pstmt.setString(1, checkcode); 
					pstmt.setInt(2,no);			
					int r = pstmt.executeUpdate();				
					pstmt.close();
					con.close();
					return checkcode;
					
				}
				else if(checkcode.equals("N")){
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);	
					pstmt.setString(1, checkcode); 
					pstmt.setInt(2,no);			
					int r = pstmt.executeUpdate();				
					pstmt.close();
					con.close();
					return checkcode;
					
				}
				else {
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);	
					pstmt.setString(1, checkcode); 
					pstmt.setInt(2,no);			
					int r = pstmt.executeUpdate();				
					pstmt.close();
					con.close();
					return checkcode;
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "fail";
			}
	}
	
	public void delete(int no) {
		String sql ="delete festival_apply" + 				 					
				" where no="+no+"";					
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			int rs=pstmt.executeUpdate();	
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			pstmt.close();		 
			con.close();			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
