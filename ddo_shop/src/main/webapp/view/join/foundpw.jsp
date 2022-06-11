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
							<div class="d-flex justify-content-between align-items-center" style="width: 100%;">
								<span style="font-weight: bold;font-size: 17.5px;" onclick="location.href='/mainRestaurant'">또샵</span>
								<p class="text-center d-flex justify-content-center align-items-center" style="font-size: 40px;
								font-weight: bold;margin-bottom: 0px;margin-top: 0px;">비밀번호 찾기</p>
								<span style="font-size: 17.5px;font-weight: bold;color: rgba(33,37,41,0);">또샵</span>
							</div>
							<div class="mb-3">
								<input class="form-control" type="text" id="foundpw_id" placeholder="아이디">
							</div>
							<div class="mb-3">
								<input class="form-control" type="email" id="foundpw_email" placeholder="이메일" style="margin-top: 15px;">
							</div>
							<div style="margin-top: 5px;">
								<div class="d-flex justify-content-center align-items-center">
									<div style="margin-top: 0px;width: 30%;">
										<button class="btn btn-primary" type="button" id="sendVerificationCode" style="background: rgba(162,207,230,0);
										color: var(--bs-body-color);margin: 0px;font-size: 15px;">
											<span>인증번호<br>전송<br></span>
										</button>
									</div>
									<div style="margin-top: 0px;width: 70%;">
										<span id="verificationTimer" style="display: none; color: red;"></span>
										<input class="form-control" type="text" id="verificationCode" name="name" placeholder="인증번호">
									</div>
								</div>
								<button class="btn btn-primary" id="foundpw_submit" type="button" style="background: rgb(162,207,230);color: var(--bs-body-color);
								margin: 5px;font-size: 15px;border-style: none;font-weight: bold;">확인</button>
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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		
		$("#sendVerificationCode").on("click", function(){
			var id = $("#foundpw_id").val();
			var email = $("#foundpw_email").val();
			var form = {
					"id" : id,
					"email" : email
			};
			$.ajax({
				url : "/sendVerificationCode.do",
				type : "POST",
				data : JSON.stringify(form),
				dataType : "text",
				contentType : "application/json; charset=UTF-8",
				success : function(result){
					if (result === "success"){
						document.getElementById("verificationTimer").style.display = 'block';
						var time = 180;
						var min = "";
						var sec = "";
						var timer = setInterval(function(){
							min = parseInt(time/60);
							sec = time%60;
							document.getElementById("verificationTimer").innerText = min+":"+sec;
							time--;
							if (time < 0){
								clearInterval(timer);
								document.getElementById("verificationTimer").innerText = "인증번호 재전송 요청";
							}
						}, 1000);
					}
					else 
						alert("등록되지 않은 아이디 또는 이메일이 입력되었습니다.")
				},
				error : function(){
					alert("비밀번호 찾기 과정 중 문제가 생겼습니다.");
				}
			});
		});
		
		
		$("#foundpw_submit").on("click", function(){
			var verificationCode = $("#verificationCode").val();
			
			var data = {
					"verificationCode" : verificationCode
			};
			$.ajax({
				url : "/verification.do",
				type : "POST",
				data : data,
				success : function(result){
					if (result === "success") {
						location.href = '/editpw';
					} else {
						alert("인증번호가 틀렸습니다.");
					}
				},
				error : function(){
					alert("인증번호 처리 중 오류가 발생하였습니다.");
				}
			});
		}); 
	</script>
	
</body>

</html>