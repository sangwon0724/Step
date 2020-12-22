package com.control.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
public class FestivalVO {
	
	String fno;
	String fname;
	String title_image;
	String text;
	String big_area;
	String small_area;
	Date sdate;	
	Date edate;
	String tag;
	List<String> tags;
	String location;
	String url;
	String loaction_image;
	
	
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getLoaction_image() {
		return loaction_image;
	}

	public void setLoaction_image(String loaction_image) {
		this.loaction_image = loaction_image;
	}



	Double grade;
	Double grade_total;
	int grade_num;
	int views;	
	Date rdate;
	
	public FestivalVO() {
		
	}
	
	public FestivalVO(FestivalApplyVO vo){
		this.fname=vo.fname;
		this.title_image=vo.title_image;
		this.text=vo.text;
		this.big_area=vo.big_area;		
		this.small_area=vo.Small_area;		
		this.sdate=vo.sdate;
		this.edate=vo.edate;
		this.tag=vo.tag;
		setTags();		
	}
	
	public Double getGrade_total() {
		return grade_total;
	}

	public void setGrade_total(Double grade_total) {
		this.grade_total = grade_total;
	}

	public int getGrade_num() {
		return grade_num;
	}

	public void setGrade_num(int grade_num) {
		this.grade_num = grade_num;
	}

	public String getFno() {
		return fno;
	}



	public void setFno(String fno) {
		this.fno = fno;
	}



	public String getFname() {
		return fname;
	}



	public void setFname(String fname) {
		this.fname = fname;
	}



	public String getTitle_image() {
		return title_image;
	}



	public void setTitle_image(String title_image) {
		this.title_image = title_image;
	}



	public String getText() {
		return text;
	}



	public void setText(String text) {
		this.text = text;
	}

	public String getBig_area() {
		return big_area;
	}



	public void setBig_area(String big_area) {
		this.big_area = big_area;
	}



	public String getSmall_area() {
		return small_area;
	}



	public void setSmall_area(String small_area) {
		this.small_area = small_area;
	}



	public Date getSdate() {
		return sdate;
	}



	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}



	public Date getEdate() {
		return edate;
	}



	public void setEdate(Date edate) {
		this.edate = edate;
	}



	public String getTag() {
		return tag;
	}



	public void setTag(String tag) {
		this.tag = tag;
	}



	public List<String> getTags() {
		return tags;
	}



	public void setTags(List<String> tags) {
		this.tags = tags;
	}



	public Double getGrade() {
		return grade;
	}



	public void setGrade() {
		Double i1=new Double(this.grade_total);
		Double i2=new Double(this.grade_num);		
		Double i3;
	
		i1=i1+0.000;
		i2=i2+0.000;
		
		if(i1==0) {
			this.grade = 0.0;
			
		}
		else {
		 i3= (Double)i1/i2+0.00;
		 this.grade=i3;
		};
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



	public void setTags() {
		
		tags=new ArrayList<String>();
		 String date[] = tag.split("#");
		 for (int i = 0; i < date.length; i++) {
			 tags.add(date[i]);			
		}		
		
	}

	
	

}
