<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${name eq null}">
	<c:redirect url="/" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답목록 보여주기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
p {
	float:center;
	align:center;
}
form div {
	padding: 10px;
}

div#container {
	width: 70%;
	margin: 0 auto;
	float: center;
}

#notmatched {
	border-style: thin;
	text-align: center;
	font-color : white;
	width: 100%;
}
</style>

<script type="text/javascript">
	$(function() {

		// 			copyToClipboard();
		// 			console.log($("notmatched").text());
		// 		});

		var newValue;
		// 모든 텍스트의 변경에 반응합니다.
		$(".inputNum")
				.on(
						"propertychange change keyup paste input",
						function() {
							console.log("startNum : " + $("#startNum").val()
									+ " endNum : " + $("#endNum").val());

							if ($("#startNum").val() != ""
									&& $("#endNum").val() != "") {
								var param = new Object();
								param.name = "${name}";
								param.startNum = $("#startNum").val();
								param.endNum = $("#endNum").val();
								console.log(JSON.stringify(param))
								$
										.ajax({
											type : "post",
											contentType : "application/json;charset=utf-8",
											url : "${root}/answer/list",
											data : JSON.stringify(param),
											success : function(data) {
												console.log(data);
												html = "";
												notMatched = "";
												$
														.each(
																data,
																function(i,
																		answer) {
																	html += "<tr><td scope\"row\">"
																			+ answer.answerNum
																			+ "</td>";
																	html += "<td>"
																			+ answer.answers[0]
																			+ "</td>";
																	html += "<td>"
																			+ answer.answers[1]
																			+ "</td>";
																	html += "<td>"
																			+ answer.answers[2]
																			+ "</td>";
																	html += "<td>"
																			+ answer.answers[3]
																			+ "</td>";
																	html += "<td>"
																			+ answer.matched
																			+ "</td></tr>"

																	if (answer.matched === "X") {
																		notMatched += answer.answerNum
																				+ ", ";
																	}
																	//  							  html += "<tr><td scope\"row\">" + i + "</td>";
																	//     	     				  html += "<td>" + 2 + "</td>";
																	//     	     				  html += "<td>" + 3 + "</td>";
																	//     	     				  html += "<td>" + 4 + "</td></tr>";
																})
												$("#tablebody").html(html);
												$("#notmatched")
														.val(notMatched);
											},
											error : function(xhr, status, msg) {
												alert("통신 실패");
												console.log(xhr + " " + status
														+ " " + msg);
											}
										});
							}
						});
	})
</script>
</head>


<body class="table-dark">
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<p style="text-align: center">
		<button>
			<a href="${root}list">답 모음</a>
		</button>
		<button>
			<a href="${root}answer/regist">답 등록</a>
		</button>
		<button>
			<a href="${root}answer/logout">로그아웃</a>
		</button>
	</p>
	<div id="container">
		<h2>답 보기</h2>

		<div>
			<input class="d-inline" id="notmatched" placeholder="불일치 리스트"
				value="" />
		</div>
		<form class="form-inline">
			<div class="form-group">
				<input type="text" class="form-control inputNum" id="startNum"
					placeholder="시작 번호 입력" />
			</div>
			<div class="form-group">
				<input type="text" class="form-control inputNum" id="endNum"
					placeholder="끝 번호 입력" />
			</div>
		</form>
		<table class="table table-dark table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">문제 번호</th>
					<th scope="col">재희</th>
					<th scope="col">홍균</th>
					<th scope="col">지환</th>
					<th scope="col">유창</th>
					<th scope="col">일치</th>

				</tr>
			</thead>

			<tbody id="tablebody" />
		</table>
	</div>

</body>
</html>
