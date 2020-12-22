package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.control.connector.Connector;
import com.control.vo.FestivalVO;
import com.control.vo.ReviewVO;
public class ReviewDAO {
	
	private Connection con;
	PreparedStatement pstmt;
	public ResultSet resuletSet;
	ReviewVO vo;
	public List<ReviewVO> list;
	
	
	public String insertReview(ReviewVO vo){
		String sql = "insert into review(no,fno,id,title,text,grade,rdate)"
		 		+  "values(review_seq.nextval, ?, ?, ?, ?,?, sysdate)";
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);	
				pstmt.setString(1,vo.getFno()); 
				pstmt.setString(2,vo.getId());
				pstmt.setString(3,vo.getTitle());
				pstmt.setString(4,vo.getText());
				pstmt.setInt(5,vo.getGrade());				
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
	
	//전체 출력
	public void setallReview(String sort,String desc) {
		list = null;
		list = new ArrayList<ReviewVO>();
		
		String sql ="select no,fno,id,title,text,grade,rdate,likenum,dislikenum,views" + 
				" from review " +				
				"order by "+sort+" "+desc+"";
		
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new ReviewVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setFno(rs.getString("fno"));
				vo.setId(rs.getString("id"));				
				vo.setTitle(rs.getString("title"));				
				vo.setText(rs.getString("text"));
				vo.setGrade(rs.getInt("grade"));
				vo.setRdate(rs.getDate("rdate"));	
				vo.setLikenum(rs.getInt("likenum"));
				vo.setDislikenum(rs.getInt("dislikenum"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//검색용 - 전체
	public void setallReview(String word,String sort,String desc) {
		list = null;
		list = new ArrayList<ReviewVO>();
		
		String sql ="select no,fno,id,title,text,grade,rdate,likenum,dislikenum,views "
					+ "from review "
					+ "where (id like '%"+word+"%') "
					+ "or (title like '%"+word+"%') "
					+ "order by "+sort+" "+desc+"";	
				
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new ReviewVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setFno(rs.getString("fno"));
				vo.setId(rs.getString("id"));				
				vo.setTitle(rs.getString("title"));				
				vo.setText(rs.getString("text"));
				vo.setGrade(rs.getInt("grade"));
				vo.setRdate(rs.getDate("rdate"));	
				vo.setLikenum(rs.getInt("likenum"));
				vo.setDislikenum(rs.getInt("dislikenum"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//전체 출력 - fno 존재
	public void setFnoReview(String fno, String sort,String desc) {
			list = null;
			list = new ArrayList<ReviewVO>();
			
			String sql ="select no,fno,id,title,text,grade,rdate,likenum,dislikenum,views" + 
					" from review " +
					" where fno='"+fno+
					"' order by "+sort+" "+desc+"";
			
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);			
				ResultSet rs=pstmt.executeQuery();
				vo=null;
				
				//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
				while(rs.next()) {
					vo=new ReviewVO();				
					vo.setNo(rs.getInt("no"));				
					vo.setFno(rs.getString("fno"));
					vo.setId(rs.getString("id"));				
					vo.setTitle(rs.getString("title"));				
					vo.setText(rs.getString("text"));
					vo.setGrade(rs.getInt("grade"));
					vo.setRdate(rs.getDate("rdate"));	
					vo.setLikenum(rs.getInt("likenum"));
					vo.setDislikenum(rs.getInt("dislikenum"));
					vo.setViews(rs.getInt("views"));
					list.add(vo);
				}
				rs.close();
				con.close();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
	//view 페이지용
	public void setoneReview(int no) {
		list = null;
		list = new ArrayList<ReviewVO>();
		
		String sql ="select no,fno,id,title,text,grade,rdate,likenum,dislikenum,views" + 
				" from review" +					
				" where no="+no+"";	
				
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new ReviewVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setFno(rs.getString("fno"));
				vo.setId(rs.getString("id"));				
				vo.setTitle(rs.getString("title"));				
				vo.setText(rs.getString("text"));
				vo.setGrade(rs.getInt("grade"));
				vo.setRdate(rs.getDate("rdate"));	
				vo.setLikenum(rs.getInt("likenum"));
				vo.setDislikenum(rs.getInt("dislikenum"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void setfestivalReview(String fno) {
		list = null;
		list = new ArrayList<ReviewVO>();
		
		String sql ="select no,fno,id,title,text,grade,rdate,likenum,dislikenum,views" + 
				" from review" +					
				" where fno='"+fno+"'";	
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new ReviewVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setFno(rs.getString("fno"));
				vo.setId(rs.getString("id"));				
				vo.setTitle(rs.getString("title"));				
				vo.setText(rs.getString("text"));
				vo.setGrade(rs.getInt("grade"));
				vo.setRdate(rs.getDate("rdate"));	
				vo.setLikenum(rs.getInt("likenum"));
				vo.setDislikenum(rs.getInt("dislikenum"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void setIdReview(String id) {
		list = null;
		list = new ArrayList<ReviewVO>();
		
		String sql ="select no,fno,id,title,text,grade,rdate,likenum,dislikenum,views" + 
				" from review" +					
				" where id='"+id+"'";	
				
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next �������� ������ true�� ��ȯ�ϸ鼭 ���������� �Ѿ��. 
			while(rs.next()) {
				vo=new ReviewVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setFno(rs.getString("fno"));
				vo.setId(rs.getString("id"));				
				vo.setTitle(rs.getString("title"));				
				vo.setText(rs.getString("text"));
				vo.setGrade(rs.getInt("grade"));
				vo.setRdate(rs.getDate("rdate"));	
				vo.setLikenum(rs.getInt("likenum"));
				vo.setDislikenum(rs.getInt("dislikenum"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void delete(int no) {
		String sql ="delete review" + 				 					
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
		 String sql = "update review set views=views+1 where no=?";		 
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
