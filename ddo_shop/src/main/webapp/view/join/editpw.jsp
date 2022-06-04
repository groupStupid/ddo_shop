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
							<p class="text-center" style="font-size: 40px;font-weight: bold;">비밀번호 재설정</p>
							<input class="form-control" type="password" id="new_pw" placeholder="새 비밀번호">
							<p>영문 + 숫자 + 특수문자를 포함하여 8자 이상 입력해주세요 .</p>
							<input class="form-control" type="password" id="new_pw_check" placeholder="비밀번호 확인" style="margin-top: 15px;">
							<div style="margin-top: 5px;">
								<button class="btn btn-primary" type="button" id="edit_pw_submit" style="background: rgb(162,207,230);color: var(--bs-body-color);
								margin: 0px;font-size: 15px;border-style: none;font-weight: bold;">확인</button>
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
		$("#edit_pw_submit").on("click", function(){
			var new_pw = $("#new_pw").val();
			var new_pw_check = $("#new_pw_check").val();
			var form = {
					"new_pw" : new_pw,
					"new_pw_check" : new_pw_check
			};
			$.ajax({
				url: "/editpw.do",
				type: "POST",
				data: JSON.stringify(form),
				contentType : "application/json; charset=UTF-8",
				dataType : "text",
				success : function(result) {
					if (result === "success") {
						alert("비밀번호가 변경되었습니다.");
						location.href = "/main";
					}
					else
						alert(result);
				},
				error : function() {
					alert("changepw ajax fail");
				}
			})
		});
	</script>
</body>

</html>