<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

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
	<link rel="stylesheet" href="../../resource/assets/css/Navbar-Centered-1.css">
	<link rel="stylesheet" href="../../resource/assets/css/Navbar-Centered.css">
	<link rel="stylesheet" href="../../resource/assets/css/Projects-Grid.css">
	<link rel="stylesheet" href="../../resource/assets/css/Search-Input-Responsive-with-Icon.css">
	<link rel="stylesheet" href="../../resource/assets/css/styles.css">
	<link rel="stylesheet" href="../../resource/assets/css/tc-menu-10.css">
</head>

<body>
	<nav class="navbar navbar-light navbar-expand-md text-center m-auto" style="max-width: 80%;">
		<div class="container-fluid">
			<span class="d-flex" style="margin-right: 10px;font-size: 15.5px;font-weight: bold;" onclick="location.href='/mainRestaurant'">
				또샵
			</span>
			<div class="col text-center padMar">
				<form action="/mainSearch">
					<div class="input-group text-center">
						<input class="form-control autocomplete" type="text" name="searchKeyword" placeholder="무엇을 검색해볼까요 ?" 
						style="font-family: 'test3';font-size: 10px;">
						<!-- button style 바뀌었으면 type="button"  -->
						<button class="btn btn-warning" id="s_b-1" type="submit" 
						 style="background: rgb(162,207,230);">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>
			<button class="navbar-toggler text-center d-flex loginAndMypageBtn" data-bs-toggle="collapse" style="height: 38px;" >
				<span class="visually-hidden">Toggle navigation</span>
				<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person" 
				style="font-family: 'Source Sans Pro', sans-serif;height: 25px;">
					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
				</svg>
			</button>
			
		</div>
	</nav>
	<div class="text-center d-flex justify-content-center align-items-center">
		<div style="width: 80%;">
			<div style="background: #deeaf0;">
				<p class="text-center" style="font-size: 40px;font-weight: bold;">${shopInfo.shopName}</p>
				<div style="background: #deeaf0;">
					<ul class="text-center" style="margin-bottom: 0px;">
						<li style="font-size: 15px;">가게 위치 : ${shopInfo.shopLocation}<br></li>
						<li style="font-size: 15px;">영업 시간 : ${shopInfo.shopOperTime}<br></li>
						<li style="font-size: 15px;">휴무일 : ${shopInfo.shopHoliday}<br></li>
						<li style="font-size: 15px;">전화번호 : ${shopInfo.shopCall}<br></li>
						<li style="font-size: 15px;">공지 사항 : ${shopInfo.shopNotice}<br></li>
						
					</ul>
				</div>
				<c:if test="${!empty shopEvent}">
					<div class="text-center">
						<p class="text-center" style="font-size: 24px; margin-top: 0px;margin-bottom: 5px;">가게 이벤트</p>
						<div style="background: #deeaf0;">
							<ul class="text-center" style="margin-bottom: 0px;">
								<li style="font-size: 15px;">이벤트 제목 : ${shopEvent.shopEventTitle}<br></li>
								<li style="font-size: 15px;">이벤트 내용 : ${shopEvent.shopEventContents}<br></li>
								<li style="font-size: 15px;">이벤트 시작일 : ${shopEvent.shopEventStart eq null ? '' : shopEvent.shopEventStart}<br></li>
								<li style="font-size: 15px;">이벤트 종료일 : ${shopEvent.shopEventEnd eq null ? '' : shopEvent.shopEventEnd}<br></li>
							</ul>
						</div>
					</div>
				</c:if>
				<div class="align-items-start">
					<p class="text-start" style="font-weight: bold;font-size: 20px;margin-bottom: 0px;">메뉴</p>
					<div class="col text-center" style="margin-top: 0px;">
						<c:forEach var="menu" items="${menuList}">
							<div class="text-center d-flex justify-content-center" id="menu_1" 
							style="font-family: 'Source Sans Pro', sans-serif;margin-top: 0px;margin-right: 0px;margin-left: 0px;">
								<div>
									<img class="rounded-circle flex-shrink-0 me-3 fit-cover" id="menu_4" width="100" height="100"
									src="${menu.menuImageUrl}" style="margin-right: 0px;">
								</div>
								<div style="margin-left: 25px;padding-top: 15px;">
									<p class="fw-bold mb-0" id="menu_2" style="padding-left: 0px;margin-top: 0px;">${menu.menuTitle}</p>
									<p class="text-muted mb-0" id="menu_3" style="padding-left: 0px;">${menu.menuPrice}원</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../../resource/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resource/assets/js/MENU.js"></script>
	<script src="../../resource/assets/js/Subscribe-window.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
		$(".loginAndMypageBtn").on("click", function(){
			$.ajax({
				url: "/loginInterceptor",
				type: "POST",
				data: {
					"uri" : $(document).attr("URL")
				},
				success: function(val){
					if (${empty userID}){
						location.href = '/login';
					} else {
						location.href = '/coupon';
					}
				},
				error: function(){
					alert("로그인 인터셉터 오류");
				}
			})
		});
	</script>
</body>

</html>