package com.control.service;

import com.control.dao.CcommentDAO;
import com.control.dao.FcommentDAO;
import com.control.dao.UserDAO;
import com.control.vo.CcommentVO;
import com.control.vo.FcommentVO;

public class CcommentService {

	
	CcommentDAO dao;
	UserDAO udao;
	
	public String write(CcommentVO vo) {
		dao=new CcommentDAO();
		dao.insertccomment(vo);		
		return "";
	}
}
