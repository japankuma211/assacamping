<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>ASSA Camping - 나혼자간다</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Camping - 나혼자간다">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap_custom.css">
<link rel="stylesheet" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/user.css">
<link rel="stylesheet" href="${contextPath}/css/user_responsive.css">
</head>
<body>

<div class="super_container">

	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />
	
	<!-- Home -->	
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/user.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">비밀번호수정</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- user-->
	<section class="section-user">
		<div class="container body-container my-5 py-5">
			<form class="changePwForm" name="changePwForm" action="${contextPath}/userServlet/changePwAction.do" method="post" onsubmit="return check();">
				<input type="hidden" name="userId" value="${userInfo.userId}">
				<h4 class="form-text mb-4">비밀번호를 입력해 주세요.</h4>
				<div class="form-label-group">
					<input type="password" class="form-control" placeholder="기존 비밀번호" name="userPw" id="userPw" required autofocus />
					<label for="userPw">기존 비밀번호</label>
				</div>
				<div class="form-label-group">
					<input type="password" class="form-control" placeholder="새 비밀번호" name="userPw1" id="userPw1" required autofocus />
					<label for="userPw1">새 비밀번호</label>
				</div>
				<div class="form-label-group">
					<input type="password" class="form-control" placeholder="새 비밀번호 재확인" name="userPw2" id="userPw2" required autofocus />
					<label for="userPw2">새 비밀번호 재확인</label>
				</div>
				<button type="submit" class="btn btn-lg btn-primary btn-block my-5">변경하기</button>
			</form>
		</div>
	</section>
	
	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />
</div>

<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/user_custom.js"></script>
<script>
function check(){
	if (document.changePwForm.userPw.value == "") {
        alert("비밀번호를 입력하지 않았습니다.")
        document.changePwForm.userPw.focus();
        return false;
    }
    if (changePwForm.userPw.value == changePwForm.userId.value) {
        alert("아이디와 비밀번호가 같습니다.")
        document.changePwForm.userPw.focus();
        return false;
    }
    if (document.changePwForm.userPw1.value != document.changePwForm.userPw2.value) {
        alert("새 비밀번호가 일치하지 않습니다")
        document.changePwForm.userPw2.value = ""
        document.changePwForm.userPw2.focus();
        return false;
    }
}
</script>
<c:choose>
	<c:when test='${msg=="fail"}'>
		<script>
			window.onload = function(){
				window.alert("기존 비밀번호가 일치하지 않습니다.");
			}
		</script>
	</c:when>
</c:choose>
</body>
</html>