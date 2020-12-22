/* url 값 설정 */
var url=window.location.href;

/* url에서 value 값 가져오기*/
function getParameterByName(name) {
	name=name.replace(/[\[\]]/g,"\\$&");
	var regex=new RegExp("[?&]"+name+"(=([^&#]*)|&|#|$)");
	var result=regex.exec(url);
	return result[2];
}

/* url에서 변수 값을 가져옴 */
var category=getParameterByName("category");
var order="";
if(url.indexOf("order") != -1) order=getParameterByName("order");

//====================================== 태그 클릭시 기능 =========================================

/* 태그별 기능 */
const tt_all= document.querySelector(".tt_all");
const tt_activity= document.querySelector(".tt_activity");
const tt_culture= document.querySelector(".tt_culture");
const tt_music= document.querySelector(".tt_music");
const tt_nature= document.querySelector(".tt_nature");

switch (category) {
	case "all":
		tt_all.style.color="#5352ed";
		tt_all.classList.add("tag_tap_All_hilight");
		break;
	case "activity":
		tt_activity.style.color="#6c5ce7";
		break;
	case "culture":
		tt_culture.style.color="#6c5ce7";
		break;
	case "music":
		tt_music.style.color="#6c5ce7";
		break;
	case "nature":
		tt_nature.style.color="#6c5ce7";
		break;
}

tt_all.onclick=function(){window.location = "/festivals/list?category=all";setCookie("big_area","bt_all");setCookie("city_area","ct_all");};
tt_activity.onclick=function(){window.location = "/festivals/list?category=activity";setCookie("big_area","bt_all");setCookie("city_area","ct_all");};
tt_culture.onclick=function(){window.location = "/festivals/list?category=culture";setCookie("big_area","bt_all");setCookie("city_area","ct_all");};
tt_music.onclick=function(){window.location = "/festivals/list?category=music";setCookie("big_area","bt_all");setCookie("city_area","ct_all");};
tt_nature.onclick=function(){window.location = "/festivals/list?category=nature";setCookie("big_area","bt_all");setCookie("city_area","ct_all");};

//====================================== 정렬 선택 기능 =========================================

/* 정렬 기능 */
const tfo_rdate= document.querySelector(".tfo_rdate");
const tfo_grade= document.querySelector(".tfo_grade");
const tfo_views= document.querySelector(".tfo_views");

tfo_rdate.onclick=function(){window.location = "/festivals/list?category="+category+"&order=rdate";};
tfo_grade.onclick=function(){window.location = "/festivals/list?category="+category+"&order=grade";};
tfo_views.onclick=function(){window.location = "/festivals/list?category="+category+"&order=views";};

if(order){
	switch (order) {
	case "rdate":
		tfo_rdate.classList.add("tfo_choice");
		break;
	case "grade":
		tfo_grade.classList.add("tfo_choice");
		break;
	case "views":
		tfo_views.classList.add("tfo_choice");
		break;
	}
}
else{
	 tfo_rdate.classList.add("tfo_choice");
}

//====================================== info.jsp (여행정보 패아지)로 이동 =========================================

/* 여행 정보 보기 페이지로 이동*/
function goto_info(info_value){
	setCookie("big_area", "bt_all");
	setCookie("city_area", "ct_all");
	window.location = "/festivals/info?fno="+info_value;
}

//====================================== 선택 패널을 보는 사이드 메뉴에 대한 기능 =========================================

const tag_select_open=document.querySelector(".tag_select_open"); //보이기 버튼
const tag_select=document.querySelector(".tag_select"); //메뉴 부분
const tag_select_close=document.querySelector(".tag_select_close"); //닫기 버튼
const tag_section=document.querySelector(".tag_section");

//localStorage.setItem("toggleTagSelect", "OPEN");

var toggleTagSelect;

tag_select_open.onclick=function(){
	tag_select.style.marginRight="0px";
	toggleTagSelect="OPEN";
	localStorage.setItem("toggleTagSelect", "OPEN");
};

tag_select_close.onclick=function(){
	tag_select.style.marginRight="-"+(tag_select.offsetWidth+300)+"px";
	toggleTagSelect="CLOSE";
	localStorage.setItem("toggleTagSelect", "CLOSE");
};

