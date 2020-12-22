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

public class ApplyTripDAO {
	private Connection con;
	PreparedStatement pstmt;
	public ResultSet resuletSet;
	FestivalApplyVO vo;
	public List<FestivalApplyVO> list;
	
	
	
	public void setallTrip() {
		list = null;
		list = new ArrayList<FestivalApplyVO>();
		
		String sql ="select no, name, area, text,sdate,edate, rdate,tag,email,checkcode" + 
				" from applytrip"; 
				
					
				
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new FestivalApplyVO();
				
				vo.setNo(rs.getInt("no"));				
				vo.setFname(rs.getString("name"));
				vo.setBig_area(rs.getString("area"));
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

	public void apply(int no,String checkcode) {
		 String sql = "update applytrip set checkcode=? where no=?";

		 
	
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);	
			pstmt.setString(1, checkcode); 
			pstmt.setInt(2,no);			
			int r = pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		
	}
}
