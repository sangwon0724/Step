/* 축제 목록의 워프 대비용 java script code */
localStorage.setItem("warp", "NO");

//====================================== 상세 정보 - 리뷰 패널 =========================================

/* 리뷰 페이지용 함수 */
var iframe = document.getElementById('info_review_iframe');

window.addEventListener('DOMContentLoaded', function () {
	iframe.addEventListener('load', autoHeight);
});

function autoHeight() {
	var frame = iframe;
    var sub = frame.contentDocument ? frame.contentDocument : frame.contentWindow.document;
    iframe.height = sub.body.scrollHeight;
}

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
var fno=getParameterByName("fno");

/* 리뷰 패널 iframe */
const info_review_iframe=document.getElementById("info_review_iframe");
info_review_iframe.src="./comment?fno="+fno;

//====================================== 상세 정보 - 리모컨 =====================================================================

/* 리모컨 기능*/
const ic_basic=document.querySelector(".info_ctrl_line:nth-child(1)");
const ic_picture=document.querySelector(".info_ctrl_line:nth-child(2)");
const ic_detail=document.querySelector(".info_ctrl_line:nth-child(3)");
const ic_review=document.querySelector(".info_ctrl_line:nth-child(4)");
const ic_recommend=document.querySelector(".info_ctrl_line:nth-child(5)");
const ic_review_list=document.querySelector(".info_ctrl_line:nth-child(6)");

ic_basic.onclick=function(){var warp_height = document.querySelector(".info_basic_paneel").offsetTop; window.scrollTo(0,warp_height*0.15);};
ic_picture.onclick=function(){var warp_height = document.querySelector(".info_picture_pannel").offsetTop; window.scrollTo(0,warp_height*0.782);};
ic_detail.onclick=function(){var warp_height = document.querySelector(".info_detail_pannel").offsetTop; window.scrollTo(0,warp_height*0.93);};
ic_review.onclick=function(){var warp_height = document.querySelector(".info_review_pannel").offsetTop; window.scrollTo(0,warp_height*0.96);};
ic_recommend.onclick=function(){var warp_height = document.querySelector(".info_recommend_pannel").offsetTop; window.scrollTo(0,warp_height*0.9672);};
ic_review_list.onclick=function(){var warp_height = document.querySelector(".info_review_list_pannel").offsetTop; window.scrollTo(0,warp_height*0.9672);};

//=============================== 상세 정보 - 사진 미리보기 =====================================================================


//=============================== 상세 정보 - 태그  =====================================================================

/* 태그 박스들 */
const idt_activity=document.querySelector('.idt_activity');
const idt_culture=document.querySelector('.idt_culture');
const idt_music=document.querySelector('.idt_music');
const idt_nature=document.querySelector('.idt_nature');

if(idt_activity){idt_activity.onclick=function(){location.href="/festivals/tag_list?category=activity";};}
if(idt_culture){idt_culture.onclick=function(){location.href="/festivals/tag_list?category=culture";};}
if(idt_music){idt_music.onclick=function(){location.href="/festivals/tag_list?category=music";};}
if(idt_nature){idt_nature.onclick=function(){location.href="/festivals/tag_list?category=nature";};}

//====================================== 페이지 이동 함수  =====================================================================

/* 리뷰 쓰기 페이지로 이동*/
function go_review(fno){
	window.location = "/Review/write?fno="+fno;
}

/* 리뷰 목록 페이지로 이동*/
function go_review_list(fno){
	window.location = "/Review/list?fno="+fno;
}

/* 로그인 페이지로 이동 */
function go_login(){
	window.location = "/log/login";
}

/* 여행 정보 보기 페이지로 이동*/
function goto_info(info_value){
	window.location = "/festivals/info?fno="+info_value;
}