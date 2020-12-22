package com.my.app;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.swing.text.html.HTMLEditorKit.Parser;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.control.connector.Connector;
import com.control.dao.UserDAO;
import com.control.service.FcommentService;
import com.control.service.FestivalApplyService;
import com.control.service.FestivalService;
import com.control.service.ReviewService;
import com.control.vo.FcommentVO;
import com.control.vo.FestivalApplyVO;
import com.control.vo.UserVO;
import com.google.gson.Gson;

@Controller
@RequestMapping("/festivals/*")
public class FestivalsController {
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	 public String getregist() throws Exception {
		
		
		return "/festivals/regist";
	 }
	
	@RequestMapping(value="image", produces = "application/json" , method= {RequestMethod.POST})
	@ResponseBody
	 public JSONObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile file) {
		JSONObject jsonObject = new JSONObject();
		Gson gson= new Gson();

		String fileRoot = "C:\\Users\\YUHAN\\Desktop\\StepProject (11)\\src\\main\\webapp\\resources\\images\\festival\\";	//二쇱꽍 源⑥쭊嫄�1
		String root="/resources/images/festival/";
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
	
	@RequestMapping(value = "/registDB", method = RequestMethod.POST)
	 public String getregistDB(
			 @RequestParam ("fname") String fname,
			 @RequestParam ("title_image") String title_image,
			 @RequestParam ("editordata") String editordata ,
			 @RequestParam ("big_area") String big_area,
			 @RequestParam ("small_area") String small_area,
			 //@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date sdate
			 @RequestParam ("sdate") String sdate,
			 @RequestParam ("edate") String edate,
			 @RequestParam ("id") String id,
			 @RequestParam ("email") String email,
			 @RequestParam ("location") String location,
			 @RequestParam ("url") String url,
			 @RequestParam (value="category1", required=false, defaultValue="") String category1 ,
			 @RequestParam (value="category2", required=false, defaultValue="") String category2 ,
			 @RequestParam (value="category3", required=false, defaultValue="") String category3 ,
			 @RequestParam (value="category4", required=false, defaultValue="") String category4 ,			 	 			 
			 Model model) throws Exception {
		//데이트가공필요
		String tag;
		tag=category1+category2+category3+category4;
		System.out.println(tag);
		

		java.sql.Date s=java.sql.Date.valueOf(sdate);
		java.sql.Date e=java.sql.Date.valueOf(edate);



		
		
		FestivalApplyVO vo=new FestivalApplyVO(
				fname, title_image, editordata, big_area, small_area,s ,e , tag, id, email,location,url);
	FestivalApplyService service=new FestivalApplyService();
	service.setVo(vo);
	if(service.regist().equals("success")) {
		
		return "/festivals/registDB";
		}
		else {		
			return "/festivals/regist";
		}				
	 }

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	 public void getwrite() throws Exception {

	 }
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	 public void getview(@RequestParam ("fno") String fno) throws Exception {
		
	 }
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getTagList() throws Exception {

	 }
	
	

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	 public String getInfo(@RequestParam ("fno") String fno,Model model) throws Exception {
		FestivalService service =new FestivalService();
		service.viewsup(fno);
		model.addAttribute("fno",fno);
		return "/festivals/info";

	 }
	 
	 @RequestMapping(value = "/search", method = RequestMethod.GET)
	 public void getSearch() throws Exception {

	 }
	 
	 @RequestMapping(value = "/festival", method = RequestMethod.GET)
	 public void getfestival() throws Exception {

	 }
	 
	 @RequestMapping(value = "/comment", method = RequestMethod.GET)
	 public void getComment() throws Exception {
		 
	 }
	 
	 @RequestMapping(value = "/commentDB", method = RequestMethod.GET)
	 public String getCommentDB( 
			 @RequestParam ("comment_text") String text,
			 @RequestParam ("id") String id,
			 @RequestParam ("fno") String fno,
			 @RequestParam ("comment_grade") String grade,			 
			 Model model) throws Exception {
		 
		 FcommentService service=new FcommentService();
		 FcommentVO vo = new FcommentVO();
		 vo.setText(text);
		 vo.setId(id);
		 vo.setFno(fno);		 
		 vo.setGrade(Double.parseDouble(grade));		 
		 service.write(vo);
		 
		 return "/festivals/commentDB";
	 }
}

