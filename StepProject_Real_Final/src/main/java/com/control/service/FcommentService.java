package com.control.service;

import com.control.dao.FcommentDAO;
import com.control.dao.FestivalDAO;
import com.control.dao.ReviewDAO;
import com.control.dao.UserDAO;
import com.control.vo.FcommentVO;


public class FcommentService {
	
	FcommentDAO dao;
	UserDAO udao;
	
	public String write(FcommentVO vo) {
		dao=new FcommentDAO();
		FestivalDAO fdao=new FestivalDAO();
		udao=new UserDAO();
		
		if(dao.checkfcomment(vo.getFno(), vo.getId()).equals("Y")) {
			return "fail";

		}
		else if(dao.checkfcomment(vo.getFno(), vo.getId()).equals("N")) {
			String name =udao.selectName(vo.getId());
			vo.setName(name);			
			dao.insertfcomment(vo);	
			fdao.updategrade(vo.getFno(), vo.getGrade());
			return "success";
		}			
		return "error";
	}
	
	
	
	

}
