package com.control.service;

import com.control.dao.FestivalApplyDAO;
import com.control.dao.FestivalDAO;
import com.control.vo.FestivalApplyVO;
import com.control.vo.FestivalVO;

public class FestivalApplyService {
	
	FestivalApplyDAO dao;
	FestivalApplyVO vo;
	
	public String regist() {
		dao=new FestivalApplyDAO();
		return dao.registFestival(vo);
	}
	
	public String apply(String fno,String checkcode) {
		dao=new FestivalApplyDAO();			
		int no=Integer.parseInt(fno);
		if(dao.applyFestival(no , checkcode).equals("Y")) {
			dao.setonefestival(no);
			FestivalVO fvo=new FestivalVO(dao.list.get(0));
			FestivalDAO fDAO=new FestivalDAO();
			if(fDAO.insertfestival(fvo).equals("success")) {
				dao.delete(no);
				return "success";				
			};
		}
		else if(dao.applyFestival(no , checkcode).equals("N")) {
			dao.delete(no);
		}
		
		return "";		
	}




	public FestivalApplyDAO getDao() {
		return dao;
	}
	public void setDao(FestivalApplyDAO dao) {
		this.dao = dao;
	}
	public FestivalApplyVO getVo() {
		return vo;
	}

	public void setVo(FestivalApplyVO vo) {
		this.vo = vo;
	}
}
