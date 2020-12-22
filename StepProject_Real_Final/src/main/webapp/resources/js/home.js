/* 태그별 페이지 이동 */

const tag_link = document.querySelectorAll(".tag_link");

tag_link[0].onclick=function(){location.href="/festivals/list?category=activity";};
tag_link[1].onclick=function(){location.href="/festivals/list?category=culture";};
tag_link[2].onclick=function(){location.href="/festivals/list?category=music";};
tag_link[3].onclick=function(){location.href="/festivals/list?category=nature";};


/* 랭킹박스  */
//document.querySelector(".slide li:nth-child(1)").onclick=function(){location.href="/Review/list";};//???????
//document.querySelector(".slide li:nth-child(2)").onclick=function(){location.href="/Review/list";};
//document.querySelector(".slide li:nth-child(3)").onclick=function(){location.href="/Review/list";};
//document.querySelector(".slide li:nth-child(4)").onclick=function(){location.href="/Review/list";};

/* 랭킹 부분 */
const recommend = document.querySelectorAll(".recommend");
var recommend_count=recommend.length;
var show=0;
var hide=0;
var intervalID;//인터벌용 아이디
console.log("총 개수 : "+recommend_count);
function recommend_function(){
	show+=1;
	//if(show===10){show=0;}
	if(show===recommend_count){show=0;}
	hide=show-1;
	//if(hide===-1){hide=9}
	if(hide===-1){hide=recommend_count-1}
	console.log("기본 show : "+show);
	console.log("기본 hide : "+hide);
	
	recommend[show].classList.remove("recommend_none");
	recommend[hide].classList.add("recommend_none");
}
recommend[0].classList.remove("recommend_none");//초기화
intervalID=setInterval(recommend_function,5000);//초기화


const recommend_show_left = document.querySelector(".recommend_show_left");
const recommend_show_right = document.querySelector(".recommend_show_right");
const recommend_show_start = document.querySelector(".recommend_show_start");
const recommend_show_stop = document.querySelector(".recommend_show_stop");

/* 왼쪽 화살표 */
recommend_show_left.addEventListener("click", function(){
	show-=1;
	//if(show===-1){show=9;}
	if(show===-1){show=(recommend_count-1);}
	hide=show+1;
	//if(hide===10){hide=0;}
	if(hide===recommend_count){hide=0;}
	console.log("왼쪽 show : "+show);
	console.log("왼쪽 hide : "+hide);

	recommend[show].classList.remove("recommend_none");
	recommend[hide].classList.add("recommend_none");
	clearInterval(intervalID);
	intervalID=setInterval(recommend_function,5000);
});
/* 오른쪽 화살표 */
recommend_show_right.addEventListener("click", function(){ 
	show+=1;
	//if(show===10){show=0;}
	if(show===recommend_count){show=0;}
	hide=show-1;
	//if(hide===-1){hide=9}
	if(hide===-1){hide=recommend_count-1}
	console.log("오른쪽 show : "+show);
	console.log("오른쪽 hide : "+hide);
	
	recommend[show].classList.remove("recommend_none");
	recommend[hide].classList.add("recommend_none");
	clearInterval(intervalID);
	intervalID=setInterval(recommend_function,5000);
});
/* 시작 */
recommend_show_start.addEventListener("click", function(){ 
	if(intervalID==="STOP"){intervalID=setInterval(recommend_function,5000);}
});
/* 정지 */
recommend_show_stop.addEventListener("click", function(){ clearInterval(intervalID); intervalID="STOP";});

/* 계절별 축제 상자용 js*/
const date = new Date();
var month=date.getMonth()+1;

const stb_1=document.querySelector(".season_tap_box:nth-child(1)");
const stb_2=document.querySelector(".season_tap_box:nth-child(2)");
const stb_3=document.querySelector(".season_tap_box:nth-child(3)");
const stb_4=document.querySelector(".season_tap_box:nth-child(4)");
const stb_t_1=document.querySelector(".season_tap_box:nth-child(1)>span");
const stb_t_2=document.querySelector(".season_tap_box:nth-child(2)>span");
const stb_t_3=document.querySelector(".season_tap_box:nth-child(3)>span");
const stb_t_4=document.querySelector(".season_tap_box:nth-child(4)>span");
const sfm_1=document.querySelector(".sfm_1");
const sfm_2=document.querySelector(".sfm_2");
const sfm_3=document.querySelector(".sfm_3");
const sfm_4=document.querySelector(".sfm_4");

