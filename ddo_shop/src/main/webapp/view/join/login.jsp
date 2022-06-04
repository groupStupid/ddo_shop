<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="../../resource/assets/css/Navbar-Centered.css">
	<link rel="stylesheet" href="../../resource/assets/css/Projects-Grid.css">
	<link rel="stylesheet" href="../../resource/assets/css/Search-Input-Responsive-with-Icon.css">
	<link rel="stylesheet" href="../../resource/assets/css/styles.css">
	<link rel="stylesheet" href="../../resource/assets/css/tc-menu-10.css">
</head>

<body style="background-color: #e4eef4;">
	<section class="m-auto position-relative py-4 py-xl-5" id="login_main" style="margin-top: 0px;max-width: 90%;padding-top: 0px;padding-bottom: 0px;">
		<div class="container text-center m-auto" style="max-width: 90%;background: rgb(228,238,244);">
			<div class="card text-center m-auto mb-5" id="login_m2" style="max-width: 90%;background: rgb(228,238,244);">
				<div class="card-body text-center d-flex flex-column align-items-center m-auto" style="font-family: 'Source Sans Pro', sans-serif;max-width: 90%;background: rgb(228,238,244);">
					<p class="text-center" style="font-size: 40px;font-weight: bold;">로그인</p>
					<div class="bs-icon-xl bs-icon-circle bs-icon-primary bs-icon my-4" id="person" style="max-width: 400px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person" style="font-family: 'Source Sans Pro', sans-serif;">
							<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
						</svg></div>
					<form  action="/login" class="text-center" method="post">
						<div class="d-flex justify-content-center align-items-center mb-3" style="background: rgb(162,207,230);border-top-left-radius: 4px;border-top-right-radius: 4px;border-bottom-right-radius: 4px;border-bottom-left-radius: 4px;">
							<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person-check align-items-center" style="font-size: 20px;margin-right: 5px;margin-left: 5px;">
								<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
								<path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
							</svg>
							<input class="form-control" type="text" name="id" placeholder="ID" style="border-top-left-radius: 0px;border-bottom-left-radius: 0px;">
						</div>
						<div class="d-flex justify-content-center align-items-center mb-3" style="background: rgb(162,207,230);border-top-left-radius: 4px;border-top-right-radius: 4px;border-bottom-right-radius: 4px;border-bottom-left-radius: 4px;">
							<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-lock" style="font-size: 20px;margin-right: 5px;margin-left: 5px;">
								<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
							</svg>
							<input class="form-control" type="password" name="pw" placeholder="PW" style="border-top-left-radius: 0px;border-bottom-left-radius: 0px;">
						</div>
						<!-- <div class="mb-3"><input class="form-control" name="" type="text" placeholder="ID"></div>
						<div class="mb-3"><input class="form-control" name="" type="password" placeholder="PW"></div> -->
						<button class="btn btn-primary text-center d-block w-100" id="login_1" type="submit" 
						style="font-weight: bold;color: var(--bs-body-color); margin-bottom: 10px;">사용자로 로그인</button>
						<button class="btn btn-primary text-center d-block w-100" id="login_2" type="submit" style="font-weight: bold;color: var(--bs-body-color);">업주로 로그인</button>
					</form>
					<p class="text-muted" style="font-size: 13px;">회원가입을 하지 않으셨나요 ?</p>
					<a class="card-link" id="link" href="/join" style="font-size: 10px;">회원가입 하러 가기</a>
					<div>
						<a id="link-1" href="/foundid" style="font-size: 10px;color: rgb(0,0,255);margin-left: 0px; margin-right: 5px;">아이디 찾기</a>
						<a id="link-2" href="/foundpw" style="font-size: 10px;color: rgb(0,0,255);margin-left: 5px;">비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="../../resource/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resource/assets/js/MENU.js"></script>
	<script src="../../resource/assets/js/Subscribe-window.js"></script>
</body>

</html>