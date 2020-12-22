package com.control.service;


import com.control.dao.RcommentDAO;
import com.control.dao.UserDAO;
import com.control.vo.FcommentVO;
import com.control.vo.RcommentVO;

public class RcommentService {
	RcommentDAO dao;
	UserDAO udao;
	
	public String write(RcommentVO vo) {
		dao=new RcommentDAO();
		udao=new UserDAO();
		dao.insertRcomment(vo);		
		return "";
	}
}
