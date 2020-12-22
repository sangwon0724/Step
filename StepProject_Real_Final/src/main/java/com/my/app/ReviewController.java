package com.my.app;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import java.sql.Date;
import java.util.UUID;

import javax.swing.text.html.HTMLEditorKit.Parser;
import org.aspectj.lang.annotation.Pointcut;
import org.json.simple.JSONObject;
import org.apache.commons.io.FileUtils;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.control.connector.Connector;
import com.control.dao.UserDAO;
import com.control.service.FcommentService;
import com.control.service.RcommentService;
import com.control.service.ReviewService;
import com.control.vo.FcommentVO;
import com.control.vo.RcommentVO;
import com.control.vo.ReviewVO;
import com.control.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.persistence.Entity;

@Controller
@RequestMapping("/Review/*")
public class ReviewController {
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	 public String getwrite() throws Exception {
		return "Review/write";

	 }
	
	
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	 public String getview(@RequestParam ("no") String no,Model model) throws Exception {
		ReviewService service = new ReviewService();
		service.viewsup(Integer.parseInt(no));
		model.addAttribute("no",no);
		return "Review/view";

	 }
	
	

	
	@RequestMapping(value = "/writeDB", method = RequestMethod.POST)
	 public String getwriteDB(			 
			 @RequestParam ("title") String title,
			 @RequestParam ("editordata") String editordata ,
			 @RequestParam ("fno") String fno ,
			 @RequestParam ("id") String id			   
			  , Model model) throws Exception {
		
		ReviewVO vo=new ReviewVO();
		vo.setTitle(title);
		vo.setText(editordata);
		vo.setGrade(0);
		vo.setFno(fno);
		vo.setId(id);
		
		ReviewService service=new ReviewService();
		service.write(vo);
		
		model.addAttribute("title", title);
		model.addAttribute("editordata",  editordata);		
		model.addAttribute("id",id);		
		return "Review/writeDB";

	 }
	

	
	
	@RequestMapping(value="image", produces = "application/json" , method= {RequestMethod.POST})
	@ResponseBody
	 public JSONObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile file) {
		JSONObject jsonObject = new JSONObject();
		Gson gson= new Gson();

		String fileRoot = "C:\\Users\\YUHAN\\Desktop\\StepProject (11)\\src\\main\\webapp\\resources\\images\\review\\";	//二쇱꽍 源⑥쭊嫄�1
		String root="/resources/images/review/";
		String originalFileName = file.getOriginalFilename();	//二쇱꽍 源⑥쭊嫄�2
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//二쇱꽍 源⑥쭊嫄�3
				
		String savedFileName = UUID.randomUUID() + extension;	//二쇱꽍 源⑥쭊嫄�4
		
		File targetFile = new File(fileRoot + savedFileName);	
	
		System.out.println(originalFileName);
		
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//二쇱꽍 源⑥쭊嫄�5
			jsonObject.put("url", root+savedFileName);
			jsonObject.put("responseCode", "success");
			System.out.println(""+jsonObject.get("url"));
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//二쇱꽍 源⑥쭊嫄�5
			jsonObject.put("url", "error");
			jsonObject.put("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
    }	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getlist(@RequestParam (value="pg" , required=false,  defaultValue="1") String pg) throws Exception {

	 }
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	 public String getdelete(@RequestParam ("no") String no,Model model) throws Exception {
		ReviewService service = new ReviewService();
		service.delete(Integer.parseInt(no));
		
		model.addAttribute("no",no);
		
		return "Review/delete";
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
		 
		 RcommentService service=new RcommentService();
		 RcommentVO vo = new RcommentVO();
		 vo.setText(text);
		 vo.setId(id);
		 vo.setRno(no);		 
		 		 
		 service.write(vo);
		 
		 return "/Review/commentDB";
	 }
	
}
