package com.control.vo;

public class UserDetailVO {
	
	String Id;
	String Email;
	String Address;
	String question_1;
	String question_2;
	String question_3;
	String answer_1;
	String answer_2;
	String answer_3;
	
	public UserDetailVO(String id) {
		Id = id;
	}
	
	
	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
	}


	
	

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getQuestion_1() {
		return question_1;
	}

	public void setQuestion_1(String question_1) {
		this.question_1 = question_1;
	}

	public String getQuestion_2() {
		return question_2;
	}

	public void setQuestion_2(String question_2) {
		this.question_2 = question_2;
	}

	public String getQuestion_3() {
		return question_3;
	}

	public void setQuestion_3(String question_3) {
		this.question_3 = question_3;
	}

	public String getAnswer_1() {
		return answer_1;
	}

	public void setAnswer_1(String answer_1) {
		this.answer_1 = answer_1;
	}

	public String getAnswer_2() {
		return answer_2;
	}

	public void setAnswer_2(String answer_2) {
		this.answer_2 = answer_2;
	}

	public String getAnswer_3() {
		return answer_3;
	}

	public void setAnswer_3(String answer_3) {
		this.answer_3 = answer_3;
	}
	
	
	
	
	
	
	
	
	
	

}
