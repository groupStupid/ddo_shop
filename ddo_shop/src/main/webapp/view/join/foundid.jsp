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
							<p class="text-center" style="font-size: 40px;font-weight: bold;">아이디 찾기</p>
							<div class="mb-3">
								<input class="form-control" type="email" id="foundid_email" placeholder="이메일" style="margin-top: 15px;">
							</div>
							<div style="margin-top: 5px;">
								<button class="btn btn-primary" type="button" id="foundid_submit" style="background: rgb(162,207,230);color: var(--bs-body-color);
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
    	$("#foundid_submit").on("click", function(){
    		var email = $("#foundid_email").val();
    		
    		var data = {
    				"email" : email
    		};
    		$.ajax({
    			url : "/join/foundid.do",
    			type : "POST",
    			data : data, 
    			success : function(result){
    				if (result === "found userid fail")
    					alert("아이디 찾기 중 오류가 발생하였습니다.");
    				else if (result.length === 0)
    					alert("찾으시는 아이디가 존재하지 않습니다.");
    				else
    					location.href = "/foundid_success";
    			},
    			error : function(){
    				alert("아이디 찾기 과정 중 문제가 생겼습니다.");
    			}
    		});
    	});
    </script>
</body>

</html>