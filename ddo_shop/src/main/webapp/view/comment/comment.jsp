<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

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
	<nav class="navbar navbar-light navbar-expand-md text-center m-auto" style="max-width: 80%;">
		<div class="container-fluid">
			<span class="text-center d-flex" id="testtesttest" style="margin-right: 10px;font-size: 17.5px;font-weight: bold;">또샵</span>
			<div class="col text-center padMar">
				<div class="input-group text-center">
					<input class="form-control autocomplete" type="text" id="search_w-1" 
					placeholder="무엇을 검색해볼까요 ?" style="font-family: 'test3';font-size: 10px;">
					<button class="btn btn-warning" id="s_b-1" type="button" style="background: rgb(162,207,230);">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
			<c:choose>
				<c:when test="${empty userID}">
					<c:set var="loginBtnUrl" value="location.href='/login'" />
				</c:when>
				<c:otherwise>
					<c:set var="loginBtnUrl" value="location.href='/coupon'" />
				</c:otherwise>
			</c:choose>
			<button class="navbar-toggler text-center d-flex" data-bs-toggle="collapse" style="height: 38px;" onclick="${loginBtnUrl}">
				<span class="visually-hidden">Toggle navigation</span>
				<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person" 
				style="font-family: 'Source Sans Pro', sans-serif;height: 25px;">
					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
				</svg>
			</button>
		</div>
	</nav>
	<ul class="nav nav-tabs nav-justified text-center m-auto" style="max-width: 80%;font-size: 14px;">
		<li class="nav-item d-flex justify-content-center align-items-center"><span>음식점</span></li>
		<li class="nav-item d-flex justify-content-center align-items-center"><span class="text-center">헬스장</span></li>
		<li class="nav-item d-flex justify-content-center align-items-center"><span class="text-center">전통시장</span></li>
	</ul>
	<div class="container m-auto" style="max-width: 80%;min-width: 300px;width: 300px;">
		<div class="row" style="width: 300px;max-width: 90%;min-width: 300px;margin-bottom: 20px;margin-top: 10px;">
			<c:forEach var="event" items="${eventList}">
				<c:if test="${event.eventNum eq param.event}">
					<div class="col-md-6" style="padding-right: 0px;padding-left: 0px;width: 150px;">
						<img style="height: 180px;width: 150px;" src="${event.eventImageurl}">
					</div>
					<div class="col-md-6" style="width: 150px;">
						<ul>
							<li style="font-size: 20px;font-weight: bold;">응애 치킨</li>
							<li>${event.eventTitle}</li>
							<li>${event.eventContents}</li>
							<li>${event.eventGoods}</li>
							<li>${event.eventStart}</li>
							<li>${event.eventEnd}</li>
							<li>${event.eventOngoing}</li>
						</ul>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="m-auto" style="max-width: 80%;">
		<section class="py-4 py-xl-5" style="margin-top: -17.5px;">
			<div class="container" style="padding-right: 0px;margin-right: 0px;">
				<div class="text-center p-4 p-lg-5" style="background: var(--bs-body-bg);margin-top: 0px;
				border: 1px solid rgb(25,155,221);padding-left: 0px;margin-left: -20px;">
				
					<!--  main comment 입력 부분 -->
					<div class="d-flex justify-content-between" id="mainCommentInputContainer" style="width: 100%;background: rgb(255,255,255);">
						<input type="text" name="commentInput" 
						 style="padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;width: 80%;">
						<button class="btn btn-primary" type="button" name="commentInputBtn" id="mainCommentBtn"
						style="font-family: 'Source Sans Pro', sans-serif;font-size: 15px;padding: 6px 12px;
						padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;background: rgb(162,207,230);color: #000000;margin: 0px;
						margin-top: 0px;margin-right: 0px;border-style: none;font-weight: bold;width: 15%;" disabled>
							<span style="width: 10%;font-size: 14px;">댓글 달기</span>
						</button>
					</div>
					
					<c:forEach var="commentItem" items="${commentList}">
						<c:choose>
							<c:when test="${commentItem.commComment eq '!!!삭제된 댓글입니다.!!!' }">
								<div class="text-start" style="margin-bottom: 0px;background: var(--bs-white);border-bottom: 2px solid var(--bs-gray-dark);
								 padding-bottom: 5px;">
									<p class="commentContent" style="margin-bottom: 0px;margin-top: 0px;">삭제된 댓글입니다.</p>
								</div>
							</c:when>
							<c:when test="${commentItem.commClass eq 1}">
								<!-- 1계층 댓글 (주 댓글) -->
								<div class="text-start" style="margin-bottom: 0px;background: var(--bs-white);border-bottom: 2px solid var(--bs-gray-dark);
								 padding-bottom: 5px;">
							 		<ul class="navbar-nav me-auto" style="width:100%; display: flex; flex-direction: row; justify-content: space-between;">
							 			<li class="nav-item">
											<span style="margin-bottom: 0px;margin-top: 0px;font-size: 17px;font-weight: bold;">${commentItem.commNick}님</span>
										</li>
										<c:if test="${userNick eq commentItem.commNick}">
											<li class="nav-item dropdown" >
												<a class="nav-link" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">
													<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
														<path d="M0 0h24v24H0V0z" fill="none" />
														<path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" />
													</svg>
												</a>
												<ul class="dropdown-menu" aria-labelledby="dropdown01">
													<li><a class="dropdown-item commentUpdate" >수정</a></li>
													<li><a class="dropdown-item commentDelete" role="${commentItem.commNum}/${commentItem.commGroupNum}" >삭제</a></li>
												</ul>
											</li>
										</c:if>
									</ul>
									<p class="commentContent" style="margin-bottom: 0px;margin-top: 0px;">${commentItem.commComment}</p>
									<div class="text-start d-flex flex-row align-items-center" style="background: var(--bs-white);margin-top: 0px;padding-bottom: 0px;">
										<button class="btn btn-primary text-center" type="button" 
										onclick="showSubCommentInputContainer('subCommentInputContainer${commentItem.commNum}')" 
										style="padding: 0px;padding-top: 0px;background: rgba(25,155,221,0);font-size: 13px;
										color: var(--bs-body-color);border-style: none;padding-bottom: 0px;height: 100%;">대댓글</button>
										
										<!-- 안눌렀을 경우 빈 하트 -->
										<button class="btn btn-primary text-center" type="button" id="offEmotion" style="padding: 0px;padding-top: 0px;
										background: rgba(25,155,221,0);color: var(--bs-red);border-style: none;">
											<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-suit-heart" style="height: 100%;margin-left: 5px;margin-right: 5px;">
												<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"></path>
											</svg>
										</button>
										<!--  눌렀을 경우 채워진 하트 -->
										<button class="btn btn-primary text-center" type="button" id="onEmotion" style="padding: 0px;padding-top: 0px;background: rgba(25,155,221,0);
										color: var(--bs-red);border-style: none;">
											<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" 
											viewBox="0 0 16 16" class="bi bi-suit-heart-fill" style="height: 100%;margin-left: 5px;margin-right: 5px;">
												<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
											</svg>
										</button>
										<span class="text-center" style="margin-left: 0px;height: 100%;">${commentItem.commEmotions}</span>
									</div>
									<!-- 대댓글 입력 컨테이너 -->
									<div class="d-flex justify-content-between" id="subCommentInputContainer${commentItem.commNum}" 
									style="display: none!important; width: 100%;background: rgb(255,255,255); padding: 0px; margin: 0px;">
										<input type="text" name="commentInput" placeholder="댓글 입력"
										style="padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;width: 80%;">
										<button class="btn btn-primary" type="button" role="${commentItem.commNum}" name="commentInputBtn" style="font-family: 'Source Sans Pro', sans-serif;
										font-size: 15px; padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;background: rgb(162,207,230);
										color: #000000; margin: 0px; border-style: none;font-weight: bold;width: 15%;" disabled>
											<span style="width: 10%; font-size: 14px;">댓글 달기</span>
										</button>
									</div>
									<!-- 수정할 댓글 입력 컨테이너${commentItem.commNum} -->
									<div class="d-flex justify-content-between" id="newCommentInputContainer" 
									style="display: none!important; width: 100%;background: rgb(255,255,255); padding: 0px; margin: 0px;">
										<input type="text" name="newCommentInput" id="newCommentInput" placeholder="수정할 댓글 입력"
										style="padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;width: 80%;">
										<button class="btn btn-primary newCommentInputBtn" type="button" role="${commentItem.commNum}" name="" style="font-family: 'Source Sans Pro', sans-serif;
										font-size: 15px; padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;background: rgb(162,207,230);
										color: #000000; margin: 0px; border-style: none;font-weight: bold;width: 15%;" disabled>
											<span style="width: 10%; font-size: 14px;">댓글 수정</span>
										</button>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<!-- 2계층 댓글 (대댓글 , 서브 댓글) -->
								<div class="text-end d-flex justify-content-end" style="margin-bottom: 0px;background: var(--bs-white);width: 100%;padding-bottom: 5px;
								border-bottom-width: 2px;border-bottom-color: var(--bs-gray-dark);">
									<div class="text-start" style="width: 80%;border-bottom-width: 2px;border-bottom-style: solid;padding-bottom: 5px;background: var(--bs-white);">
										<ul class="navbar-nav me-auto" style="width:100%; display: flex; flex-direction: row; justify-content: space-between;">
								 			<li class="nav-item">
												<span style="margin-bottom: 0px;margin-top: 0px;font-size: 17px;font-weight: bold;">${commentItem.commNick}님</span>
											</li>
											<c:if test="${userNick eq commentItem.commNick}">
												<li class="nav-item dropdown" >
													<a class="nav-link" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">
														<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
															<path d="M0 0h24v24H0V0z" fill="none" />
															<path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" />
														</svg>
													</a>
													<ul class="dropdown-menu" aria-labelledby="dropdown01">
														<li><a class="dropdown-item commentUpdate" >수정</a></li>
														<li><a class="dropdown-item commentDelete" role="${commentItem.commNum}/${commentItem.commGroupNum}" >삭제</a></li>
													</ul>
												</li>
											</c:if>
										</ul>
										<p style="margin-top: 0px;margin-bottom: 0px;">${commentItem.commComment}<br></p>
										<div class="text-start d-flex flex-row align-items-center" style="background: var(--bs-white);margin-top: 0px;padding-bottom: 0px;">
											<!-- 안눌렀을 경우 빈 하트 -->
											<button class="btn btn-primary text-center" type="button" id="offEmotion" style="padding: 0px;padding-top: 0px;
											background: rgba(25,155,221,0);color: var(--bs-red);border-style: none;">
												<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-suit-heart" style="height: 100%;margin-left: 5px;margin-right: 5px;">
													<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"></path>
												</svg>
											</button>
											<!--  눌렀을 경우 채워진 하트 -->
											<button class="btn btn-primary text-center" type="button" style="padding: 0px;padding-top: 0px;background: rgba(25,155,221,0);
											color: var(--bs-red);border-style: none;">
												<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-suit-heart-fill" style="height: 100%;margin-left: 5px;margin-right: 5px;">
													<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
												</svg>
											</button>
											<span class="text-center" style="margin-left: 0px;height: 100%;">${commentItem.commEmotions}</span>
										</div>
										<!-- 수정할 댓글 입력 컨테이너${commentItem.commNum} -->
										<div class="d-flex justify-content-between" id="newCommentInputContainer" 
										style="display: none!important; width: 100%;background: rgb(255,255,255); padding: 0px; margin: 0px;">
											<input type="text" name="newCommentInput" id="newCommentInput" placeholder="수정할 댓글 입력"
											style="padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;width: 80%;">
											<button class="btn btn-primary newCommentInputBtn" type="button" role="${commentItem.commNum}" style="font-family: 'Source Sans Pro', sans-serif;
											font-size: 15px; padding-top: 0;padding-right: 0;padding-bottom: 0;padding-left: 0;background: rgb(162,207,230);
											color: #000000; margin: 0px; border-style: none;font-weight: bold;width: 15%;" disabled>
												<span style="width: 10%; font-size: 14px;">댓글 수정</span>
											</button>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</section>
	</div>
	<script src="../../resource/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resource/assets/js/MENU.js"></script>
	<script src="../../resource/assets/js/Subscribe-window.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
		$("button[name=commentInputBtn]").on("click", function(){
			if (${empty userID}) {
				alert("로그인이 필요합니다");
				location.href = '/login';
				return;
			}
			var commEventNum = ${param.event};
			var commNick = "${ userNick }";
			var commComment = $(this).closest("div").children("input").val();
			var commClass;
			var commGroupNum;
			if ($(this).attr("id") === "mainCommentBtn" ) {
				commClass = 1;
				commGroupNum = -1; // back단에서 추가 메커니즘 있음
			} else {
				commClass = 2;
				commGroupNum = $(this).attr("role");
			}
			
			var data = {
					"commEventNum" : commEventNum,
					"commNick" : commNick,
					"commComment" : commComment,
					"commClass" : commClass,
					"commGroupNum" : commGroupNum
			};
			$.ajax({
				url: "/comment/addComment.do",
				type: "POST",
				data : JSON.stringify(data),
				contentType : "application/json; charset=UTF-8",
				dataType : "text",
				success: function(val) {
					if (val === "success") location.reload();
					else alert("댓글 작성 중 오류 발생");
				},
				error: function(){
					
				}
			});
		});
		
		$(".commentUpdate").on("click", function(){
			var preComment = $(this).closest("div").children("p").text();
			$(this).closest("div").children("#newCommentInputContainer").css("display", "block");
			$(this).closest("div").children("#newCommentInputContainer").children("input").val(preComment);
		});
		
		$("input[name=newCommentInput]").keyup(function(){
			var preComment = $(this).closest("div").siblings("p").text();
			var newComment = $(this).val();
			if (preComment === newComment)
				$(this).next().attr("disabled", true);
			else
				$(this).next().attr("disabled", false);
		});
		
		$(".newCommentInputBtn").on("click", function(){
			var commentNum = $(this).attr("role");
			var newComment = $(this).siblings("input").val();
			var data = {
				"newComment" : newComment,
				"commentNum" : commentNum
			};
			$.ajax({
				url: "/comment/updateComment.do",
				type: "POST",
				data: JSON.stringify(data),
				contentType: "application/json; charset=UTF-8;",
				dataType: "text",
				success: function(val){
					alert("댓글이 수정되었습니다.");
					location.reload();
				},
				error: function(){
					alert("댓글 수정 중 오류 발생");
				}
			});
		});
		
		
		$(".commentDelete").on("click", function(){
			var deleted = confirm("정말 이 댓글을 삭제하시겠습니까?");
			if (deleted){
				var commNumAndGroupNum = $(this).attr("role");
				var data = {
						"commNumAndGroupNum" : commNumAndGroupNum
				};
				$.ajax({
					url: "/comment/deleteComment.do",
					type: "POST",
					data: data,
					success: function(val){
						alert("댓글이 삭제되었습니다.");
						location.reload();
					},
					error: function(val){
						alert("댓글 삭제 중 오류 발생");
					}
				});
			}
		});
			
		$("input[name=commentInput]").keyup( function(e) {
			var value = $(this).val();
			//var value2 = e.target;
			//var value3 = $(this).closest("div");
			//console.log(value3);
			if (value === ''){
				$(this).closest("div").children("button").attr("disabled", true);
			} else {
				$(this).closest("div").children("button").attr("disabled", false);
			}
		});
		
		function showSubCommentInputContainer(id){
			if (document.getElementById(id).style.display !== 'block') 
				document.getElementById(id).style.setProperty("display", "block");
			else
				document.getElementById(id).style.setProperty("display", "none", "important");
		}
	</script>
</body>

</html>