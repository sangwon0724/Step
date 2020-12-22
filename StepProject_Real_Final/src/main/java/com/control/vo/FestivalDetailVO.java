package com.control.vo;

import java.sql.Date;



public class FestivalDetailVO {

	int fno;
	int grade_total;
	int grade_num;
	int views;
	Date rdate;
	
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getGrade_total() {
		return grade_total;
	}
	public void setGrade_total(int grade_total) {
		this.grade_total = grade_total;
	}
	public int getGrade_num() {
		return grade_num;
	}
	public void setGrade_num(int grade_num) {
		this.grade_num = grade_num;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	
	
	
	
}
