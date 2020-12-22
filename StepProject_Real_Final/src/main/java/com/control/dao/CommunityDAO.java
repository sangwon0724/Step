package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.CommunityVO;
import com.control.vo.FestivalVO;

public class CommunityDAO {		
			
	private Connection con;
	PreparedStatement pstmt;
	public ResultSet resultSet;
	CommunityVO vo;
	public List<CommunityVO> list;
	
	//전체 게시물 출력
	public String selectCommunity() {
		list = null;
		list = new ArrayList<CommunityVO>();
		String sql = "select no,id, title, signdate, views from community order by no desc";		
		ResultSet rs;
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			vo=null;
			
			while(rs.next()) {
				vo=new CommunityVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setId(rs.getString("id"));
				vo.setSigndate(rs.getDate("signdate"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();			
			con.close();
			
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
			return "error";
		}
	}
	
	//검색용
	public String selectCommunity(String word) {
		list = null;
		list = new ArrayList<CommunityVO>();
		String sql = "select no,id, title, signdate, views from community "
			      + "where (id like '%"+word+"%') "
			      + "or (title like '%"+word+"%') "
				  + "order by no desc";		
		ResultSet rs;
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			vo=null;
			
			while(rs.next()) {
				vo=new CommunityVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setId(rs.getString("id"));
				vo.setSigndate(rs.getDate("signdate"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();			
			con.close();
			
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
			return "error";
		}
	}
	
	public String setoneCommunity(int no) {
		list = null;
		list = new ArrayList<CommunityVO>();
		String sql = "select no,id,com, title, signdate, views from community where no="+no+"";		
		ResultSet rs;
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			vo=null;
			
			while(rs.next()) {
				vo=new CommunityVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setId(rs.getString("id"));
				vo.setCom(rs.getString("com"));
				vo.setSigndate(rs.getDate("signdate"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();			
			con.close();
			
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
			return "error";
		}
	}
	
	public String setIdCommunity(String id) {
		list = null;
		list = new ArrayList<CommunityVO>();
		String sql = "select no,id,com, title, signdate, views from community where id='"+id+"'";		
		ResultSet rs;
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			vo=null;
			
			while(rs.next()) {
				vo=new CommunityVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setId(rs.getString("id"));
				vo.setCom(rs.getString("com"));
				vo.setSigndate(rs.getDate("signdate"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();			
			con.close();
			
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
			return "error";
		}
	}
	
	public String insertCommunty(CommunityVO vo) {
		String sql = "insert into COMMUNITY(no,id,title,com, signdate) "
				+ " values(COMMUNITY_SEQ.nextval, ?, ?, ?, sysdate)";
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);				
				pstmt.setString(1,vo.getId());
				pstmt.setString(2,vo.getTitle());
				pstmt.setString(3,vo.getCom());
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
	

	public void delete(int no) {
		String sql ="delete community" + 				 					
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
	
	public String viewsup(int no) {
		 String sql = "update community set views=views+1 where no=?";		 
			try {				
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);	
					pstmt.setInt(1,no);								
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
}
