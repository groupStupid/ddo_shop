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
							<p class="text-center" style="font-size: 40px;font-weight: bold;">상품권 확인 페이지</p>
							<div>
								<p class="text-start" style="font-weight: bold;font-size: 20px;">발행된 상품권 현황</p>
								<div class="text-center p-4 p-lg-5" style="background: var(--bs-body-bg);border: 1px solid rgb(25,155,221);padding-top: 0px;padding-bottom: 0px;">
									<div style="background: rgb(255,255,255);margin-top: 0px;">
										<c:if test="${ !empty giftCount }">
											<c:forEach var="val" items="${giftCount}" varStatus="i">
												<div style="background: var(--bs-white);">
													<p class="text-start" style="margin-bottom: 0px;margin-top: 0px;background: #ffffff;font-size: 17.5px;font-weight: bold;">응애 치킨</p>
													<div class="text-start d-flex justify-content-between" style="background: rgb(255,255,255);">
													<img src="${val.key}" id="img${i.index}" style="width: 60%;">${val.value}</div>
												</div>
											</c:forEach>
										</c:if>
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
		function onClickUseGift(id){
			var img = document.getElementById("img"+id).src;
			$.ajax({
				url : "/coupon_use.do",
				type : "POST",
				data : img,
				contentType : "application/text; charset=UTF-8",
				dataType : "text",
				success : function(val) {
					alert(val);
					location.reload();
				},
				error : function() {
					alert("fail");
				}
			});
		}
	</script>
</body>

</html>