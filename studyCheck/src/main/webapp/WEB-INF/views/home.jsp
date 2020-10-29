<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Answer Checker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#connect').click(
				function() {
					if ($('#name').val() == "") {
						alert("이름 써줘.. ex) 재희");
					} else {
						// // 		     	window.location.href = "answer/userpage?name=" + $("#name").val() + "&startNum=0&endNum=500";
						// 		     	var param = {
						// 		     			name : $("#name").val(),
						// 		     			startNum : 0,
						// 		     			endNum : 500
						// 		     	};
						// 		     	console.log(JSON.stringify(param))
						// 		     	 $.ajax({  
						// 		     		   type: "POST"
						// 		     		  ,contentType: "application/json;charset=utf-8"
						// 		     		  ,url: "${root}/answer/userpage"
						// 		     		  ,data: JSON.stringify(param)
						// 		     		  ,dataType : 'text'
						// 		     		  ,success:function(data){
						// 		     		    console.log(data);
						// 		     		    location.href="answer/userpage";
						// 		     		  }
						// 		     		  ,error:function(xhr, status, msg){
						// 		     			  alert("로그인 실패");
						// 		     			  console.log(xhr + " " + status + " " +msg);
						// 		     		  }
						// 		     		  });
						$("#loginForm").attr("action", "${root}/answer/login")
								.submit();
					}

				});
	});
</script>
<style>
h1, P, input, button, div {
	text-align: center;
}
</style>
</head>
<body class="table-dark">

<%@ include file="/WEB-INF/views/header.jsp" %>

	<c:if test="${ null ne msg }">
		<p>${msg }</p>
	</c:if>
	<c:if test="${ null eq name }">
	<div>
		<h1>Hello world!</h1>
		<br /> <br /> 이름을 입력하세요 !<br />ex) 재희 , 홍균, 지환<br /> <br />
		<form id="loginForm" method="post">
			<input type="text" id="name" name="name"/><br /> <br />
			<button class="btn btn-light" id="connect">접속</button>
		</form>
	</div>
	</c:if>
	<c:if test="${ null ne name }">
		<h1>로그인 완료</h1>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</c:if>
</body>
</html>
