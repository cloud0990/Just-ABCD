<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autocomplete Test</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script src="/assets/dev/js/data.js"></script> -->
<script src="/assets/common/ajaxCommon.js"></script>
<script>
//현재 가지고 있는 배열로 자동완성 생성
/* $(function() {
	$("#searchInput").autocomplete({  //오토 컴플릿트 시작
		source: List,	// source는 data.js파일 내부의 List 배열
		focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
		},
		minLength: 1,// 최소 글자수
		//delay: 100	//autocomplete 딜레이 시간(ms)
		//disabled: true, //자동완성 기능 끄기
	});
}); */

$(function(){
	callAjax("/hello/srch", {srch_user_nm:$("#srch_user_nm").val()}, fn_srch_user_setting);	
});

function fn_srch_user_setting(data){
	var list = new Array();
	var userList = data.data;
	console.log(data)
	$.each(userList, function(index, item) {
		var row = new Object();
		row.value = item.uNm;
		row.label = item.uId;
		row.desc = item.uIdx;
		list.push(row);
	});
	console.log(list)	
	$("#srch_user_nm").autocomplete({
		source : list,
		focus : function(event, ui) {
			return false;
		}
	}).autocomplete(" instance ")._renderItem = function(ul, item) {
		return $("<li>").append("<div>" + item.label + "<br>" + item.desc + "</div>").appendTo(ul);	
	};
}

</script>
</head>
<body>
<div>
	검색어 :<input id="srch_user_nm" style="margin-left: 20px; width: 400px;">
</div>
</body>
</html>