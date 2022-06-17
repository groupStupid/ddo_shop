<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="text-center" lang="en">

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
	<link rel="stylesheet" href="../../resource/assets/css/Navbar-Centered-1.css">
	<link rel="stylesheet" href="../../resource/assets/css/Navbar-Centered.css">
	<link rel="stylesheet" href="../../resource/assets/css/Projects-Grid.css">
	<link rel="stylesheet" href="../../resource/assets/css/Search-Input-Responsive-with-Icon.css">
	<link rel="stylesheet" href="../../resource/assets/css/styles.css">
	<link rel="stylesheet" href="../../resource/assets/css/tc-menu-10.css">
</head>

<body style="background-color: #deeaf0;">
	<div class="backgroundShadow" style="z-index: 10; margin-top: 0px; position: fixed; left: 0; top: 0;
	width: 100%; height: 100vh; display: none; background: rgba(0,0,0,0.4);"></div> 
	
	<nav class="navbar navbar-light navbar-expand-md text-center m-auto" style="max-width: 80%;">
		<div class="container-fluid">
			<span class="d-flex" style="margin-right: 10px;font-size: 15.5px;font-weight: bold;">
				또샵
			</span>
			<div class="col text-center padMar" style="margin-top: 0px;">
				<form action="/mainSearch">
					<div class="input-group text-center">
						<input class="form-control autocomplete" type="text" name="searchKeyword" placeholder="무엇을 검색해볼까요 ?" 
						style="font-family: 'test3';font-size: 10px;">
						<!-- button style 바뀌었으면 type="button"  -->
						<button class="btn btn-warning" id="s_b-1" type="submit" 
						 style="background: rgb(162,207,230);">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>
			<button class="navbar-toggler text-center d-flex loginAndMypageBtn" data-bs-toggle="collapse" style="height: 38px;">
				<span class="visually-hidden">Toggle navigation</span>
				<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person" 
				style="font-family: 'Source Sans Pro', sans-serif;height: 25px;">
					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
				</svg>
			</button>
			
		</div>
	</nav>
	
	
	<ul class="nav nav-tabs nav-justified text-center m-auto" style="max-width: 80%;font-size: 14px;">
		<li class="nav-item d-flex justify-content-center align-items-center" onclick="location.href = '/mainRestaurant'"><span class="text-center" style="font-weight: bold;">음식점</span></li>
		<li class="nav-item d-flex justify-content-center align-items-center" onclick="location.href = '/mainMarket'"><span class="text-center" style="font-weight: bold;">전통시장</span></li>
		<li class="nav-item d-flex justify-content-center align-items-center" onclick="location.href = '/mainEvent'"><span class="text-center" style="font-weight: bold;">이벤트</span></li>
	</ul>
	<div class="container py-4 py-xl-5" style="width: 360px;">
		<div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3" style="width: 360px;height: 150px;margin-top: -15px;">
			<div class="col" style="height: 150px;margin-top: 0;width: 120px;">
				<div class="text-center d-flex flex-column align-items-center align-items-xl-center" id="1" onclick="showShopList(this.id)">
					<div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block mb-3 bs-icon lg"><span>🍚</span></div>
					<div class="px-3" ><span style="font-size: 20px;font-weight: bold;">한식</span></div>
				</div>
			</div>
			<div class="col" style="width: 120px;height: 150px;margin-top: 0;">
				<div class="text-center d-flex flex-column align-items-center align-items-xl-center" id="2" onclick="showShopList(this.id)">
					<div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block mb-3 bs-icon lg"><span>🍜</span></div>
					<div class="px-3"><span style="font-size: 20px;font-weight: bold;">중식</span></div>
				</div>
			</div>
			<div class="col" style="width: 120px;margin-top: 0;">
				<div class="text-center d-flex flex-column align-items-center align-items-xl-center" id="3" onclick="showShopList(this.id)">
					<div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block mb-3 bs-icon lg"><span>🍣</span></div>
					<div class="px-3"><span style="font-size: 20px;font-weight: bold;">일식</span></div>
				</div>
			</div>
		</div>
		
		<div class="text-center popup" id="window-3" 
		style="z-index:20; position:fixed; top:20%; left:25%; width:50%; display: none; border: 2px solid;
		 text-align: center; margin-top: 0px; font-family: 'Alegreya Sans SC', sans-serif; height: 350px;">
			<div style="height: 300px; margin-top: 0px;" onclick="location.href = '/comment?event=5'">
				<img alt="진행중인 이벤트" src="https://ddoshop-bucket.s3.ap-northeast-2.amazonaws.com/eventPoster.png" style="width:100%; height: 100%;">
			</div>
			<div style="background: black; height: 50px; display: flex; margin-top: 0px; border-top: 2px solid; border-bottom: 2px solid;">
				<button id="hideBtn" type="button" style="background: rgb(162,207,230); font-size: 15px;
				border:none; margin-right:1px; width: 50%; padding: 0px;">확인</button>
				<button id="closeBtn" type="button" style="background: rgb(162,207,230); font-size: 15px;
				border:none; margin-left:1px; width: 50%; padding: 0px;" onclick="setCloseBtn()">오늘 하루 그만보기</button>
			</div>
		</div>
		
		<div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3" style="width: 360px;height: 150px;">
			<div class="col" style="width: 120px;height: 150px;margin-top: 30px;">
				<div class="text-center d-flex flex-column align-items-center align-items-xl-center" id="4" onclick="showShopList(this.id)">
					<div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block mb-3 bs-icon lg"><span>🥩</span></div>
					<div class="px-3"><span style="font-size: 20px; font-weight: bold;">양식</span></div>
				</div>
			</div>
			<div class="col" style="width: 120px;height: 150px;margin-top: 30px;">
				<div class="text-center d-flex flex-column align-items-center align-items-xl-center" id="5" onclick="showShopList(this.id)">
					<div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block mb-3 bs-icon lg"><span>🍱</span></div>
					<div class="px-3"><span style="font-size: 20px;font-weight: bold;">도시락</span></div>
				</div>
			</div>
			<div class="col" style="width: 120px;margin-top: 30px;">
				<div class="text-center d-flex flex-column align-items-center align-items-xl-center" id="6" onclick="showShopList(this.id)">
					<div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block mb-3 bs-icon lg"><span>🍰</span></div>
					<div class="px-3"><span style="font-size: 20px;font-weight: bold;">디저트</span></div>
				</div>
			</div>
		</div>
		<div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3" style="width: 360px;height: 150px;">
			<div class="col" style="width: 120px;height: 150px;margin-top: 60px;">
				<div class="text-center d-flex flex-column align-items-center align-items-xl-center" id="7" onclick="showShopList(this.id)">
					<div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block mb-3 bs-icon lg"><span>🍔</span></div>
					<div class="px-3"><span style="font-size: 20px;font-weight: bold;">햄버거</span></div>
				</div>
			</div>
			<div class="col" style="width: 120px;height: 150px;margin-top: 60px;">
				<div class="text-center d-flex flex-column align-items-center align-items-xl-center" id="8" onclick="showShopList(this.id)">
					<div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block mb-3 bs-icon lg"><span>🍗</span></div>
					<div class="px-3"><span style="font-size: 20px;font-weight: bold;">치킨</span></div>
				</div>
			</div>
			<div class="col" style="width: 120px;margin-top: 60px;">
				<div class="text-center d-flex flex-column align-items-center align-items-xl-center" id="9" onclick="showShopList(this.id)">
					<div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block mb-3 bs-icon lg"><span>🍕</span></div>
					<div class="px-3"><span style="font-size: 20px;font-weight: bold;">피자</span></div>
				</div>
			</div>
		</div>
	</div>
	<script src="../../resource/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resource/assets/js/MENU.js"></script>
	<script src="../../resource/assets/js/Subscribe-window.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){ 
			cookiedata = document.cookie;
			if(cookiedata.indexOf("close=Y")<0){ 
				$(".backgroundShadow").show();
				$("#window-3").css("display", "block");
			}else{
				$(".backgroundShadow").hide();
				$("#window-3").css("display", "none");
			} 
		}); 
		
		$("#hideBtn").on("click", function(){
			$(".backgroundShadow").hide();
			$("#window-3").css("display", "none");
		});
		
		
		function setCloseBtn(){
			setCookie("close", "Y", 1);
			$(".backgroundShadow").hide();
			document.getElementById("window-3").style.display = 'none';
		}
		
		function setCookie(cname, cvalue, exdays) { 
			var d = new Date(); 
			d.setTime(d.getTime() + (exdays*24*60*60*1000)); //시간설정 
			var expires = "expires="+d.toUTCString(); var temp = cname + "=" + cvalue + "; " + expires; 
			document.cookie = temp; 
		}
	
		$(".loginAndMypageBtn").on("click", function(){
			$.ajax({
				url: "/loginInterceptor",
				type: "POST",
				data: {
					"uri" : $(document).attr("URL")
				},
				success: function(val){
					if (${empty userID}){
						location.href = '/login';
					} else {
						location.href = '/coupon';
					}
				},
				error: function(){
					alert("로그인 인터셉터 오류");
				}
			})
		});
		
		
		function showShopList(id){
			location.href = '/main/shop?category='+id;
		}
		
		
	</script>
</body>

</html>