<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="text-center" lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>ddoShop</title>
	<link rel="stylesheet" href="../../resource/assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&amp;subset=latin-ext&amp;display=swap">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&amp;display=swap">
	<link rel="stylesheet" href="../../resource/assets/fonts/font-awesome.min.css">
	<link rel="stylesheet" href="../../resource/assets/css/Comment.css">
	<link rel="stylesheet" href="../../resource/assets/css/Features-Image.css">
	<link rel="stylesheet" href="../../resource/assets/css/fontset.css">
	<link rel="stylesheet" href="../../resource/assets/css/Login-Form-Basic.css">
	<link rel="stylesheet" href="../../resource/assets/css/MENU-1.css">
	<link rel="stylesheet" href="../../resource/assets/css/MENU-2.css">
	<link rel="stylesheet" href="../../resource/assets/css/MENU-3.css">
	<link rel="stylesheet" href="../../resource/assets/css/MENU.css">
	<link rel="stylesheet" href="../../resource/assets/css/Navbar-Centered.css">
	<link rel="stylesheet" href="../../resource/assets/css/Projects-Grid.css">
	<link rel="stylesheet" href="../../resource/assets/css/Search-Input-Responsive-with-Icon.css">
	<link rel="stylesheet" href="../../resource/assets/css/styles.css">
	<link rel="stylesheet" href="../../resource/assets/css/tc-menu-10.css">
</head>

<body class="text-center" style="background-color: #deeaf0;">
	<nav class="navbar navbar-light navbar-expand-md text-center m-auto" style="max-width: 80%;">
		<div class="container-fluid"><span class="d-flex" style="margin-right: 10px;font-size: 15.5px;font-weight: bold;">또샵</span>
			<div class="col text-center padMar">
				<div class="input-group text-center">
					<input class="form-control autocomplete" type="text" id="search_w-1" placeholder="무엇을 검색해볼까요 ?" style="font-family: 'test3';font-size: 10px;">
					<button class="btn btn-warning" id="s_b-1" type="button" style="background: rgb(162,207,230);">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
			<c:choose>
				<c:when test="${empty userID}">
					<c:set var="loginBtnUrl" value="location.href='/login'" />
				</c:when>
				<c:otherwise>
					<c:set var="loginBtnUrl" value="location.href='/coupon'" />
				</c:otherwise>
			</c:choose>
			<button class="navbar-toggler text-center d-flex" data-bs-toggle="collapse" style="height: 38px;" onclick="${loginBtnUrl}">
				<span class="visually-hidden">Toggle navigation</span>
				<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person" 
				style="font-family: 'Source Sans Pro', sans-serif;height: 25px;">
					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
				</svg>
			</button>
			
		</div>
	</nav>
	
	<ul class="nav nav-tabs nav-justified text-center m-auto" style="max-width: 80%;font-size: 14px;">
		<li class="nav-item d-flex justify-content-center align-items-center"><span style="font-weight: bold;">음식점</span></li>
		<li class="nav-item d-flex justify-content-center align-items-center"><span class="text-center" style="font-weight: bold;">헬스장</span></li>
		<li class="nav-item d-flex justify-content-center align-items-center"><span class="text-center" style="font-weight: bold;">전통시장</span></li>
	</ul>
	<div class="container m-auto" style="max-width: 80%;min-width: 300px;width: 300px;margin-bottom: 10px;">
		<c:if test="${!empty eventList}">
			<c:forEach var="event" items="${eventList}">
				<div class="row" onclick="onClickEventList(${event.eventNum})" style="width: 300px;max-width: 90%;min-width: 300px;
				margin-bottom: 20px;margin-top: 10px;">
					<div class="col-md-6" style="padding-right: 0px;padding-left: 0px;width: 150px;">
						<img style="height: 180px;width: 150px;" src="${event.eventImageurl}">
					</div>
					<div class="col-md-6" style="height: 180px;width: 150px;">
						<ul>
							<li style="font-size: 20px;font-weight: bold;">응애 치킨</li>
							<li>${event.eventTitle}</li>
							<li>${event.eventGoods}</li>
							<li>${event.eventOngoing}</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/js/MENU.js"></script>
	<script src="../assets/js/Subscribe-window.js"></script>
	<script type="text/javascript">
		function onClickEventList(eventNum){
			location.href = '/comment?event='+eventNum;
		}
	</script>
</body>

</html>