function winResize(){
	if(toggleTagSelect==="OPEN"){tag_select.style.marginRight="0px";}
	else if (toggleTagSelect==="CLOSE"){tag_select.style.marginRight="-"+(tag_select.offsetWidth+300)+"px";}
};


window.addEventListener("resize",winResize);

window.addEventListener("load",winLoad);

function winLoad(){
	if(tag_section.offsetWidth>1223){
		if(localStorage.getItem("toggleTagSelect")==="OPEN")
		{
			tag_select.style.marginRight="0px";
			toggleTagSelect="OPEN";
		}
		else if (localStorage.getItem("toggleTagSelect")==="CLOSE")
		{
			tag_select.style.marginRight="-"+(tag_select.offsetWidth+300)+"px";
			toggleTagSelect="CLOSE";
		}
	}
	else{
		tag_select.style.marginRight="-"+(tag_select.offsetWidth+300)+"px";
		toggleTagSelect="CLOSE";
	}
};


//====================================== 지역 및 도시 선택에 대한 기능 =========================================

/* 지역 패널 */
const big_area_pannel=document.querySelector(".big_area_pannel");

/* 도시별 태그 패널 */
const city_area_pannel=document.querySelector(".city_area_pannel");

var cap_text=[];
cap_text[0]="";
cap_text[1]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_gangnam'>강남구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_ghangdong'>강동구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_gangbuk'>강북구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_gangseo'>강서구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_gwanak'>관악구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_gwangjin'>광진구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_guro'>구로구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_geumchun'>금천구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_nowon'>노원구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_dobong'>도봉구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_dongdaemun'>동대문구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_dongjak'>동작구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_mapo'>마포구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_suaenum'>서대문구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_sucho'>서초구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_sungdong'>성동구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_sungbuk'>성북구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_songpa'>송파구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_yangchun'>양천구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_youngdeungpho'>영등포구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_yongshan'>용산구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_eunpyoung'>은평구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_jongro'>종로구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_jung'>중구</div>"
	   	   +"<div class='cap_tag cap_tag_name' name='ct_junglang'>중랑구</div>"
	   	   +"<div class='cap_tag'></div>";//서울

cap_text[2]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_gangseo'>강서구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_geumjung'>금정구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_gijang'>기장군</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_nam'>남구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_dong'>동구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_dongrae'>동래구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_busanjin'>부산진구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_buk'>북구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_sasang'>사상구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_saha'>사하구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_seo'>서구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_suyoung'>수영구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_yeonje'>연제구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_youngdo'>영도구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_jung'>중구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_haeundae'>해운대구</div>"
	       +"<div class='cap_tag'></div>";//부산

cap_text[3]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_nam'>남구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_dalseo'>달서구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_dalsung'>달성군</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_dong'>동구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_buk'>북구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_seo'>서구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_susung'>수성구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_jung'>중구</div>";//대구

cap_text[4]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_ganghwa'>강화군</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_namdong'>남동구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_dong'>동구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_gyeyang'>계양구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_michuhol'>미추홀구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_bupyoung'>부평구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_seo'>서구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_younsu'>연수구</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_ongjin'>옹진군</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_jung'>중구</div>"
		   +"<div class='cap_tag'></div>";//인천

cap_text[5]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_gangsan'>광산구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_nam'>남구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_dong'>동구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_buk'>북구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_seo'>서구</div>";//광주

cap_text[6]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
    	   +"<div class='cap_tag cap_tag_name' name='ct_daeduk'>대덕구</div>"
     	   +"<div class='cap_tag cap_tag_name' name='ct_dong'>동구</div>"
     	   +"<div class='cap_tag cap_tag_name' name='ct_seo'>서구</div>"
     	   +"<div class='cap_tag cap_tag_name' name='ct_yusung'>유성구</div>"
     	   +"<div class='cap_tag cap_tag_name' name='ct_jung'>중구</div>";//대전

cap_text[7]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_nam'>남구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_dong'>동구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_buk'>북구</div>"
	       +"<div class='cap_tag cap_tag_name' name='ct_ulju'>울주군</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_jung'>중구</div>";//울산

