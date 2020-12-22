package com.my.app;

public class transText {
	//지역별 값
	public String setOrderByBigArea(String str) {
		String order="";
		switch (str) {
		case "bt_all":
			order="전체";
			break;
		case "bt_seoul":
			order="서울";
			break;
		case "bt_busan":
			order="부산";
			break;
		case "bt_daegu":
			order="대구";
			break;
		case "bt_incheon":
			order="인천";
			break;
		case "bt_gwangju":
			order="광주";
			break;
		case "bt_daejeon":
			order="대전";
			break;
		case "bt_ulsan":
			order="울산";
			break;
		case "bt_sejong":
			order="세종";
			break;
		case "bt_gyonggi":
			order="경기";
			break;
		case "bt_gangwon":
			order="강원";
			break;
		case "bt_chungcung_north":
			order="충북";
			break;
		case "bt_chungcung_south":
			order="충남";
			break;
		case "bt_kyongsang_north":
			order="경북";
			break;
		case "bt_kyongsang_south":
			order="경남";
			break;
		case "bt_jeonla_north":
			order="전북";
			break;
		case "bt_jeonla_south":
			order="전남";
			break;
		case "bt_jeju":
			order="제주";
			break;
		default:
			order="전체";
		}
		return order;
	}
	
	//도시별 값
	public String setOrderByCityArea(String str) {
		String order="";
		
		switch (str) {
		case "ct_all":
			order="전체";
			break;
		case	 "ct_gapyeong"	:order="가평군"; break;
		case	 "ct_gangnam"	:order="강남구"; break;
		case	 "ct_gangdong"	:order="강동구"; break;
		case	 "ct_gangleung"	:order="강릉시"; break;
		case	 "ct_gangbuk"	:order="강북구"; break;
		case	 "ct_gangseo"	:order="강서구"; break;
		case	 "ct_gangjin"	:order="강진구"; break;
		case	 "ct_ganghwa"	:order="강화군"; break;
		case	 "ct_geoje"		:order="거제시"; break;
		case	 "ct_geochang"	:order="거창군"; break;
		case	 "ct_gyeongsan"	:order="경산시"; break;
		case	 "ct_gyeongju"	:order="경주시"; break;
		case	 "ct_gyeleung"	:order="계룡시"; break;
		case	 "ct_gyeyang"	:order="계양구"; break;
		case	 "ct_goryeong"	:order="고령군"; break;
		case	 "ct_gosung"	:order="고성군"; break;
		case	 "ct_goyang"	:order="고양시"; break;
		case	 "ct_gochang"	:order="고창군"; break;
		case	 "ct_gohung"	:order="고흥군"; break;
		case	 "ct_gokseong"	:order="곡성군"; break;
		case	 "ct_gongju"	:order="공주시"; break;
		case	 "ct_gwancheon"	:order="과천시"; break;
		case	 "ct_gwanak"	:order="관악구"; break;
		case	 "ct_gwangmyeong"	:order="광명시"; break;
		case	 "ct_gangsan"	:order="광산구"; break;
		case	 "ct_gwangyang"	:order="광양시"; break;
		case	 "ct_gwangju"	:order="광주시"; break;
		case	 "ct_gwangjin"	:order="광진구"; break;
		case	 "ct_gwesan"	:order="괴산군"; break;
		case	 "ct_gurye"		:order="구례군"; break;
		case	 "ct_guro"		:order="구로구"; break;
		case	 "ct_guli"		:order="구리시"; break;
		case	 "ct_gumi"		:order="구미시"; break;
		case	 "ct_gunsan"	:order="군산시"; break;
		case	 "ct_gunpo"		:order="군포시"; break;
		case	 "ct_geunwi"	:order="근위군"; break;
		case	 "ct_geumsan"	:order="금산군"; break;
		case	 "ct_geumjung"	:order="금정구"; break;
		case	 "ct_geumchun"	:order="금천구"; break;
		case	 "ct_gijang"	:order="기장군"; break;
		case	 "ct_gimje"		:order="김제시"; break;
		case	 "ct_gimcheon"	:order="김천시"; break;
		case	 "ct_gimpo"		:order="김포시"; break;
		case	 "ct_kimhae"	:order="김해시"; break;
		case	 "ct_naju"		:order="나주시"; break;
		case	 "ct_nam"		:order="남구 "; break;
		case	 "ct_namdong"	:order="남동구"; break;
		case	 "ct_namyangju"	:order="남양주시"; break;
		case	 "ct_namwon"	:order="남원시"; break;
		case	 "ct_namhae"	:order="남해군"; break;
		case	 "ct_nowon"		:order="노원구"; break;
		case	 "ct_nonsan"	:order="논산시"; break;
		case	 "ct_danyang"	:order="단양군"; break;
		case	 "ct_dalseo"	:order="달서구"; break;
		case	 "ct_dalsung"	:order="달성군"; break;
		case	 "ct_damyang"	:order="담양군"; break;
		case	 "ct_dangjin"	:order="당진시"; break;
		case	 "ct_daeduk"	:order="대덕구"; break;
		case	 "ct_dobong"	:order="도봉구"; break;
		case	 "ct_dong"		:order="동구 "; break;
		case	 "ct_dongdaemun"	:order="동대문구"; break;
		case	 "ct_dongduchun"	:order="동두천시"; break;
		case	 "ct_dongrae"	:order="동래구"; break;
		case	 "ct_dongjak"	:order="동작구"; break;
		case	 "ct_donghae"	:order="동해시"; break;
		case	 "ct_mapo"		:order="마포구"; break;
		case	 "ct_mokpo"		:order="목포시"; break;
		case	 "ct_muan"		:order="무안군"; break;
		case	 "ct_muju"		:order="무주군"; break;
		case	 "ct_mungyeong"	:order="문경시"; break;
		case	 "ct_michuhol"	:order="미추홀구"; break;
		case	 "ct_milyang"	:order="밀양시"; break;
		case	 "ct_boryeong"	:order="보령시"; break;
		case	 "ct_bosung"	:order="보성군"; break;
		case	 "ct_boeun"		:order="보은군"; break;
		case	 "ct_bonghwa"	:order="봉화군"; break;
		case	 "ct_busanjin"	:order="부산진구"; break;
		case	 "ct_buan"		:order="부안군"; break;
		case	 "ct_buyeo"		:order="부여군"; break;
		case	 "ct_buchun"	:order="부천시"; break;
		case	 "ct_bupyoung"	:order="부평구"; break;
		case	 "ct_buk"		:order="북구"; break;
		case	 "ct_sasang"	:order="사상구"; break;
		case	 "ct_sacheon"	:order="사천시"; break;
		case	 "ct_saha"		:order="사하구"; break;
		case	 "ct_sanchung"	:order="산청군"; break;
		case	 "ct_samchuk"	:order="삼척시"; break;
		case	 "ct_sangju"	:order="상주시"; break;
		case	 "ct_seo"		:order="서구"; break;
		case	 "ct_seogwipo"	:order="서귀포시"; break;
		case	 "ct_suaenum"	:order="서대문구"; break;
		case	 "ct_seosan"	:order="서산시"; break;
		case	 "ct_seocheon"	:order="서천군"; break;
		case	 "ct_sucho"		:order="서초구"; break;
		case	 "ct_sungnam"	:order="성남시"; break;
		case	 "ct_sungdong"	:order="성동구"; break;
		case	 "ct_sungbuk"	:order="성북구"; break;
		case	 "ct_sungju"	:order="성주군"; break;
		case	 "ct_sejhong"	:order="세종시"; break;
		case	 "ct_sokcho"	:order="속초시"; break;
		case	 "ct_songpa"	:order="송파구"; break;
		case	 "ct_susung"	:order="수성구"; break;
		case	 "ct_suyoung"	:order="수영구"; break;
		case	 "ct_suwon"		:order="수원시"; break;
		case	 "ct_sunchang"	:order="순창군"; break;
		case	 "ct_suncheon"	:order="순천시"; break;
		case	 "ct_siheung"	:order="시흥시"; break;
		case	 "ct_sinan"		:order="신안군"; break;
		case	 "ct_ahsan"		:order="아산시"; break;
		case	 "ct_andong"	:order="안동시"; break;
		case	 "ct_ansan"		:order="안산시"; break;
		case	 "ct_ansung"	:order="안성시"; break;
		case	 "ct_anyang"	:order="안양시"; break;
		case	 "ct_yanggu"	:order="양구군"; break;
		case	 "ct_yangsan"	:order="양산시"; break;
		case	 "ct_yangyang"	:order="양양군"; break;
		case	 "ct_yangju"	:order="양주시"; break;
		case	 "ct_yangchun"	:order="양천구"; break;
		case	 "ct_yangpyeong"	:order="	양평군"; break;
		case	 "ct_yeosu"		:order="여수시"; break;
		case	 "ct_yeoju"		:order="여주시"; break;
		case	 "ct_younsu"	:order="연수구"; break;
		case	 "ct_yeonje"	:order="연제구"; break;
		case	 "ct_yeoncheon"	:order="연천군"; break;
		case	 "ct_younggwang"	:order="영광군"; break;
		case	 "ct_yangduk"	:order="영덕군"; break;
		case	 "ct_youngdo"	:order="영도구"; break;
		case	 "ct_youngdong"	:order="영동군"; break;
		case	 "ct_youngdeungpho"	:order="영등포구"; break;
		case	 "ct_youngyang"	:order="영양군"; break;
		case	 "ct_yeongwol"	:order="영월군"; break;
		case	 "ct_yeongju"	:order="영주시"; break;
		case	 "ct_youngcheon"	:order="영천시"; break;
		case	 "ct_yesan"		:order="예산군"; break;
		case	 "ct_yecheon"	:order="예천군"; break;
		case	 "ct_osan"		:order="오산시"; break;
		case	 "ct_ogcheon"	:order="옥천군"; break;
		case	 "ct_ongjin"	:order="옹진군"; break;
		case	 "ct_wando"		:order="완도군"; break;
		case	 "ct_wanju"		:order="완주군"; break;
		case	 "ct_yongshan"	:order="용산구"; break;
		case	 "ct_yongin"	:order="용인시"; break;
		case	 "ct_ulleung"	:order="울릉군"; break;
		case	 "ct_ulju"		:order="울주군"; break;
		case	 "ct_uljun"		:order="울진군"; break;
		case	 "ct_wonju"		:order="원주시"; break;
		case	 "ct_yusung"	:order="유성구"; break;
		case	 "ct_eunpyoung"	:order="은평구"; break;
		case	 "ct_eumseong"	:order="음성군"; break;
		case	 "ct_uilyeong"	:order="의령군"; break;
		case	 "ct_uiseong"	:order="의성군"; break;
		case	 "ct_uiwang"	:order="의왕시"; break;
		case	 "ct_uijeongbu"	:order="의정부시"; break;
		case	 "ct_yicheon"	:order="이천시"; break;
		case	 "ct_iksan"		:order="익산시"; break;
		case	 "ct_inje"		:order="인제군"; break;
		case	 "ct_imsil"		:order="임실군"; break;
		case	 "ct_jangsung"	:order="장성군"; break;
		case	 "ct_jangsu"	:order="장수군"; break;
		case	 "ct_janghung"	:order="장흥군"; break;
		case	 "ct_jeonju"	:order="전주시"; break;
		case	 "ct_jungsun"	:order="정선군"; break;
		case	 "ct_jeongeub"	:order="정읍시"; break;
		case	 "ct_jeju"		:order="제주시"; break;
		case	 "ct_jecheon"	:order="제천시"; break;
		case	 "ct_jongro"	:order="종로구"; break;
		case	 "ct_jung"		:order="중구"; break;
		case	 "ct_junglang"	:order="중랑구"; break;
		case	 "ct_jeungpyeong"	:order="증평군"; break;
		case	 "ct_jindo"		:order="진도군"; break;
		case	 "ct_jinan"		:order="진안군"; break;
		case	 "ct_jinju"		:order="진주시"; break;
		case	 "ct_jincheon"	:order="진천군"; break;
		case	 "ct_changnyeong"	:order="	창녕군"; break;
		case	 "ct_changwon"	:order="창원시"; break;
		case	 "ct_cheonan"	:order="천안시"; break;
		case	 "ct_cheolwon"	:order="철원군"; break;
		case	 "ct_cheongdo"	:order="청도군"; break;
		case	 "ct_cheongsong"	:order="청송군"; break;
		case	 "ct_cheongyang"	:order="청양군"; break;
		case	 "ct_cheongju"	:order="청주시"; break;
		case	 "ct_chuncheon"	:order="춘천시"; break;
		case	 "ct_chungju"	:order="충주시"; break;
		case	 "ct_chilgok"	:order="칠곡군"; break;
		case	 "ct_taebaek"	:order="태백시"; break;
		case	 "ct_taean"		:order="태안군"; break;
		case	 "ct_tongyoung"	:order="통영시"; break;
		case	 "ct_paju"		:order="파주시"; break;
		case	 "ct_pyeongchang"	:order="평창군"; break;
		case	 "ct_pyeongtaek"	:order="평택시"; break;
		case	 "ct_pochun"	:order="포천시"; break;
		case	 "ct_pohang"	:order="포항시"; break;
		case	 "ct_hanam"		:order="하남시"; break;
		case	 "ct_hadong"	:order="하동군"; break;
		case	 "ct_haman"		:order="함안군"; break;
		case	 "ct_hamyang"	:order="함양군"; break;
		case	 "ct_hampyeong"	:order="함평군"; break;
		case	 "ct_hapcheon"	:order="합천군"; break;
		case	 "ct_haenam"	:order="해남군"; break;
		case	 "ct_haeundae"	:order="해운대구"; break;
		case	 "ct_hongsung"	:order="홍성군"; break;
		case	 "ct_hongchun"	:order="홍천군"; break;
		case	 "ct_hwasung"	:order="화성시"; break;
		case	 "ct_hwasun"	:order="화순군"; break;
		case	 "ct_hwachun"	:order="화천군"; break;
		case	 "ct_hoengseong"	:order="횡성군"; break;
		default: order="전체";
		}
		
		return order;
		
	}
}
