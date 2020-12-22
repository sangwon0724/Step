package com.control.vo;

import java.sql.Date;

public class RcommentVO {
	int no;
	String rno;
	String id;
	String name;
	String text;
	Date rdate;
	int likenum;
	int dislikenum;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getDislikenum() {
		return dislikenum;
	}
	public void setDislikenum(int dislikenum) {
		this.dislikenum = dislikenum;
	}
	
	
	
	
	

}
