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

<body>
	<section class="m-auto position-relative py-4 py-xl-5" style="max-width: 90%;">
		<div class="container position-relative">
			<div class="row d-flex justify-content-center">
				<div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4 m-auto" style="max-width: 90%;">
					<div class="card m-auto mb-5">
						<div class="card-body p-sm-5">
							<p class="text-center" style="font-size: 40px;font-weight: bold;">정보 수정</p>
								<div class="text-start mb-3">
									<input class="form-control" type="text" id="edit_id" placeholder="아이디" style="margin-top: 0px;">
									<div style="margin-top: 5px;">
										<button class="btn btn-primary" type="button" style="color: var(--bs-dark);font-size: 10px;background: rgba(13,110,253,0);">중복확인</button>
									</div>
									<div>
										<div class="d-flex justify-content-center align-items-center mb-3" style="background: rgb(162,207,230);border-top-left-radius: 4px;
										border-top-right-radius: 4px;border-bottom-right-radius: 4px;border-bottom-left-radius: 4px;">
											<input class="form-control" type="password" id="edit_pw" placeholder="비밀번호" style="border-top-left-radius: 4px;
											border-bottom-left-radius: 4px;border-top-right-radius: 0px;border-bottom-right-radius: 0px;">
											<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-lock" 
											style="font-size: 20px;margin-right: 5px;margin-left: 5px;">
												<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
											</svg>
										</div>
										<p>영문 + 숫자 + 특수문자를 포함하여 8자 이상 입력해주세요 .</p>
										<div class="d-flex justify-content-center align-items-center mb-3" style="background: rgb(162,207,230);
										border-top-left-radius: 4px;border-top-right-radius: 4px;border-bottom-right-radius: 4px;border-bottom-left-radius: 4px;">
											<input class="form-control" type="password" id="edit_pw_check" placeholder="비밀번호 확인" style="border-top-left-radius: 4px;
											border-bottom-left-radius: 4px;border-top-right-radius: 0px;border-bottom-right-radius: 0px;">
											<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" 
											class="bi bi-lock-fill" style="font-size: 20px;margin-right: 5px;margin-left: 5px;">
												<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0  0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z" />
											</svg>
										</div>
											
											
										<!-- <input class="form-control" type="password" id="edit_pw" placeholder="비밀번호" style="margin-top: 15px;">
										<input class="form-control" type="password" id="edit_pw_check" placeholder="비밀번호 확인" style="margin-top: 15px;"> -->
										<input class="form-control" type="email" id="edit_email" placeholder="이메일" style="margin-top: 15px;">
									</div>
								</div>
								<div>
									<button class="btn btn-primary d-block w-100" id="join" type="submit" style="font-family: 'Source Sans Pro', sans-serif;
									font-weight: bold;font-size: 25px;">
										<span>정보수정</span>
									</button>
								</div>
						</div>
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