cap_text[8]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
    	   +"<div class='cap_tag cap_tag_name' name='ct_sejhong'>세종시</div>"
    	   +"<div class='cap_tag'></div>";//세종

cap_text[9]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_gapyeong'>가평군</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_goyang'>고양시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_gwancheon'>과천시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_gwangmyeong'>광명시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_gwangju'>광주시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_guli'>구리시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_gunpo'>군포시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_gimpo'>김포시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_namyangju'>남양주시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_dongduchun'>동두천시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_buchun'>부천시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_sungnam'>성남시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_suwon'>수원시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_siheung'>시흥시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_ansan'>안산시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_ansung'>안성시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_anyang'>안양시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_yangju'>양주시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_yangpyeong'>양평군</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_yeoju'>여주시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_yeoncheon'>연천군</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_osan'>오산시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_yongin'>용인시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_uiwang'>의왕시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_uijeongbu'>의정부시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_yicheon'>이천시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_paju'>파주시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_pyeongtaek'>평택시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_pochun'>포천시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_hanam'>하남시</div>"
		   +"<div class='cap_tag cap_tag_name' name='ct_hwasung'>화성시</div>"
		   +"<div class='cap_tag'></div>";//걍기

cap_text[10]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_gangleung'>강릉시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_gosung'>고성군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_donghae'>동해시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_samchuk'>삼척시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_sokcho'>속초시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_yanggu'>양구군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_yangyang'>양양군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_yeongwol'>영월군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_wonju'>원주시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_inje'>인제군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_jungsun'>정선군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_cheolwon'>철원군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_chuncheon'>춘천시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_taebaek'>태백시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_pyeongchang'>평창군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_hongchun'>홍천군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_hwachun'>화천군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_hoengseong'>횡성군</div>"
			+"<div class='cap_tag'></div>"
			+"<div class='cap_tag'></div>";//강원

cap_text[11]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_gwesan'>괴산군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_danyang'>단양군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_boeun'>보은군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_youngdong'>영동군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_ogcheon'>옥천군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_eumseong'>음성군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_jecheon'>제천시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_jeungpyeong'>증평군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_jincheon'>진천군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_cheongju'>청주시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_chungju'>충주시</div>";//충북

cap_text[12]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_gyeleung'>계룡시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_gongju'>공주시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_geumsan'>금산군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_nonsan'>논산시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_dangjin'>당진시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_boryeong'>보령시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_buyeo'>부여군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_seosan'>서산시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_seocheon'>서천군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_ahsan'>아산시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_yesan'>예산군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_cheonan'>천안시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_cheongyang'>청양군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_taean'>태안군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_hongsung'>홍성군</div>"
			+"<div class='cap_tag'></div>"
			+"<div class='cap_tag'></div>";//충남

cap_text[13]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_gyeongsan'>경산시</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_gyeongju'>경주시</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_goryeong'>고령군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_gumi'>구미시</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_geunwi'>근위군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_gimcheon'>김천시</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_mungyeong'>문경시</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_bonghwa'>봉화군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_sangju'>상주시</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_sungju'>성주군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_andong'>안동시</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_yangduk'>영덕군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_youngyang'>영양군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_yeongju'>영주시</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_youngcheon'>영천시</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_yecheon'>예천군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_ulleung'>울릉군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_uljun'>울진군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_uiseong'>의성군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_cheongdo'>청도군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_cheongsong'>청송군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_chilgok'>칠곡군</div>"
	   		+"<div class='cap_tag cap_tag_name' name='ct_pohang'>포항시</div>";//경북

cap_text[14]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_geoje'>거제시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_geochang'>거창군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_gosung'>고성군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_kimhae'>김해시</div>"
   			+"<div class='cap_tag cap_tag_name' name='ct_namhae'>남해군</div>"
   			+"<div class='cap_tag cap_tag_name' name='ct_milyang'>밀양시</div>"
   			+"<div class='cap_tag cap_tag_name' name='ct_sacheon'>사천시</div>"
   			+"<div class='cap_tag cap_tag_name' name='ct_sanchung'>산청군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_yangsan'>양산시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_uilyeong'>의령군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_jinju'>진주시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_changnyeong'>창녕군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_changwon'>창원시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_tongyoung'>통영시</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_hadong'>하동군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_haman'>함안군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_hamyang'>함양군</div>"
			+"<div class='cap_tag cap_tag_name' name='ct_hapcheon'>합천군</div>"
   			+"<div class='cap_tag'></div>"
   			+"<div class='cap_tag'></div>";//경남

