package com.control.service;

import com.control.dao.CommunityDAO;
import com.control.vo.CommunityVO;

public class CommunityService {
	
	CommunityDAO dao;
	
	public String write(CommunityVO vo) {
		dao=new CommunityDAO();
		dao.insertCommunty(vo);
		return "";
	}
	
	public String viewsup(int no) {
		dao=new CommunityDAO();
		dao.viewsup(no);		
		return "";		
		
	}
	public String delete(int no) {
		dao=new CommunityDAO();
		dao.delete(no);		
		return "";
		
	}


}
