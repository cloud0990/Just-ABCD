<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
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
<!-- select2 CDN -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
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
	
	$("#fruitCombo").select2({
		closeOnSelect: true,
		placeholder: "선택하세요.",
		allowHtml: true,
		allowClear: true,
		tags:true
	});
});
</script>
</head>
<body>
<div style="height:400px; border:1px solid gray;">
AUTOCOMPLETE: <input id="srchInput" style="margin-left: 20px; width: 500px;">
</div>
<br>
<div style="height:500px; border:1px solid gray;">
SELECT2: <select id="fruitCombo" style="margin-left: 20px; width: 500px" class="form-control input-sm">	
			<option value="">선택</option>
	        <option value="fruit">사과</option>
	        <option value="fruit1">수박</option>
	        <option value="fruit2">수박12</option>
	        <option value="fruit3">복숭아</option>
	        <option value="fruit4">딸기</option>
	        <option value="fruit5">참외</option>
	        <option value="fruit6">포도</option>
	        <option value="fruit7">샤인머스캣</option>
	        <option value="fruit8">레몬</option>
	        <option value="fruit9">멜론</option>
	        <option value="fruit10">바나나</option>
	     </select>	
</div>
</body>
</html>