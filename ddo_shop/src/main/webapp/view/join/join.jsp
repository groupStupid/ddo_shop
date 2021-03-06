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
					<div class="card m-auto mb-5" >
						<div class="card-body p-sm-5">
							<div class="d-flex justify-content-between align-items-center" style="width: 100%;">
								<span style="font-weight: bold;font-size: 17.5px;" onclick="location.href='/mainRestaurant'">??????</span>
								<p class="text-center d-flex justify-content-center align-items-center" style="font-size: 40px;
								font-weight: bold;margin-bottom: 0px;margin-top: 0px;">????????????</p>
								<span style="font-size: 17.5px;font-weight: bold;color: rgba(33,37,41,0);">??????</span>
							</div>
							
							<div id="select_copy" class="custom-control custom-radio custom-control-inline" 
							style="font-family: 'Source Sans Pro', sans-serif;margin-top: 0px;padding-top: 0px;padding-right: 0px;padding-left: 0px;">
								<input type="radio" id="select_-1" class="custom-control-input" name="category" checked="checked"
								onclick="ShowOwnerInputText()" value="1">
									<label class="form-label custom-control-label" id="select_-2" for="customRadioInline1">?????????</label>
								<input type="radio" id="select_-3" class="custom-control-input" name="category"
								onclick="ShowOwnerInputText()" value="2">
									<label class="form-label custom-control-label" id="select_-4" for="customRadioInline2">??????</label>
							</div>
							<div>
								<input class="form-control" id="shopSerialNum" type="text" placeholder="?????? ??????" 
								style="display:none;  margin-top: 15px;">
							</div>
							<div class="text-start mb-3">
								<input class="form-control" type="text" id="id_id" name="id" placeholder="?????????">
								<p id="idCheckResult"></p>
								<div style="margin-top: 5px;">
									<button class="btn btn-primary" id="idcheck" type="button" style="color: var(--bs-dark);
									font-size: 10px;background: rgba(13,110,253,0);">????????????</button>
								</div>
							</div>
							<div>
								<div class="d-flex justify-content-center align-items-center mb-3" style="background: rgb(162,207,230);border-top-left-radius: 4px;border-top-right-radius: 4px;border-bottom-right-radius: 4px;border-bottom-left-radius: 4px;">
									<input class="form-control" type="password" id="password" placeholder="????????????" style="border-top-left-radius: 4px;
									border-bottom-left-radius: 4px;border-top-right-radius: 0px;border-bottom-right-radius: 0px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-lock" 
										style="font-size: 20px;margin-right: 5px;margin-left: 5px;">
											<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
										</svg>
								</div>
								<p id="pwRegexResult"></p>
								<div class="d-flex justify-content-center align-items-center mb-3" style="background: rgb(162,207,230);border-top-left-radius: 4px;border-top-right-radius: 4px;border-bottom-right-radius: 4px;border-bottom-left-radius: 4px;">
									<input class="form-control" type="password" id="pw_check" placeholder="???????????? ??????" style="border-top-left-radius: 4px;border-bottom-left-radius: 4px;border-top-right-radius: 0px;border-bottom-right-radius: 0px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-lock-fill" style="font-size: 20px;margin-right: 5px;margin-left: 5px;">
											<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z" />
										</svg>
								</div>
								<p id="pwCheckResult"></p>
								<input class="form-control" type="email" id="email" name="email" placeholder="?????????" style="margin-top: 15px;">
								<p id="emailCheckResult"></p>
								<button class="btn btn-primary d-block w-100" id="join"
								style="font-family: 'Source Sans Pro', sans-serif;font-weight: bold;font-size: 25px;">????????????</button>
							</div>
						</div>
						<div class="col-auto col-sm-12 col-md-8 col-lg-6 offset-md-2 offset-lg-3 text-center popup" 
							id="window-1" style="z-index:1; position:fixed; top:30%; left:25%; width:50%; border-radius: 5px; display: none; 
							 text-align: center;margin-top: 0px;background-color: #199bdd; font-family: 'Alegreya Sans SC', sans-serif;">
								<button class="btn btn-light show_hide" id="hide-1" style="border-radius: 200px;background-color: #a2cfe6;
								float: right;border: none;background-image: none;margin-top: -15px;padding-right: 9px;padding-left: 11px;" type="button"
								onclick="onHideClick()">
									<i class="fa fa-close" style="font-size: 30px;color: #199bdd;"></i>
								</button>
								<p class="text-center" style="font-size: 22px;margin-bottom: 0px;font-weight: bold;">???????????? ???????????????</p>
								<div>
									<input class="form-control" type="text" id="nickname" name="nickname" placeholder="???????????? ???????????? ??????????????????." 
									style="margin-top: 0px;font-size: 11px;">
								</div>
								<div style="background: rgb(25,155,221);">
									<span id="nicknameCheckResult"></span>
									<button class="btn btn-primary" type="button" id="nick_check" style="color: var(--bs-body-color);font-size: 10px;
									background: rgb(162,207,230);border-style: none;">????????????</button>
								</div>
								<button class="btn btn-primary" type="button" id="nick_submit" style="background: rgb(162,207,230);color: var(--bs-body-color);
								margin: 10px;font-size: 15px;border-style: none;">
									<span>????????? ??????</span>
								</button>
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
		$("#idcheck").on("click", function() {
			if ($("#id_id").val() === '') {
				document.getElementById("idCheckResult").innerText = "???????????? ??????????????????.";
				document.getElementById("idCheckResult").style.color = 'red';
				return;
			}
			var data = {
					id : $("#id_id").val()
			}
			$.ajax({
				url: "/join/IdChecking.do",
				type: "POST",
				data: data,
				success: function(val) {
					if (val === "success"){
						document.getElementById("idCheckResult").innerText = "?????? ????????? ??????????????????!";
						document.getElementById("idCheckResult").style.color = 'green';	
					} else {
						document.getElementById("idCheckResult").innerText = "?????? ???????????? ??????????????????.";
						document.getElementById("idCheckResult").style.color = 'red';
					}
					
				},
				error: function(){
					document.getElementById("idCheckResult").innerText = "?????? ?????? ??? ?????? ??????";
					document.getElementById("idCheckResult").style.color = 'red';
				}
			});
		});
		
		$("#password").keyup( function() {
			var data = {
					pw : $("#password").val()
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
		
		$("#password").change( function() {
			if ($("#pwRegexResult").text() !== "?????? ????????? ?????????????????????!"){
				document.getElementById("pwRegexResult").style.color = 'red';
			} else {
				document.getElementById("pwRegexResult").style.color = 'green';
			}
		});
		
		$("#pw_check").keyup( function() {
			var pw = $("#password").val();
			var pw_check = $("#pw_check").val();
			if (pw === pw_check){
				document.getElementById("pwCheckResult").innerText = '???????????? ??? ??????????????? ???????????????!';
				document.getElementById("pwCheckResult").style.color = 'green';
			} else {
				document.getElementById("pwCheckResult").innerText = '???????????? ??? ??????????????? ???????????? ????????????.';
				document.getElementById("pwCheckResult").style.color = 'red';
			}
		});
		
		$("#email").change( function() {
			var data = {
					email : $("#email").val()
			}
			$.ajax({
				url: "/join/EmailChecking.do",
				type: "POST",
				data: data,
				success: function(val) {
					document.getElementById("emailCheckResult").innerText = val;
					if (val === "?????? ????????? ??????????????????!")
						document.getElementById("emailCheckResult").style.color = "green";
					else 
						document.getElementById("emailCheckResult").style.color = "red";
				},
				error: function(){
				}
			});
		});
		
		function ShowOwnerInputText(){
			if (document.getElementById("select_-1").checked){
				document.getElementById("shopSerialNum").style.display = 'none';
			} else {
				document.getElementById("shopSerialNum").style.display = 'block';
			}
		}
		
		$("#join").on("click", function() {
			if (document.getElementById("idCheckResult").innerText != "?????? ????????? ??????????????????!") {
				document.getElementById("idCheckResult").innerText = "???????????? ??????????????????.";
				document.getElementById("idCheckResult").style.color = 'red';
			}
			else if (document.getElementById("pwRegexResult").innerText !== '?????? ????????? ?????????????????????!') {
				document.getElementById("pwRegexResult").innerText = "??????????????? ??????????????????.";
				document.getElementById("pwRegexResult").style.color = 'red';
			}
			else if (document.getElementById("pwCheckResult").innerText !== '???????????? ??? ??????????????? ???????????????!') {
				document.getElementById("pwCheckResult").innerText = "??????????????? ?????????????????????.";
				document.getElementById("pwCheckResult").style.color = 'red';
			}
			else if (document.getElementById("emailCheckResult").innerText !== '?????? ????????? ??????????????????!') {
				document.getElementById("emailCheckResult").innerText = "???????????? ??????????????????.";
				document.getElementById("emailCheckResult").style.color = 'red';
			} else {
				var data = {
					email : $("#email").val()
				};
				$.ajax({
					url: "/join/emailDuplicateCheck.do",
					type: "POST",
					data: data,
					success: function(val){
						if (val === "success")
							document.getElementById("window-1").style.display = 'block';
						else
							alert("?????? ???????????? ?????? ????????? ???????????????.\n????????? ????????? ??????????????????.")
					},
					error: function(){
						alert("????????? ?????? ?????? ??? ?????? ??????");
					}
				});
			}
		});
		
		$("#nick_check").on("click", function() {
			if ($("#nickname").val() === '') {
				document.getElementById("nicknameCheckResult").innerText = "???????????? ??????????????????.";
				document.getElementById("nicknameCheckResult").style.color = 'red';
				return;
			}
			var data = {
					nickname : $("#nickname").val()
			}
			$.ajax({
				url: "/join/nicknameChecking.do",
				type: "POST",
				data: data,
				success: function(val) {
					if (val === "success"){
						document.getElementById("nicknameCheckResult").innerText = "?????? ????????? ??????????????????!";
						document.getElementById("nicknameCheckResult").style.color = 'black';	
					} else {
						document.getElementById("nicknameCheckResult").innerText = "?????? ???????????? ??????????????????.";
						document.getElementById("nicknameCheckResult").style.color = 'red';
					}
					
				},
				error: function(){
					document.getElementById("nicknameCheckResult").innerText = "????????? ?????? ?????? ??? ?????? ??????";
					document.getElementById("nicknameCheckResult").style.color = 'red';
				}
			});
		});

		 $("#nick_submit").on("click", function() {
			if (document.getElementById("nicknameCheckResult").innerText !== '?????? ????????? ??????????????????!')
				document.getElementById("nicknameCheckResult").innerText = "???????????? ??????????????????.";
			else {
				var id = $("#id_id").val();
				var pw = $("#password").val();
				var email = $("#email").val();
				var nickname = $("#nickname").val();
				var category = $("input[name='category']:checked").val();
				var form = {
						"id" : id,
						"password" : pw,
						"email" : email,
						"nickname" : nickname,
						"category" : category
				}
				$.ajax({
					url: "/join/nick_submit.do",
					type: "POST",
					data : JSON.stringify(form),
					contentType : "application/json; charset=UTF-8",
					dataType : "text",
					success: function(val) {
						if (val === "id") alert("???????????? ?????? ??????????????????.");
						else if (val === "nickname") alert("???????????? ?????? ??????????????????.");
						else if (val === "register error") alert("???????????? ??? ????????? ?????????????????????.");
						else {
							alert("????????? ??????????????????!");
							location.href = "/mainRestaurant";
						}
						
					},
					error: function(){
						alert("fail");
					}
				});
			}
		});
		
		
		function onHideClick(){
			document.getElementById("window-1").style.display = 'none';
		}
	</script>
</body>

</html>