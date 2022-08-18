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
<script src="/assets/common/ajaxCommon.js"></script>
<script src="/assets/dev/js/data.js"></script>

<script>
$(function() {
	$("#srchInput").autocomplete({  //자동완성 시작
		source: List,	// source는 data.js파일 내부의 List 배열
		focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
		},
		minLength: 1,// 최소 글자수
		//delay: 100	//autocomplete 딜레이 시간(ms)
		//disabled: true, //자동완성 기능 끄기
	});
});

</script>
</head>
<body>
<div>
	검색어: <input id="srchInput" style="margin-left: 20px; width: 400px;">
</div>
</body>
</html>