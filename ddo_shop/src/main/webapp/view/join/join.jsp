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
					<div class="card m-auto mb-5" >
						<div class="card-body p-sm-5">
							<p class="text-center" style="font-size: 40px;font-weight: bold;">회원가입</p>
							
							<div id="select_copy" class="custom-control custom-radio custom-control-inline" 
							style="font-family: 'Source Sans Pro', sans-serif;margin-top: 0px;padding-top: 0px;padding-right: 0px;padding-left: 0px;">
								<input type="radio" id="select_-1" class="custom-control-input" name="customRadioInline" checked="checked"
								onclick="ShowOwnerInputText()">
									<label class="form-label custom-control-label" id="select_-2" for="customRadioInline1">사용자</label>
								<input type="radio" id="select_-3" class="custom-control-input" name="customRadioInline"
								onclick="ShowOwnerInputText()">
									<label class="form-label custom-control-label" id="select_-4" for="customRadioInline2">업주</label>
							</div>
							<div>
								<input class="form-control" id="shopName" type="text" placeholder="가게 이름" 
								style="display:none;  margin-top: 15px;">
							</div>
							<div class="text-start mb-3">
								<input class="form-control" type="text" id="id_id" name="id" placeholder="아이디">
								<div style="margin-top: 5px;">
									<button class="btn btn-primary" id="idcheck" type="button" style="color: var(--bs-dark);
									font-size: 10px;background: rgba(13,110,253,0);">중복확인</button>
								</div>
							</div>
							<div>
								<input class="form-control" type="password"  name="pw" placeholder="비밀번호" style="margin-top: 15px;">
								<p>영문 + 숫자 + 특수문자를 포함하여 8자 이상 입력해주세요.</p>
								<input class="form-control" type="password" name="pw_check" placeholder="비밀번호 확인">
								<input class="form-control" type="email" name="email" placeholder="이메일" style="margin-top: 15px;">
								<button class="btn btn-primary d-block w-100" id="join_submit"
								style="font-family: 'Source Sans Pro', sans-serif;font-weight: bold;font-size: 25px; margin-top: 20px;">회원가입</button>
							</div>
						</div>
						<div class="col-auto col-sm-12 col-md-8 col-lg-6 offset-md-2 offset-lg-3 text-center popup" 
							id="window-1" style="z-index:1; position:fixed; top:30%; left:25%; width:50%; border-radius: 5px;  display: none;
							 text-align: center;margin-top: 0px;background-color: #199bdd; font-family: 'Alegreya Sans SC', sans-serif;">
								<button class="btn btn-light show_hide" id="hide-1" style="border-radius: 200px;background-color: #a2cfe6;
								float: right;border: none;background-image: none;margin-top: -15px;padding-right: 9px;padding-left: 11px;" type="button"
								onclick="onHideClick()">
									<i class="fa fa-close" style="font-size: 30px;color: #199bdd;"></i>
								</button>
								<p class="text-center" style="font-size: 22px;margin-bottom: 0px;font-weight: bold;">닉네임을 정해주세요</p>
								<div>
									<input class="form-control" type="text" id="nickname" name="nickname" placeholder="원하시는 닉네임을 입력해주세요." 
									style="margin-top: 0px;font-size: 11px;">
								</div>
								<div style="background: rgb(25,155,221);">
									<button class="btn btn-primary" type="button" id="nick_check" style="color: var(--bs-body-color);font-size: 10px;
									background: rgb(162,207,230);border-style: none;">중복확인</button>
								</div>
								<button class="btn btn-primary" type="button" id="nick_submit" style="background: rgb(162,207,230);color: var(--bs-body-color);
								margin: 10px;font-size: 15px;border-style: none;">
									<span>닉네임 생성</span>
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
			var data = {
					id : $("#id_id").val()
			}
			$.ajax({
				url: "/join/IdChecking.do",
				type: "POST",
				data: data,
				success: function(val) {
					alert(val);
				},
				error: function(){
					alert("fail");
				}
			});
		});
		
		function test(){
			document.getElementById("window-1").style.display = 'block';
		}
		
		function ShowOwnerInputText(){
			if (document.getElementById("select_-1").checked){
				document.getElementById("shopName").style.display = 'none';
			} else {
				document.getElementById("shopName").style.display = 'block';
			}
		}
		
		$("#join_submit").on("click", function() {
			
			var id = $("#id_id").val();
			var pw = $("input[name=pw]").val();
			var pw_check = $("input[name=pw_check]").val();
			var email = $("input[name=email]").val();
			//var category = $("input[name=category]").val();
			
			var form = {
					"id" : id,
					"pw" : pw,
					"pw_check" : pw_check,
					"email" : email
					//"category" : category
			}
			$.ajax({
				url : "/join/join.do",
				type : "POST",
				data : JSON.stringify(form),
				contentType : "application/json; charset=UTF-8",
				dataType : "text",
				success : function(val) {
					 if (val === "id")
						alert("아이디를 다시 확인해주세요");
					else if (val === "pw")
						alert("비밀번호를 다시 설정해주세요");
					else if (val === "pw_check")
						alert("비밀번호가 일치하지 않습니다.");
					else if (val === "email")
						alert("이메일 형식을 갖춰주세요.");
					else if (val === "register error") 
						alert("회원가입을 실패하였습니다.");
					else {
						document.getElementById("window-1").style.display = 'block';
					}
				},
				error : function() {
					alert("회원가입 과정 중 문제가 생겼습니다.");
				}
			});
		});
		
		$("#nick_check").on("click", function() {
			var nickname = $("#nickname").val();
			$.ajax({
				url: "/join/nicknameChecking.do",
				type: "POST",
				data: nickname,
				success: function(val) {
					alert(val);
				},
				error: function(){
					alert("fail");
				}
			});
		});

		 $("#nick_submit").on("click", function() {
			var id = $("#id_id").val();
			var pw = $("input[name=pw]").val();
			var email = $("input[name=email]").val();
			var nickname = $("#nickname").val();
			//var category = $("input[name=category]").val();
			
			var form = {
					"id" : id,
					"pw" : pw,
					"email" : email,
					"nickname" : nickname
					//"category" : category
			}
			$.ajax({
				url: "/join/nick_submit.do",
				type: "POST",
				data : JSON.stringify(form),
				contentType : "application/json; charset=UTF-8",
				dataType : "text",
				success: function(val) {
					 if (val === "nickname")
						alert("닉네임을 다시 확인해주세요");
					 else {
						alert(val);
						location.href = "/login";
					 }
				},
				error: function(){
					alert("fail");
				}
			});
		});
		
		
		function onHideClick(){
			document.getElementById("window-1").style.display = 'none';
		}
	</script>
</body>

</html>