stb_1.onclick=function(){
	sfm_1.classList.remove("sfm_none");
	sfm_2.classList.add("sfm_none");
	sfm_3.classList.add("sfm_none");
	sfm_4.classList.add("sfm_none");
	stb_t_1.classList.add("stb_t_1");
	stb_t_2.classList.remove("stb_t_2");
	stb_t_3.classList.remove("stb_t_3");
	stb_t_4.classList.remove("stb_t_4");
};
stb_2.onclick=function(){
	sfm_2.classList.remove("sfm_none");
	sfm_1.classList.add("sfm_none");
	sfm_3.classList.add("sfm_none");
	sfm_4.classList.add("sfm_none");
	stb_t_2.classList.add("stb_t_2");
	stb_t_1.classList.remove("stb_t_1");
	stb_t_3.classList.remove("stb_t_3");
	stb_t_4.classList.remove("stb_t_4");
};
stb_3.onclick=function(){
	sfm_3.classList.remove("sfm_none");
	sfm_1.classList.add("sfm_none");
	sfm_2.classList.add("sfm_none");
	sfm_4.classList.add("sfm_none");
	stb_t_3.classList.add("stb_t_3");
	stb_t_1.classList.remove("stb_t_1");
	stb_t_2.classList.remove("stb_t_2");
	stb_t_4.classList.remove("stb_t_4");
};
stb_4.onclick=function(){
	sfm_4.classList.remove("sfm_none");
	sfm_1.classList.add("sfm_none");
	sfm_2.classList.add("sfm_none");
	sfm_3.classList.add("sfm_none");
	stb_t_4.classList.add("stb_t_4");
	stb_t_1.classList.remove("stb_t_1");
	stb_t_2.classList.remove("stb_t_2");
	stb_t_3.classList.remove("stb_t_3");
};

/* 계절별로 초기화면 설정 */
if(month===3||month===4||month===5){
	sfm_1.classList.add("sfm_top");
	sfm_2.classList.remove("sfm_top");
	sfm_3.classList.remove("sfm_top");
	sfm_4.classList.remove("sfm_top");
	stb_t_1.classList.add("stb_t_1");
	stb_t_2.classList.remove("stb_t_2");
	stb_t_3.classList.remove("stb_t_3");
	stb_t_4.classList.remove("stb_t_4");
}
if(month===6||month===7||month===8){
	sfm_2.classList.remove("sfm_none");
	sfm_1.classList.add("sfm_none");
	sfm_3.classList.add("sfm_none");
	sfm_4.classList.add("sfm_none");
	stb_t_2.classList.add("stb_t_2");
	stb_t_1.classList.remove("stb_t_1");
	stb_t_3.classList.remove("stb_t_3");
	stb_t_4.classList.remove("stb_t_4");
}
if(month===9||month===10||month===11){
	sfm_3.classList.remove("sfm_none");
	sfm_1.classList.add("sfm_none");
	sfm_2.classList.add("sfm_none");
	sfm_4.classList.add("sfm_none");
	stb_t_3.classList.add("stb_t_3");
	stb_t_1.classList.remove("stb_t_1");
	stb_t_2.classList.remove("stb_t_2");
	stb_t_4.classList.remove("stb_t_4");
}
if(month===12||month===1||month===2){
	sfm_4.classList.remove("sfm_none");
	sfm_1.classList.add("sfm_none");
	sfm_2.classList.add("sfm_none");
	sfm_3.classList.add("sfm_none");
	stb_t_4.classList.add("stb_t_4");
	stb_t_1.classList.remove("stb_t_1");
	stb_t_2.classList.remove("stb_t_2");
	stb_t_3.classList.remove("stb_t_3");
}

/* 월별 패널 */
const mfm=document.querySelectorAll(".mfm");
const mfm_1=document.querySelector(".mfm_1");
const mfm_2=document.querySelector(".mfm_2");
const mfm_3=document.querySelector(".mfm_3");
const mfm_4=document.querySelector(".mfm_4");
const mfm_5=document.querySelector(".mfm_5");
const mfm_6=document.querySelector(".mfm_6");
const mfm_7=document.querySelector(".mfm_7");
const mfm_8=document.querySelector(".mfm_8");
const mfm_9=document.querySelector(".mfm_9");
const mfm_10=document.querySelector(".mfm_10");
const mfm_11=document.querySelector(".mfm_11");
const mfm_12=document.querySelector(".mfm_12");


/* 기본 month 값에 대한 축제 패널 표시 */
mfm[month-1].classList.remove("mfm_none");

/* 좌우 이동 화살표 */
const move_left=document.querySelector(".move_left");
const move_right=document.querySelector(".move_right");

/* 월별 택스트 표시 */
const monthly_span=document.querySelector(".monthly_span");

function monthly_span_fuction(month){monthly_span.innerHTML=month+"월";}
monthly_span_fuction(month);//초기화

/* 화살표 이동용 이벤트 리스너 추가 */
move_left.addEventListener("click",move_left_ctrl);
move_right.addEventListener("click",move_right_ctrl);

/* 좌측 이동 */
function move_left_ctrl() {
	if(month>1) month--;
	
	monthly_span_fuction(month);
	mfm[month-1].classList.remove("mfm_none");//mfm[0]이 1월
	mfm[month].classList.add("mfm_none");
}

/* 우측 이동 */
function move_right_ctrl() {
	if(month<12) month++;
	
	monthly_span_fuction(month);
	mfm[month-1].classList.remove("mfm_none");//mfm[0]이 1월
	mfm[month-2].classList.add("mfm_none");
}

/* 여행 정보 보기 페이지로 이동*/
function goto_info(info_value){
	window.location = "/festivals/info?fno="+info_value;
}