cap_text[15]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_gochang'>고창군</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_gunsan'>군산시</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_gimje'>김제시</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_namwon'>남원시</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_muju'>무주군</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_buan'>부안군</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_sunchang'>순창군</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_wanju'>완주군</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_iksan'>익산시</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_imsil'>임실군</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_jangsu'>장수군</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_jeonju'>전주시</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_jeongeub'>정읍시</div>"
		    +"<div class='cap_tag cap_tag_name' name='ct_jinan'>진안군</div>";//전북

cap_text[16]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_gangjin'>강진구</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_gohung'>고흥군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_gokseong'>곡성군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_gwangyang'>광양시</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_gurye'>구례군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_naju'>나주시</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_damyang'>담양군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_mokpo'>목포시</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_muan'>무안군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_bosung'>보성군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_suncheon'>순천시</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_sinan'>신안군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_yeosu'>여수시</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_younggwang'>영광군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_youngyang'>영양군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_wando'>완도군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_jangsung'>장성군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_janghung'>장흥군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_jindo'>진도군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_hampyeong'>함평군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_haenam'>해남군</div>"
		 	+"<div class='cap_tag cap_tag_name' name='ct_hwasun'>화순군</div>"
		 	+"<div class='cap_tag'></div>";//전남

cap_text[17]="<div class='cap_tag cap_tag_all' name='ct_all'>전체</div>"
 			+"<div class='cap_tag cap_tag_name' name='ct_seogwipo'>서귀포시</div>"
 			+"<div class='cap_tag cap_tag_name' name='ct_jeju'>제주시</div>"//제주



/* 지역 태그 - 전체*/
var big_area_all= document.querySelector(".bap_tag:nth-child(1)");//전체
 		big_area_all.onclick=function(){
 		city_area_pannel.innerHTML="";
 		for(var j=0;j<bap_tag_name.length;j++){ bap_tag_name[j].classList.remove("bap_tag_color"); }
 		big_area_pannel.classList.remove("bap_border_bottom");
 		big_area_all.classList.add("bap_tag_color");
 		setBigAreaCookie(event.target.getAttribute('name'));
		setCookie("city_area", "ct_all");
 		location.reload();
};

/* 전체 버튼을 제외한 지역 버튼들에 대한 기본 이벤트 리스너 추가 */
var bap_tag_name = document.querySelectorAll('.bap_tag_name');

for ( var i = 0; i < bap_tag_name.length; i++ ) {
		bap_tag_name[i].addEventListener("click",function(event){
			for(var j=0;j<bap_tag_name.length;j++){ bap_tag_name[j].classList.remove("bap_tag_color"); }
			big_area_all.classList.remove("bap_tag_color");
			event.target.classList.add("bap_tag_color");
			setBigAreaCookie(event.target.getAttribute('name'));
			setCookie("city_area", "ct_all");
			location.reload();
		});
}

