package com.control.vo;

import java.sql.Date;

public class UserVO {
	String Id;
	String Password;
	String Name;
	String Phone;	
	
	public UserVO(String id,String password) {
		Id = id;
		Password = password;
		
	}
	
	
	public UserVO(String id, String password, String name, String phone) {
		
		Id = id;
		Password = password;
		Name = name;
		Phone=phone;

	}
	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}


	public String getPhone() {
		return Phone;
	}


	public void setPhone(String phone) {
		Phone = phone;
	}
	
	
	
	
	

}
