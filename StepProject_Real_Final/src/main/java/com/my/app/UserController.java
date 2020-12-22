package com.my.app;

import java.sql.Date;

import javax.swing.text.html.HTMLEditorKit.Parser;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.control.connector.Connector;
import com.control.dao.UserDAO;
import com.control.vo.UserVO;

@Controller
@RequestMapping("/log/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);	
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	 public void getjoin() throws Exception {

	 }
	
	@RequestMapping(value = "/joinDB", method = RequestMethod.POST)
	 public String getjoinDB(
			 @RequestParam String id ,
			 @RequestParam String pw,
			 @RequestParam String name,
			 @RequestParam String phone,
			 Model model			 
			 ) throws Exception {
		
		String messege="";	
		
		UserVO CVO=new UserVO(id,pw,name,phone);
		UserDAO CDAO=new UserDAO();
		String result = CDAO.Join(CVO);
		
		if(result=="join") {				
			messege="Join seccess";
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			model.addAttribute("name", name);
			model.addAttribute("messege",messege);
			return "log/joinDB";
		}
		else if(result=="sameid") {

			messege="Join fail:sameid exists";
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			model.addAttribute("name", name);
			model.addAttribute("messege",messege);
			return "log/join";
		}
		else {
			messege="Join fail"+result;
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			model.addAttribute("name", name);
			model.addAttribute("messege",messege);
			return "log/join";
			
		}
		
		
		
		
	 }
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	 public void getidCheck() throws Exception {

	 }
	
	@RequestMapping(value = "/searchID", method = RequestMethod.GET)
	 public void getsearchID() throws Exception {

	 }
	
	@RequestMapping(value = "/resultID", method = RequestMethod.POST)
	 public void getresultID() throws Exception {

	 }
	
	@RequestMapping(value = "/searchPW", method = RequestMethod.GET)
	 public void getsearchPW() throws Exception {

	 }
	
	@RequestMapping(value = "/resultPW", method = RequestMethod.POST)
	 public void getresultPW() throws Exception {

	 }
	
	
	@RequestMapping(value = "/loginDB", method = RequestMethod.POST)
	 public String getlogin( @RequestParam ("id") String id,
			   @RequestParam ("pw") String pw, Model model) throws Exception {
		
		String messege="";
		
		UserVO CVO=new UserVO(id, pw);
		UserDAO CDAO=new UserDAO();
		String name =CDAO.Login(CVO);
		if(name!=null) {
			messege="login seccess";
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			model.addAttribute("name", name);
			model.addAttribute("messege",messege);
			return "log/loginDB";
		}
		else {
			messege="login fail";
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			model.addAttribute("name", name);
			model.addAttribute("messege",messege);
			return "log/login";
		}			
	 }
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	 public void getloginform() throws Exception {
		
	 }
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	 public String gettest1(Model model) throws Exception {		
		model.addAttribute("test", "test");
		return "log/test";
	 }
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	 public String getlogout() throws Exception {

		
		return "log/logout";
	 }
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	 public void getmypage() throws Exception {
		
	 }
	
	@RequestMapping(value = "/my/changeinfo", method = RequestMethod.GET)
	 public void getmychangeinfo() throws Exception {
		
	 }
	

	@RequestMapping(value = "/my/changeinfoDB", method = RequestMethod.POST)
	 public String getmychangeinfoDB(
			 @RequestParam ("id") String id,
			   @RequestParam ("pw") String pw,
			   @RequestParam ("phone") String phone,
			   @RequestParam ("jobtype") String jobtype,
			   Model model
			   ) throws Exception {
		
		UserVO vo = new UserVO(id,pw);
		UserDAO dao =new UserDAO();
		
		System.out.println("a"+jobtype+"a");
		
		if(jobtype.equals("pw")){
			String result = dao.updatePassword(vo);
			model.addAttribute("result",result);
			System.out.println("a"+jobtype+"a");
			
			return "log/my/changeinfoDB";
			
		}
		else if(jobtype=="phone") {
			String result = dao.updatePhone(vo);
			model.addAttribute("result",result);
			return "log/my/changeinfoDB";
		}
		
		return "log/my/changeinfoDB";
		
		
	 }
	
	@RequestMapping(value = "/my/mylist", method = RequestMethod.GET)
	 public void getmymylist() throws Exception {
		
	 }
	
	@RequestMapping(value = "/my/mycomment", method = RequestMethod.GET)
	 public void getmymycomment() throws Exception {
		
	 }
	
	//------------------//
	
}

