<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#loginInfo {
	text-align: center;
}

#head {
	text-align: center;
}

.inputtitle {
	display: inline-block;
	width: 100px;
	background: silver;
	text-align: center;
}
</style>
<%-- context에 대한 정보를 session에 저장해둔다. --%>
<c:set var="root" value="${pageContext.request.contextPath }/"></c:set>
<div id="loginInfo">
	<c:if test="${!empty name }">
		현재 내 이름 : <label id="name">${ name }</label>
	</c:if>
</div>
<hr>