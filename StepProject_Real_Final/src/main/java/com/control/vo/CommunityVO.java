package com.control.vo;

import java.sql.Date;

public class CommunityVO {
	
	int no;

	String id;
	String title;
	String com;
	Date signdate;
	int likenum;
	int dislikenum;
	int views;
	int total_record;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCom() {
		return com;
	}
	public void setCom(String com) {
		this.com = com;
	}
	public Date getSigndate() {
		return signdate;
	}
	public void setSigndate(Date signdate) {
		this.signdate = signdate;
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
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getTotal_record() {
		return total_record;
	}
	public void setTotal_record(int total_record) {
		this.total_record = total_record;
	}
}
