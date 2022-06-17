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
	<div style="display: flex; direction: column; justify-content: center;">
		<div style="max-width: 400px; width: 100%;">
			<div class="d-flex justify-content-between align-items-center" style="width: 100%;">
				<span style="font-weight: bold;font-size: 17.5px;" onclick="location.href='/mainRestaurant'">또샵</span>
				<p class="text-center d-flex justify-content-center align-items-center" style="font-size: 40px;
				font-weight: bold;margin-bottom: 0px;margin-top: 0px;">상품권 발행</p>
				<span style="font-size: 17.5px;font-weight: bold;color: rgba(33,37,41,0);">또샵</span>
			</div>
			<input type="text" id="shopSerialNum" style="width: 80%;" placeholder="가게 고유 번호" /><br/>
			<input type="text" id="gift" style="width: 80%;" placeholder="상품권 img" /><br/>
			<input type="text" id="userid" style="width: 80%;" placeholder="유저아이디" /><br/>
			<button class="btn btn-primary" id="gift_create" type="button" style="background: rgb(162,207,230); color: rgb(0,0,0);
			 border-style: none; margin: 10px;">발행</button>
		</div>
	</div>
	<script src="../../resource/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resource/assets/js/MENU.js"></script>
	<script src="../../resource/assets/js/Subscribe-window.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
	
	$("#gift_create").on(
			"click",
			function() {
				var shopSerialNum = $("#shopSerialNum").val();
				console.log(shopSerialNum);
				var gift = $("#gift").val();
				var userid = $("#userid").val();
				var data = {
					"shopSerialNum" : shopSerialNum,
					"gift" : gift,
					"userid" : userid
				}
				$.ajax({
					url : "/coupon_create.do",
					type : "POST",
					data : JSON.stringify(data),
					contentType : "application/json; charset=UTF-8",
					dataType : "text",
					success : function(val) {
						alert(val);
					},
					error : function() {
						alert("fail");
					}
				});
			});
	</script>
</body>

</html>