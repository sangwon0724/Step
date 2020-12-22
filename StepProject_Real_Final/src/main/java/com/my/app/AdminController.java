package com.my.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.control.dao.FestivalApplyDAO;
import com.control.service.FestivalApplyService;



@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@RequestMapping(value = "/apply_festival", method = RequestMethod.GET)
	 public void getapplytest() throws Exception {

	 }
	
	@RequestMapping(value = "/apply_festivalDB", method = RequestMethod.GET)
	 public void getapplytestDB(@RequestParam ("no") String no,
			   @RequestParam ("checkcode") String checkcode, Model model) throws Exception {
		
		FestivalApplyService service=new FestivalApplyService();
		service.apply(no, checkcode);
		

	 }
}
