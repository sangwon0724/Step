package com.control.service;

import com.control.dao.FestivalDAO;

public class FestivalService {
	
	FestivalDAO dao;

	public String viewsup(String fno) {
		dao=new FestivalDAO();
		dao.viewsup(fno);		
		return "";	
		
	}
}
