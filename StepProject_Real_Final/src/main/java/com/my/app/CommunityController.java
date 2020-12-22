package com.my.app;

import java.sql.Date;

import javax.swing.text.html.HTMLEditorKit.Parser;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.control.connector.Connector;
import com.control.dao.CommunityDAO;
import com.control.dao.UserDAO;
import com.control.dao.UserDetailsDAO;
import com.control.service.CommunityService;
import com.control.service.FcommentService;
import com.control.service.ReviewService;
import com.control.service.CcommentService;
import com.control.vo.CcommentVO;
import com.control.vo.CommunityVO;
import com.control.vo.FcommentVO;
import com.control.vo.UserDetailVO;
import com.control.vo.UserVO;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getlist(@RequestParam (value="pg", required=false, defaultValue="1") String pg)throws Exception {
			
	 }
	
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	 public void getwrite() throws Exception {

	 }
	@RequestMapping(value = "/writeDB", method = RequestMethod.POST)
	public String getwriteDB(@RequestParam ("title") String title,
			 				@RequestParam ("comment") String comment,
			 				@RequestParam ("id") String id,
			 				Model model) throws Exception {
		
		CommunityVO vo = new CommunityVO();
		vo.setTitle(title);
		vo.setCom(comment);				
		vo.setId(id);
		
		CommunityService service = new CommunityService();
		service.write(vo);
		
		model.addAttribute("title", title);
		model.addAttribute("comment",  comment);		
		model.addAttribute("id",id);
		
		return "community/writeDB";
		
	}
	

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	 public String getview(@RequestParam ("no") String no,Model model) throws Exception {
		CommunityService service = new CommunityService();
		service.viewsup(Integer.parseInt(no));
		
		model.addAttribute("no",no);
		
		return "community/view";

	 }
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	 public String getdelete(@RequestParam ("no") String no,Model model) throws Exception {
		CommunityService service = new CommunityService();
		service.delete(Integer.parseInt(no));
		
		model.addAttribute("no",no);
		
		return "community/delete";
	 }
	

	 @RequestMapping(value = "/comment", method = RequestMethod.GET)
	 public void getComment() throws Exception {
		 
	 }
	 
	 @RequestMapping(value = "/commentDB", method = RequestMethod.GET)
	 public String getCommentDB( 
			 @RequestParam ("comment_text") String text,
			 @RequestParam ("id") String id,
			 @RequestParam ("no") String no,

			 Model model) throws Exception {
		 
		 CcommentService service=new CcommentService();
		 CcommentVO vo = new CcommentVO();
		 vo.setText(text);
		 vo.setId(id);
		 vo.setCno(no);			 
		 service.write(vo);
		 
		 return "/community/commentDB";
	 }
	
}

