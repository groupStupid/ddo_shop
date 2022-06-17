<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<section class="position-relative py-4 py-xl-5">
		<div class="container position-relative">
			<div class="row d-flex justify-content-center">
				<div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
					<div class="card mb-5">
						<div class="card-body p-sm-5">
							<div class="d-flex justify-content-between align-items-center" style="width: 100%;">
								<span style="font-weight: bold;font-size: 17.5px;" onclick="location.href='/mainRestaurant'">또샵</span>
								<p class="text-center d-flex justify-content-center align-items-center" style="font-size: 40px;
								font-weight: bold;margin-bottom: 0px;margin-top: 0px;">MY 페이지</p>
								<span style="font-size: 17.5px;font-weight: bold;color: rgba(33,37,41,0);">또샵</span>
							</div>
							<div class="text-start" style="margin-top: 15px;margin-bottom: 0px;">
								<p style="font-size: 25px;font-weight: bold;margin-top: 0px;margin-bottom: 0px;">${userNick}님 !</p><br/>
								<div class="text-start" style="margin-top: 0px;">
									<button class="btn btn-primary" type="button" style="background: rgb(162,207,230);border-style: none;
									font-weight: bold;color: rgb(0,0,0);height: 35px;margin-right: 10px;" onclick="location.href='/edit'">비밀번호 변경</button>
									<button class="btn btn-primary" type="button" style="background: rgb(162,207,230);color: rgb(0,0,0);
									font-weight: bold;border-style: none;height: 35px;margin-left: 10px;" onclick="location.href='/logout.do'">로그아웃</button>
								</div>
							</div>
							<div>
								<p class="text-start" style="font-weight: bold;font-size: 20px;">나의 상품권 현황</p>
								<div class="text-center p-4 p-lg-5" style="background: var(--bs-body-bg);margin-top: 0px;border: 1px solid rgb(25,155,221);padding-top: 0px;padding-right: 0px;padding-left: 0px;padding-bottom: 0px;">
									<div style="margin-top: 0px;background: rgb(255,255,255);">
										<c:if test="${ !empty userGifts }">
											<c:forEach var="val" items="${userGifts}" varStatus="i">
												<div style="background: var(--bs-white);">
													<div class="text-start d-flex justify-content-between" style="background: rgb(255,255,255);">
														<img src="${val}" id="img${i.index}" style="width: 60%;">
															<button class="btn btn-primary useGiftBtn" id="${i.index}" style="background: rgb(162,207,230); color: rgb(0, 0, 0);"
															type="button">사용</button>
													</div>
												</div>
											</c:forEach>
										</c:if>
										
									</div>
								</div>
							</div>
							<div class="col-auto col-sm-12 col-md-8 col-lg-6 offset-md-2 offset-lg-3 text-center popup" 
							id="window-2" style="z-index:1; position:fixed; top:30%; left:25%; width:50%; border-radius: 5px; display: none; 
							 text-align: center;margin-top: 0px;background-color: rgb(162,207,230); font-family: 'Alegreya Sans SC', sans-serif;">
								<button class="btn btn-light show_hide" id="hide-1" style="border-radius: 200px;background-color: #a2cfe6;
								float: right;border: none;background-image: none;margin-top: -15px;padding-right: 9px;padding-left: 11px;" type="button"
								onclick="onHideClick()">
									<i class="fa fa-close" style="font-size: 30px;color: #199bdd;"></i>
								</button>
								<p class="text-center" style="font-size: 14px;margin-bottom: 0px;font-weight: bold;">사용하시려면 가게 번호를 입력해주세요.</p>
								<div>
									<input class="form-control" type="text" id="serialNum" name="serialNum" placeholder="가게 번호" 
									style="margin-top: 0px;font-size: 11px;">
								</div>
								<button class="btn btn-primary serialNumSubmit" type="button" style="background: rgb(162,207,230);color: var(--bs-body-color);
								margin: 10px;font-size: 15px;">
									<span>상품권 사용하기</span>
								</button>
							</div>
							<div>
								<p class="text-start" style="font-weight: bold;font-size: 20px;">나의 쿠폰 현황</p>
								<div class="text-center p-4 p-lg-5" style="background: var(--bs-body-bg);border: 1px solid rgb(25,155,221);padding-top: 0px;padding-bottom: 0px;">
									<div style="background: rgb(255,255,255);margin-top: 0px;">
										<c:forEach var="couponCnt" items="${couponList}">
											<div style="background: var(--bs-white);margin-top: 0px; margin-bottom: 10px;">
												<p class="text-start" style="font-size: 17.5px;font-weight: bold;margin-top: 0px;margin-bottom: 0px;">가게 이름</p>
												<div class="text-start" style="background: var(--bs-white);margin-top: 0px;height: 40px;">
													<c:forEach var="i" begin="1" end="${couponCnt}">
														<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="15%" fill="#000000">
															<path d="M0 0h24v24H0V0z" fill="none"/>
															<path d="M16 5v8c0 1.1-.9 2-2 2H8c-1.1 0-2-.9-2-2V5h10m4-2H4v10c0 2.21 1.79 4 4 4h6c2.21 0 4-1.79 4-4v-3h2c1.11 0 2-.89 2-2V5c0-1.11-.89-2-2-2zm-2 5V5h2v3h-2zm2 11H2v2h18v-2z"/>
														</svg>
														<c:if test="${i == 5}"><br/></c:if>
														
													</c:forEach>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
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
		$(".useGiftBtn").on("click", function(){
			$("#window-2").css("display", "block");
			$(".serialNumSubmit").attr("id", $(this).attr("id"));
		});
	
		
		function onHideClick(){
			document.getElementById("window-2").style.display = 'none';
		}
		
		
		$(".serialNumSubmit").on("click", function(){
			var img = document.getElementById("img"+$(this).attr("id")).src;
			var shopSerialNum = $("#serialNum").val();
			if (shopSerialNum == ''){
				alert("상품권을 사용하시려면 가게 번호를 입력해주세요");
				return;
			}
			var data = {
					"img" : img,
					"shopSerialNum" : shopSerialNum
			};
			$.ajax({
				url : "/coupon_use.do",
				type : "POST",
				data : JSON.stringify(data),
				contentType : "application/json; charset=UTF-8",
				dataType : "text",
				success : function(val) {
					if (val == "쿠폰이 정상적으로 사용되었습니다!") {
						alert(val);
						location.reload();
					} else {
						alert(val);
					}
				},
				error : function() {
					alert("fail");
				}
			});
		});
		
		
	</script>
</body>

</html>