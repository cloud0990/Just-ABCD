<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form데이터 disabled removeAttr Test</title>
<script type="text/javascript">
$(function(){
	/* 
		disabled속성으로 해당 input 태그의 value를 읽지 않아서 값이 있음에도 불구하고 서버로 전송되지 않을 수 있음 
	   
		- 해결법
		1. 단순하게 사용자의 입력을 막고싶다면 readonly 속성 사용
		2. 서버로 전송 직전 disabled를 removeAttr
		
		+) 같은 form 내에 중복되는 name이 있을 경우, 배열로 전송됨(0 base)
		서버에서 받아보면 콤마(,)까지 문자열로 들어오기 때문에 배열에 대한 처리를 해야함
		ex) [2022-09-13, 2022-09-17] 
		
		배열로 들어왔으면 split함수를 사용하거나, 반복문으로 하나씩 값을 분리하거나 etc...
	*/
	
	//disabled 속성 추가
	$("#test").attr("disabled", "disabled");
	
	//전송 직전 삭제
	$("#test").removeAttr("disabled");
	
	//전송
	$("#frm_test").attr("action", "/test/testController");
	$("#frm_test").submit();
});
</script>

</head>
<body>
	<form name="frm_test">
		<input name="test" id="test" value="hello"/>
	</form>
</body>
</html>