/* 로컬 스토리지 값에 따른 도시 패널 값 설정 */
function settingByName(name){
	switch (name) {
	case "bt_all":
		city_area_pannel.innerHTML=cap_text[0];
		break;
	case "bt_seoul":
		city_area_pannel.innerHTML=cap_text[1];
		break;
	case "bt_busan":
		city_area_pannel.innerHTML=cap_text[2];
		break;
	case "bt_daegu":
		city_area_pannel.innerHTML=cap_text[3];
		break;
	case "bt_incheon":
		city_area_pannel.innerHTML=cap_text[4];
		break;
	case "bt_gwangju":
		city_area_pannel.innerHTML=cap_text[5];
		break;
	case "bt_daejeon":
		city_area_pannel.innerHTML=cap_text[6];
		break;
	case "bt_ulsan":
		city_area_pannel.innerHTML=cap_text[7];
		break;
	case "bt_sejong":
		city_area_pannel.innerHTML=cap_text[8];
		break;
	case "bt_gyonggi":
		city_area_pannel.innerHTML=cap_text[9];
		break;
	case "bt_gangwon":
		city_area_pannel.innerHTML=cap_text[10];
		break;
	case "bt_chungcung_north":
		city_area_pannel.innerHTML=cap_text[11];
		break;
	case "bt_chungcung_south":
		city_area_pannel.innerHTML=cap_text[12];
		break;
	case "bt_kyongsang_north":
		city_area_pannel.innerHTML=cap_text[13];
		break;
	case "bt_kyongsang_south":
		city_area_pannel.innerHTML=cap_text[14];
		break;
	case "bt_jeonla_north":
		city_area_pannel.innerHTML=cap_text[15];
		break;
	case "bt_jeonla_south":
		city_area_pannel.innerHTML=cap_text[16];
		break;
	case "bt_jeju":
		city_area_pannel.innerHTML=cap_text[17];
		break;
	}
}

/* 로컬 스토리지 설정 - 지역 */
if(!getCookie("big_area")){setCookie("big_area", "bt_all");setCookie("city_area", "ct_all");}
function setBigAreaCookie(name){
	setCookie("big_area", name);
}

/* 로컬 스토리지 값에 따른 버튼 설정 - 지역 */
function setButtonByCookie(whatever){
	var temp=document.getElementsByName(whatever);
	temp[0].classList.add("bap_tag_color");
}

/* 로컬 스토리지 값에 따른 페이지 설정 - 지역 */
function setPageLoadByCookie(LocalValue){
	if(LocalValue!=="bt_all") {big_area_pannel.classList.add("bap_border_bottom");}
	settingByName(LocalValue);
}

/* 기본 설정 - 지역 */
setPageLoadByCookie(getCookie("big_area"));
setButtonByCookie(getCookie("big_area"));

/* 도시 태그 - 전체*/
var city_area_all= document.querySelector(".cap_tag:nth-child(1)");//전체
city_area_all.onclick=function(){
	for(var j=0;j<cap_tag_name.length;j++){ cap_tag_name[j].classList.remove("cap_tag_color"); }
	city_area_all.classList.add("cap_tag_color");
	setCityAreaCookie(event.target.getAttribute('name'));
	location.reload();
};

/* 전체 버튼을 제외한 도시 버튼들에 대한 기본 이벤트 리스너 추가 */
var cap_tag_name = document.querySelectorAll('.cap_tag_name');

for ( var i = 0; i < cap_tag_name.length; i++ ) {
		cap_tag_name[i].addEventListener("click",function(event){
			for(var j=0;j<cap_tag_name.length;j++){ cap_tag_name[j].classList.remove("cap_tag_color"); }
			city_area_all.classList.remove("cap_tag_color");
			event.target.classList.add("cap_tag_color");
			setCityAreaCookie(event.target.getAttribute('name'));
			location.reload();
		});
}

/* 쿠키 값  설정 - 도시 */
if(!getCookie("city_area")){setCookie("city_area", "ct_all");}
function setCityAreaCookie(name){
	setCookie("city_area", name);
}

/* 쿠키 값에 따른 버튼 설정 - 도시 */
function setCityButtonByCookie(whatever){
	var temp=document.getElementsByName(whatever);
	temp[0].classList.add("cap_tag_color");
}

//기본 설정 - 도시
if(getCookie("big_area")!=="bt_all"){setCityButtonByCookie(getCookie("city_area"));}

//쿠키 생성 - 브라우저 닫으면 삭제
function setCookie(name, value) {
	document.cookie = name + '=' + value;
};

//쿠키 값 가져오기
function getCookie(name) {
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
};

//다른 페이지로 이동 가능한 링크 클릭시 쿠키 초기화
var other=document.getElementsByTagName("a");
other[0].onclick=function(){setCookie("big_area", "bt_all");setCookie("city_area", "ct_all");};
other[1].onclick=function(){setCookie("big_area", "bt_all");setCookie("city_area", "ct_all");};