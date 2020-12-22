package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.FestivalVO;
import com.control.vo.FratingVO;
import com.control.vo.ReviewVO;

public class FratingDAO {

	private Connection con;

	PreparedStatement pstmt;
	public ResultSet resuletSet;
	FratingVO vo;	
	public List<FratingVO> list;
	
	public void setallrating() {
		list = null;
		list = new ArrayList<FratingVO>();
		
		String sql ="select fno,aviews,bviews,rating" + 
				" from frating" +				
				" order by rating desc";	
				
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new FratingVO();							
				vo.setFno(rs.getString("fno"));
				vo.setAviews(rs.getInt("aviews"));
				vo.setBviews(rs.getInt("bviews"));
				vo.setRating(rs.getInt("rating"));
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
