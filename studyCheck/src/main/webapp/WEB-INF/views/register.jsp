<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<style>
h1 {
	text-align: center;
}
label {
	margin : 3px;
}
input {
	margin : 3px;
	width : 100px;
	
}
div#answers{
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#startNum").on("propertychange change keyup paste input",
			function() {
				startNum = Number($("#startNum").val());
				for(var i=1; i<=40; i++){
					console.log(startNum);
					$("#label_"+i).text(startNum + i-1);
				}
			})
			
		$("#regist").on("click", function(){
			startNum = Number($("#startNum").val());
			if(startNum === 0)
				startNum = 1;
			console.log($("#name").text());
			var json = new Object();
			json.name = $("#name").text();
			json.startNum = startNum;
			var arr = new Array();
			
			for(var i=1; i<=40; i++){
				arr.push($("#"+i).val());
			}
			json.answers = arr;
			console.log(json);
			
			$.ajax({
				type : "post",
				contentType : "application/json;charset=utf-8",
				url : "${root}/answer/regist",
				data : JSON.stringify(json),
				success : function(data) {
					if(data.code==="200"){
						alert("등록 성공!");
					}else{
						alert("실패.. 뭔가이상한듯");
					}
				}
			});
		})
	})
</script>
</head>
<body class="table-dark">
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<h1>답 등록</h1>
	<hr />
	<div style="text-align: center">
		<label>문제 시작번호를 입력하세요.</label> <input type="text" id="startNum">
		<button id="regist">제출</button>
	</div>
	<br/>
	<div id="answers">
	<c:forEach var="i" begin="1" end="40" step="1">
		<label id="label_${i}">${i}</label>
		<input type="text" id="${i}" />
		<c:if test="${i%5 eq 0}">
			<br />
		</c:if>
	</c:forEach>
	</div>
	<br><br>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>