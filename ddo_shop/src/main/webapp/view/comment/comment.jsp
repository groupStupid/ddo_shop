<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="font-family: 'test';">

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

<body>
	<nav class="navbar navbar-light navbar-expand-md text-center m-auto" style="max-width: 80%;">
		<div class="container-fluid"><span class="text-center d-flex" style="margin-right: 10px;font-size: 17.5px;font-weight: bold;">또샵</span>
			<div class="col text-center padMar">
				<div class="input-group text-center"><input class="form-control autocomplete" type="text" id="search_w-1" placeholder="무엇을 검색해볼까요 ?" style="font-family: 'Source Sans Pro', sans-serif;font-size: 10px;"><button class="btn btn-warning" id="s_b-1" type="button" style="background: rgb(162,207,230);"><i class="fa fa-search"></i></button></div>
			</div><button class="navbar-toggler text-center d-flex" data-bs-toggle="collapse" style="height: 38px;"><span class="visually-hidden">Toggle navigation</span><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person" style="font-family: 'Source Sans Pro', sans-serif;height: 25px;">
					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
				</svg></button>
		</div>
	</nav>
	<ul class="nav nav-tabs nav-justified text-center m-auto" style="max-width: 80%;font-size: 14px;">
		<li class="nav-item d-flex justify-content-center align-items-center"><span>음식점</span></li>
		<li class="nav-item d-flex justify-content-center align-items-center"><span class="text-center">헬스장</span></li>
		<li class="nav-item d-flex justify-content-center align-items-center"><span class="text-center">전통시장</span></li>
	</ul>
	<div class="container m-auto" style="max-width: 80%;min-width: 300px;width: 300px;">
		<div class="row" style="width: 300px;max-width: 90%;min-width: 300px;">
			<div class="col-md-6" style="padding-right: 0px;padding-left: 0px;width: 150px;"><img src="../assets/img/vkwjs.jpeg" style="width: 150px;height: 180px;"></div>
			<div class="col-md-6" style="width: 150px;">
				<ul>
					<li style="font-size: 20px;font-weight: bold;">가게 이름</li>
					<li>이벤트 이름</li>
					<li>이벤트 내용</li>
					<li>이벤트 상품 내용</li>
					<li>이벤트 기간</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="m-auto" style="max-width: 80%;">
		<section class="py-4 py-xl-5" style="margin-top: -17.5px;">
			<div class="container" style="padding-right: 0px;margin-right: 0px;">
				<div class="text-center p-4 p-lg-5" style="background: var(--bs-body-bg);margin-top: 0px;border: 1px solid rgb(25,155,221);padding-left: 0px;margin-left: -20px;">
					<div class="d-flex justify-content-between" style="width: 100%;background: rgb(255,255,255);"><input type="text" style="padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;width: 80%;"><button class="btn btn-primary" type="button" style="font-family: 'Source Sans Pro', sans-serif;font-size: 15px;padding: 6px 12px;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;background: rgb(162,207,230);color: #000000;margin: 0px;margin-top: 0px;margin-right: 0px;border-style: none;font-weight: bold;width: 15%;"><span style="width: 10%;font-size: 14px;">댓글 달기</span></button></div>
					<div class="text-start" style="margin-bottom: 0px;background: var(--bs-white);border-bottom: 2px solid var(--bs-gray-dark);padding-bottom: 5px;">
						<p style="margin-bottom: 0px;margin-top: 0px;font-size: 17px;font-weight: bold;">응애님</p>
						<p style="margin-bottom: 0px;margin-top: 0px;">정말 재밌어요 !</p>
						<div class="text-start d-flex flex-row align-items-center" style="background: var(--bs-white);margin-top: 0px;padding-bottom: 0px;"><button class="btn btn-primary text-center" type="button" style="padding: 0px;padding-top: 0px;background: rgba(25,155,221,0);font-size: 13px;color: var(--bs-body-color);border-style: none;padding-bottom: 0px;height: 100%;">대댓글</button><button class="btn btn-primary text-center" type="button" style="padding: 0px;padding-top: 0px;background: rgba(25,155,221,0);color: var(--bs-red);border-style: none;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-suit-heart-fill" style="height: 100%;margin-left: 5px;margin-right: 5px;">
									<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"></path>
								</svg></button><span class="text-center" style="margin-left: 0px;height: 100%;">220</span></div>
						<div class="d-flex justify-content-between" style="width: 100%;background: rgb(255,255,255);"><input type="text" style="padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;width: 80%;"><button class="btn btn-primary" type="button" style="font-family: 'Source Sans Pro', sans-serif;font-size: 15px;padding: 6px 12px;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;background: rgb(162,207,230);color: #000000;margin: 0px;margin-top: 0px;margin-right: 0px;border-style: none;font-weight: bold;width: 15%;"><span style="width: 10%;font-size: 14px;">댓글 달기</span></button></div>
					</div>
					<div class="text-end d-flex justify-content-end" style="margin-bottom: 0px;background: var(--bs-white);width: 100%;padding-bottom: 5px;border-bottom-width: 2px;border-bottom-color: var(--bs-gray-dark);">
						<div class="text-start" style="width: 80%;border-bottom-width: 2px;border-bottom-style: solid;padding-bottom: 5px;background: var(--bs-white);">
							<p style="margin-bottom: 0px;margin-top: 0px;font-size: 17px;font-weight: bold;">야옹님</p>
							<p style="margin-top: 0px;margin-bottom: 0px;">저도 참여하고 싶어요<br></p>
							<div class="text-start d-flex flex-row align-items-center" style="background: var(--bs-white);margin-top: 0px;padding-bottom: 0px;"><button class="btn btn-primary text-center" type="button" style="padding: 0px;padding-top: 0px;background: rgba(25,155,221,0);color: var(--bs-red);border-style: none;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-suit-heart-fill" style="height: 100%;margin-left: 5px;margin-right: 5px;">
										<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"></path>
									</svg></button><span class="text-center" style="margin-left: 0px;height: 100%;">120</span></div>
							<div class="text-end" style="margin-bottom: 0px;margin-left: 0px;background: var(--bs-body-bg);width: 100%;">
								<div class="text-end d-flex justify-content-between" style="width: 100%;background: rgb(255,255,255);"><input class="justify-content-between" type="text" style="padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;margin-right: 0px;width: 75%;"><button class="btn btn-primary" type="button" style="font-family: 'Source Sans Pro', sans-serif;font-size: 11px;padding: 6px 12px;padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;background: rgb(162,207,230);color: #000000;margin: 0px;margin-top: 0px;margin-right: 0px;width: 20%;border-style: none;font-weight: bold;"><span style="font-size: 15px;">댓글 달기</span></button></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script src="../../resource/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resource/assets/js/MENU.js"></script>
	<script src="../../resource/assets/js/Subscribe-window.js"></script>
</body>

</html>