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
var search=getParameterByName("search");
var order="";
if(url.indexOf("order") != -1) order=getParameterByName("order");

//====================================== 검색 기능 =========================================
const search_submit= document.querySelector(".search_submit");

search_submit.onclick=function(){document.searchForm.submit();};

//====================================== 정렬 선택 기능 =========================================

/* 정렬 기능 */
const sfo_rdate= document.querySelector(".sfo_rdate");
const sfo_grade= document.querySelector(".sfo_grade");
const sfo_views= document.querySelector(".sfo_views");

sfo_rdate.onclick=function(){window.location = "/festivals/search?search="+search+"&order=rdate";};
sfo_grade.onclick=function(){window.location = "/festivals/search?search="+search+"&order=grade";};
sfo_views.onclick=function(){window.location = "/festivals/search?search="+search+"&order=views";};

if(order){
	switch (order) {
	case "rdate":
		sfo_rdate.classList.add("sfo_choice");
		break;
	case "grade":
		sfo_grade.classList.add("sfo_choice");
		break;
	case "views":
		sfo_views.classList.add("sfo_choice");
		break;
	}
}
else{
	 sfo_rdate.classList.add("sfo_choice");
}

//====================================== info.jsp (여행정보 패아지)로 이동 =========================================

/* 여행 정보 보기 페이지로 이동*/
function goto_info(info_value){
	window.location = "/festivals/info?fno="+info_value;
}