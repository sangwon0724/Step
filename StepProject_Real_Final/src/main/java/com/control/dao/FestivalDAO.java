package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.*;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.FestivalApplyVO;
import com.control.vo.FestivalVO;

public class FestivalDAO
{ 
	private Connection con;

	PreparedStatement pstmt;
	public ResultSet resuletSet;
	FestivalVO vo;	
	public List<FestivalVO> list;

	//萸붽��쓽 insert
	public String insertfestival(FestivalVO vo){
	String sql = "insert into festival(fno,fname,title_image,text,big_area,small_area,sdate,edate,"
	 		+ "tag,location,url) values(festival_seq.nextval, ?, ?, ?, ?,?, ?, ?, ?,?,?)";
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
			pstmt.setString(9, vo.getLocation());
			pstmt.setString(10, vo.getUrl());
			int r = pstmt.executeUpdate();				
			pstmt.close();
			con.close();
			
			sql = "insert into festival_detail(fno,rdate)"
			 		+ " values(FESTIVAL_detail_SEQ.nextval,sysdate)";
				try {
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);						
					int result = pstmt.executeUpdate();				
					pstmt.close();
					con.close();				
					return "success";
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return "error";
				}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
	}
	
	//怨좎쑀 肄붾뱶 媛믪쑝濡� �븯�굹�쓽 異뺤젣留� 異쒕젰
	public void setOneFestival(String fno) {//�뵒鍮꾩뿉 �뜲�씠�꽣 �꽔�쑝硫� �닔�젙 - �솃�럹�씠吏� 二쇱냼�옉 �뻾�궗 �옣�냼 異붽�
		list = null;
		list = new ArrayList<FestivalVO>();
		
		String sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate,f.url,f.location,location_image" + 
				" from festival f, festival_detail d" + 
				" where f.fno = d.fno and"+" f.fno='"+fno+"'";					
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			
			//next 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 true占쏙옙 占쏙옙환占싹면서 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싼어간占쏙옙. 
			while(rs.next()) {
				vo=new FestivalVO();
				vo.setFno(rs.getString("fno"));				
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
				vo.setGrade_num(rs.getInt("grade_num"));
				vo.setGrade_total(rs.getDouble("grade_total"));
				vo.setGrade();
				vo.setViews(rs.getInt("views"));
				vo.setUrl(rs.getString("url"));
				vo.setLocation(rs.getString("location"));
				vo.setLoaction_image(rs.getString("location_image"));
				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//setOneTrip 醫낅즺
	
	//�깭洹� 媛믪뿉 �쓽�빐�꽌 異쒕젰 - �쟾泥댁슜
		public void searchByTag(String orderArea,String orderCity) {

			list = null;
			list = new ArrayList<FestivalVO>();
				
			//SQL �꽕�젙
			String sql="";
				
			if(orderArea.equals("전체")&&orderCity.equals("전체")) {
				sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate" + 
					" from festival f, festival_detail d" + 
					" where f.fno = d.fno";
			}
			else if(!orderArea.equals("전체")&&orderCity.equals("전체")){
				sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate" + 
					" from festival f, festival_detail d" + 
					" where f.fno = d.fno and big_area='"+orderArea+"'";
			}
			else if(!orderArea.equals("전체")&&!orderCity.equals("전체")){
				sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate" + 
						" from festival f, festival_detail d" + 
						" where f.fno = d.fno and big_area='"+orderArea+"'"+" and small_area='"+orderCity+"'";
			}
			
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);			
				ResultSet rs=pstmt.executeQuery();
				vo=null;
					
				//next 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 true占쏙옙 占쏙옙환占싹면서 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싼어간占쏙옙. 
				while(rs.next()) {
					vo=new FestivalVO();
					vo.setFno(rs.getString("Fno"));				
					vo.setFname(rs.getString("Fname"));
					vo.setTitle_image(rs.getString("title_image"));
					vo.setBig_area(rs.getString("big_area"));
					vo.setSmall_area(rs.getString("small_area"));
					vo.setText(rs.getString("text"));
					vo.setSdate(rs.getDate("sdate"));
					vo.setEdate(rs.getDate("edate"));
					vo.setGrade_num(rs.getInt("grade_num"));
					vo.setGrade_total(rs.getDouble("grade_total"));
					vo.setGrade();
					vo.setViews(rs.getInt("views"));
					vo.setRdate(rs.getDate("rdate"));				
					vo.setTag(rs.getString("tag"));
					vo.setTags();
					list.add(vo);
				}
				rs.close();
				con.close();
					
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}//searchByTag 醫낅즺
			
		//�깭洹� 媛믪뿉 �쓽�빐�꽌 異쒕젰
		public void searchByTag(String tag,String orderArea,String orderCity) {

			list = null;
			list = new ArrayList<FestivalVO>();

			//SQL �꽕�젙
			String sql="";
			
			if(orderArea.equals("전체")&&orderCity.equals("전체")) {
				sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate" + 
						" from festival f, festival_detail d" + 
						" where f.fno = d.fno and"+" tag LIKE '%"+tag+"%'";
			}
			else if(!orderArea.equals("전체")&&orderCity.equals("전체")){
				sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate" + 
						" from festival f, festival_detail d" + 
						" where f.fno = d.fno and"+" tag LIKE '%"+tag+"%'"+"and big_area='"+orderArea+"'";
			}
			else if(!orderArea.equals("전체")&&!orderCity.equals("전체")){
				sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate" + 
						" from festival f, festival_detail d" + 
						" where f.fno = d.fno and"+" tag LIKE '%"+tag+"%'"+"and big_area='"+orderArea+"'"+" and small_area='"+orderCity+"'";
			}
			
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);			
				ResultSet rs=pstmt.executeQuery();
				vo=null;
				
				//next 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 true占쏙옙 占쏙옙환占싹면서 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싼어간占쏙옙. 
				while(rs.next()) {
					vo=new FestivalVO();
					vo.setFno(rs.getString("Fno"));				
					vo.setFname(rs.getString("Fname"));
					vo.setTitle_image(rs.getString("title_image"));
					vo.setBig_area(rs.getString("big_area"));
					vo.setSmall_area(rs.getString("small_area"));
					vo.setText(rs.getString("text"));
					vo.setSdate(rs.getDate("sdate"));
					vo.setEdate(rs.getDate("edate"));
					vo.setGrade_num(rs.getInt("grade_num"));
					vo.setGrade_total(rs.getDouble("grade_total"));
					vo.setGrade();
					vo.setViews(rs.getInt("views"));
					vo.setRdate(rs.getDate("rdate"));				
					vo.setTag(rs.getString("tag"));
					vo.setTags();
					list.add(vo);
				}
				rs.close();
				con.close();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}//searchByTag 醫낅즺
		
		//吏��뿭 媛믪뿉 �쓽�빐�꽌 異쒕젰
		public void setAreaTrip(String area) {
			list = null;
			list = new ArrayList<FestivalVO>();
			
			String sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate" + 
					" from festival f, festival_detail d" + 
					" where f.fno = d.fno and"+" big_area='"+area+"'";
					
					
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);			
				ResultSet rs=pstmt.executeQuery();
				vo=null;
				
				//next 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 true占쏙옙 占쏙옙환占싹면서 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싼어간占쏙옙. 
				while(rs.next()) {
					vo=new FestivalVO();
					vo.setFno(rs.getString("Fno"));				
					vo.setFname(rs.getString("Fname"));
					vo.setTitle_image(rs.getString("title_image"));
					vo.setBig_area(rs.getString("big_area"));
					vo.setSmall_area(rs.getString("small_area"));
					vo.setText(rs.getString("text"));
					vo.setSdate(rs.getDate("sdate"));
					vo.setEdate(rs.getDate("edate"));	
					vo.setGrade_num(rs.getInt("grade_num"));
					vo.setGrade_total(rs.getDouble("grade_total"));
					vo.setGrade();
					vo.setViews(rs.getInt("views"));
					vo.setRdate(rs.getDate("rdate"));				
					vo.setTag(rs.getString("tag"));
					vo.setTags();
					list.add(vo);
				}
				rs.close();
				con.close();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}//setAreaTrip 醫낅즺
		
		//寃��깋 寃곌낵
				public void searchByWord(String word) {
					list = null;
					list = new ArrayList<FestivalVO>();
					
					String sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate "
						      + "from festival f, festival_detail d "
						      + "where (f.fno = d.fno and fname like '%"+word+"%') "
						      + "or (f.fno = d.fno and f.big_area like '%"+word+"%') "
							  + "or (f.fno = d.fno and f.small_area like '%"+word+"%') "
						      + "or (f.fno = d.fno and f.text like '%"+word+"%')"
						      + "or (f.fno = d.fno and tag like '%"+word+"%')";
					
					try {
						con = Connector.getCon();
						pstmt= con.prepareStatement(sql);			
						ResultSet rs=pstmt.executeQuery();
						vo=null;
						
						//next 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 true占쏙옙 占쏙옙환占싹면서 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싼어간占쏙옙. 
						while(rs.next()) {
							vo=new FestivalVO();
							vo.setFno(rs.getString("Fno"));				
							vo.setFname(rs.getString("Fname"));
							vo.setTitle_image(rs.getString("title_image"));
							vo.setBig_area(rs.getString("big_area"));
							vo.setSmall_area(rs.getString("small_area"));
							vo.setText(rs.getString("text"));
							vo.setSdate(rs.getDate("sdate"));
							vo.setEdate(rs.getDate("edate"));
							vo.setGrade_num(rs.getInt("grade_num"));
							vo.setGrade_total(rs.getDouble("grade_total"));
							vo.setGrade();
							vo.setViews(rs.getInt("views"));
							vo.setRdate(rs.getDate("rdate"));				
							vo.setTag(rs.getString("tag"));
							vo.setTags();
							list.add(vo);
						}
						rs.close();
						con.close();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}//searchByWord 醫낅즺
				
				//怨꾩옒蹂� 寃곌낵
				public void searchBySeason(int number) {
					list = null;
					list = new ArrayList<FestivalVO>();
					
					//Date date=new Date();
					Calendar today = Calendar.getInstance();

					int year=today.get(Calendar.YEAR);
					int startYear = 0;
					int endYear=0;
					String startMonth = "";
					String endMonth="";
					int endDay=0;
					
					if(number==1) {
						startYear=year;
						endYear=year;
						startMonth="03";
						endMonth="05";
						endDay=31;
					}
					else if (number==2) {
						startYear=year;
						endYear=year;
						startMonth="06";
						endMonth="08";
						endDay=31;
					}
					else if (number==3) {
						startYear=year;
						endYear=year;
						startMonth="09";
						endMonth="11";
						endDay=30;
					}
					else if (number==4) {
						startYear=year;
						endYear=year+1;
						startMonth="12";
						endMonth="02";
						if((endYear%4==0 && endYear%100!=0) || endYear%400==0) {
							endDay=29;
						}
						else {
							endDay=28;
						}
					}
					
					String sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate "
						      + "from festival f, festival_detail d "
						      + "where f.fno = d.fno and sdate between "
						      +"'"+startYear+"-"+startMonth+"-01' and "
						      +"'"+endYear+"-"+endMonth+"-"+endDay+"'";	

					try {
						con = Connector.getCon();
						pstmt= con.prepareStatement(sql);			
						ResultSet rs=pstmt.executeQuery();
						vo=null;
						
						//next 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 true占쏙옙 占쏙옙환占싹면서 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싼어간占쏙옙. 
						while(rs.next()) {
							vo=new FestivalVO();
							vo.setFno(rs.getString("Fno"));				
							vo.setFname(rs.getString("Fname"));
							vo.setTitle_image(rs.getString("title_image"));
							vo.setBig_area(rs.getString("big_area"));
							vo.setSmall_area(rs.getString("small_area"));
							vo.setText(rs.getString("text"));
							vo.setSdate(rs.getDate("sdate"));
							vo.setEdate(rs.getDate("edate"));
							vo.setGrade_num(rs.getInt("grade_num"));
							vo.setGrade_total(rs.getDouble("grade_total"));
							vo.setGrade();
							vo.setViews(rs.getInt("views"));
							vo.setRdate(rs.getDate("rdate"));				
							vo.setTag(rs.getString("tag"));
							vo.setTags();
							list.add(vo);
						}
						rs.close();
						con.close();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}//searchBySeason 醫낅즺
				
				//�썡蹂� 寃곌낵
				public void searchByMonth(int number) {
					list = null;
					list = new ArrayList<FestivalVO>();
					
					//Date date=new Date();
					Calendar today = Calendar.getInstance();

					int year=today.get(Calendar.YEAR);
					int endDay=0;
					
					switch (number) {
					case 1:
					case 3:
					case 5:
					case 7:
					case 8:
					case 10:
					case 12:
						endDay=31;
						break;
					case 4:
					case 6:
					case 9:
					case 11:
						endDay=30;
						break;
					}
					
					if(number==2) {
						if((year%4==0 && year%100!=0) || year%400==0) {
							endDay=29;
						}
						else {
							endDay=28;
						}
					}
					
					String sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate "
						      + "from festival f, festival_detail d "
						      + "where f.fno = d.fno and sdate between "
						      +"'"+year+"-"+number+"-01' and "
						      +"'"+year+"-"+number+"-"+endDay+"'";	
					
					try {
						con = Connector.getCon();
						pstmt= con.prepareStatement(sql);			
						ResultSet rs=pstmt.executeQuery();
						vo=null;
						
						//next 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 true占쏙옙 占쏙옙환占싹면서 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싼어간占쏙옙. 
						while(rs.next()) {
							vo=new FestivalVO();
							vo.setFno(rs.getString("Fno"));				
							vo.setFname(rs.getString("Fname"));
							vo.setTitle_image(rs.getString("title_image"));
							vo.setBig_area(rs.getString("big_area"));
							vo.setSmall_area(rs.getString("small_area"));
							vo.setText(rs.getString("text"));
							vo.setSdate(rs.getDate("sdate"));
							vo.setEdate(rs.getDate("edate"));
							vo.setGrade_num(rs.getInt("grade_num"));
							vo.setGrade_total(rs.getDouble("grade_total"));
							vo.setGrade();
							vo.setViews(rs.getInt("views"));
							vo.setRdate(rs.getDate("rdate"));				
							vo.setTag(rs.getString("tag"));
							vo.setTags();
							list.add(vo);
						}
						rs.close();
						con.close();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}//searchByMonth 醫낅즺
				
				//�옲�궧�슜 �엫�떆 �븿�닔
				public void setRankList() {
					list = null;
					list = new ArrayList<FestivalVO>();
					
					String sql ="select f.fno, fname, title_image,text,big_area,small_area,sdate,edate,tag,d.grade_total,d.grade_num,d.views,d.rdate "+
							"from festival f, festival_detail d "+
							"where f.fno = d.fno";
					
					try {
						con = Connector.getCon();
						pstmt= con.prepareStatement(sql);			
						ResultSet rs=pstmt.executeQuery();
						vo=null;
						
						//next 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 true占쏙옙 占쏙옙환占싹면서 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싼어간占쏙옙. 
						while(rs.next()) {
							vo=new FestivalVO();
							vo.setFno(rs.getString("fno"));				
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
							vo.setGrade_num(rs.getInt("grade_num"));
							vo.setGrade_total(rs.getDouble("grade_total"));
							vo.setGrade();
							vo.setViews(rs.getInt("views"));			
							
							list.add(vo);
						}
						rs.close();
						con.close();
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}//setRankList 醫낅즺
				public void order_asc(String type) {
					//v1 v2 �삤由꾩감�닚
					//v2 v1 �궡由쇱감�닚
				      
				      if(type.equals("grade")) {
				         Collections.sort(list, new Comparator<FestivalVO>() {         
				            @Override
				            public int compare(FestivalVO v1, FestivalVO v2) {
				               // TODO Auto-generated method stub
				               return v1.getGrade().compareTo(v2.getGrade());
				            }         
				         });         
				      }
				      else if(type.equals("rdate")){
				         Collections.sort(list, new Comparator<FestivalVO>() {         
				            @Override
				            public int compare(FestivalVO v1, FestivalVO v2) {
				               // TODO Auto-generated method stub
				               return v1.getRdate().compareTo(v2.getRdate());
				            }         
				         });   
				      }
				      else if(type.equals("views")){
					         Collections.sort(list, new Comparator<FestivalVO>() {         
					            @Override
					            public int compare(FestivalVO v1, FestivalVO v2) {
					               // TODO Auto-generated method stub
					               return v1.getViews() > v2.getViews() ? -1 : v1.getViews() < v2.getViews() ? 1:0;
					            }         
					         });   
					         
					  }
				      else if(type.equals("sdate")){
					         Collections.sort(list, new Comparator<FestivalVO>() {         
					            @Override
					            public int compare(FestivalVO v1, FestivalVO v2) {
					               // TODO Auto-generated method stub
					               return v1.getSdate().compareTo(v2.getSdate());
					            }         
					         });   
					  }
				   }
				
				public void order_desc(String type) {
					//v1 v2 �삤由꾩감�닚
					//v2 v1 �궡由쇱감�닚
				      
				      if(type.equals("grade")) {
				         Collections.sort(list, new Comparator<FestivalVO>() {         
				            @Override
				            public int compare(FestivalVO v1, FestivalVO v2) {
				               // TODO Auto-generated method stub
				               return v2.getGrade().compareTo(v1.getGrade());
				            }         
				         });         
				      }
				      else if(type.equals("rdate")){
				         Collections.sort(list, new Comparator<FestivalVO>() {         
				            @Override
				            public int compare(FestivalVO v1, FestivalVO v2) {
				               // TODO Auto-generated method stub
				               return v2.getRdate().compareTo(v1.getRdate());
				            }         
				         });   
				         
				      }
				      else if(type.equals("views")){
					         Collections.sort(list, new Comparator<FestivalVO>() {         
					            @Override
					            public int compare(FestivalVO v1, FestivalVO v2) {
					               // TODO Auto-generated method stub
					               return v1.getViews() > v2.getViews() ? -1 : v1.getViews() < v2.getViews() ? 1:0;
					            }         
					         });   
					         
					      }
				      
				   }
				
				
			public String viewsup(String fno) {
					 String sql = "update festival_detail set views=views+1 where fno=?";		 
						try {				
								con = Connector.getCon();
								pstmt= con.prepareStatement(sql);	
								pstmt.setString(1,fno);								
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
			public String updategrade(String fno,Double grade) {
				String sql = "update festival_detail set grade_total=grade_total+? where fno=?";		 
				try {				
						con = Connector.getCon();
						pstmt= con.prepareStatement(sql);
						pstmt.setDouble(1, grade);
						pstmt.setString(2,fno);								
						int r = pstmt.executeUpdate();	
						
						sql = "update festival_detail set grade_num=grade_num+1 where fno=?";

						con = Connector.getCon();
						pstmt= con.prepareStatement(sql);						
						pstmt.setString(1,fno);								
						r = pstmt.executeUpdate();	
						
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
