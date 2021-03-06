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
								<span style="font-weight: bold;font-size: 17.5px;" onclick="location.href='/mainRestaurant'">??????</span>
								<p class="text-center d-flex justify-content-center align-items-center" style="font-size: 40px;
								font-weight: bold;margin-bottom: 0px;margin-top: 0px;">???????????? ??????</p>
								<span style="font-size: 17.5px;font-weight: bold;color: rgba(33,37,41,0);">??????</span>
							</div>
							<div class="text-start mb-3">
								<div>
									<div class="d-flex justify-content-center align-items-center mb-3" 
									style="background: rgb(162,207,230);border-top-left-radius: 4px;
									border-top-right-radius: 4px;border-bottom-right-radius: 4px;border-bottom-left-radius: 4px;">
										<input class="form-control" type="password" id="currentPw" placeholder="?????? ????????????" style="border-top-left-radius: 4px;
										border-bottom-left-radius: 4px;border-top-right-radius: 0px;border-bottom-right-radius: 0px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-lock" 
										style="font-size: 20px;margin-right: 5px;margin-left: 5px;">
											<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
										</svg>
									</div>
									<div class="d-flex justify-content-center align-items-center mb-3" style="background: rgb(162,207,230);
									border-top-left-radius: 4px;border-top-right-radius: 4px;border-bottom-right-radius: 4px;border-bottom-left-radius: 4px;">
										<input class="form-control" type="password" id="newPw" placeholder="??? ????????????" style="border-top-left-radius: 4px;
										border-bottom-left-radius: 4px;border-top-right-radius: 0px;border-bottom-right-radius: 0px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" 
										class="bi bi-lock-fill" style="font-size: 20px;margin-right: 5px;margin-left: 5px;">
											<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0  0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z" />
										</svg>
									</div>
									<p id="pwRegexResult">?????? + ?????? + ??????????????? ???????????? 8??? ?????? ?????????????????? .</p>
									<div class="d-flex justify-content-center align-items-center mb-3" style="background: rgb(162,207,230);
									border-top-left-radius: 4px;border-top-right-radius: 4px;border-bottom-right-radius: 4px;border-bottom-left-radius: 4px;">
										<input class="form-control" type="password" id="newPwCheck" placeholder="??? ???????????? ??????" style="border-top-left-radius: 4px;
										border-bottom-left-radius: 4px;border-top-right-radius: 0px;border-bottom-right-radius: 0px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" 
										class="bi bi-lock-fill" style="font-size: 20px;margin-right: 5px;margin-left: 5px;">
											<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0  0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z" />
										</svg>
									</div>
									<p id="pwCheckResult"></p>
								</div>
							</div>
							<div>
								<button class="btn btn-primary d-block w-100 editPw" type="button" style="background: rgb(162,207,230);
								color: var(--bs-body-color); font-family: 'Source Sans Pro', sans-serif;
								font-weight: bold;font-size: 25px; border: none;">
									<span>???????????? ??????</span>
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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(".editPw").on("click", function(){
			console.log($("#pwRegexResult").text());
			console.log($("#pwCheckResult").text());
			if ($("#pwRegexResult").text() == "?????? ????????? ?????????????????????!" 
					&& $("#pwCheckResult").text() == "???????????? ??? ??????????????? ???????????????!"){
				var data = {
						"currentPw" : $("#currentPw").val(),
						"newPw" : $("#newPw").val(),
						"newPwCheck" : $("#newPwCheck").val()
				};
				$.ajax({
					url: "/edit/changePw.do",
					type: "POST",
					data: JSON.stringify(data),
					contentType: "application/json; charset=UTF-8",
					dataType: "text",
					success: function(val){
						if (val === "success") {
							alert("???????????? ?????? ??????!");
							location.href = '/coupon';
							return;
						}
						alert(val);
					},
					error: function(){
						
					}
				});
			}
		});
		
		$("#newPw").keyup( function() {
			var data = {
					pw : $("#newPw").val()
			}
			$.ajax({
				url: "/join/PwChecking.do",
				type: "POST",
				data: data,
				success: function(val) {
					document.getElementById("pwRegexResult").innerText = val;
					if (val === "?????? ????????? ?????????????????????!")
						document.getElementById("pwRegexResult").style.color = 'green';
						
				},
				error: function(){
				}
			});
		});
		
		$("#newPw").change( function() {
			if ($("#pwRegexResult").text() !== "?????? ????????? ?????????????????????!"){
				document.getElementById("pwRegexResult").style.color = 'red';
			} else {
				document.getElementById("pwRegexResult").style.color = 'green';
			}
		});
		
		$("#newPwCheck").keyup( function() {
			var pw = $("#newPw").val();
			var pw_check = $("#newPwCheck").val();
			if (pw === pw_check){
				document.getElementById("pwCheckResult").innerText = '???????????? ??? ??????????????? ???????????????!';
				document.getElementById("pwCheckResult").style.color = 'green';
			} else {
				document.getElementById("pwCheckResult").innerText = '???????????? ??? ??????????????? ???????????? ????????????.';
				document.getElementById("pwCheckResult").style.color = 'red';
			}
		});
	</script>
	
</body>

</html>