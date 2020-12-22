package com.control.service;

import com.control.dao.ReviewDAO;
import com.control.vo.ReviewVO;

public class ReviewService {
	
	ReviewDAO dao;
	
	public String write(ReviewVO vo) {
		dao=new ReviewDAO();
		dao.insertReview(vo);		
		return "";
	}
	
	public String viewsup(int no) {
		dao=new ReviewDAO();
		dao.viewsup(no);		
		return "";		
		
	}
	public String delete(int no) {
		dao=new ReviewDAO();
		dao.delete(no);		
		return "";
		
	}

}
