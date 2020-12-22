package com.control.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
public class FestivalApplyVO {
	
	int no;
	String fname;
	String title_image;
	String text;
	String big_area;
	String Small_area;
	Date sdate;	
	Date edate;
	String tag;
	List<String> tags;
	String id;
	String email;
	String phone;
	Date rdate;
	String checkcode;
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

	public FestivalApplyVO() {
		
	}

	public FestivalApplyVO(int no, String fname, String title_image, String text, String big_area, String small_area,
			Date sdate, Date edate, String tag, String id, String email, Date rdate,			String checkcode) {
		super();
		this.no = no;
		this.fname = fname;
		this.title_image = title_image;
		this.text = text;
		this.big_area = big_area;
		Small_area = small_area;
		this.sdate = sdate;
		this.edate = edate;
		this.tag = tag;
		setTags();
		
		this.id = id;
		this.email = email;
		this.rdate = rdate;
		this.checkcode = checkcode;
	}



	public FestivalApplyVO(String fname, String title_image, String text, String big_area, String small_area,
			Date sdate, Date edate, String tag, String id, String email,String location,String url) {
		super();
		this.fname = fname;
		this.title_image = title_image;
		this.text = text;
		this.big_area = big_area;
		Small_area = small_area;
		this.sdate = sdate;
		this.edate = edate;
		this.tag = tag;
		setTags();
		this.id = id;
		this.email = email;
		
		this.location = location;
		this.url= url;
	}



	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
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
		return Small_area;
	}

	public void setSmall_area(String small_area) {
		Small_area = small_area;
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


	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}


	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}


	public void setTags() {
		
		tags=new ArrayList<String>();
		 String data[] = tag.split("#");
		 for (int i = 0; i < data.length; i++) {
			 tags.add(data[i]);			
		}		
		
	}
	

	
	
	

}
