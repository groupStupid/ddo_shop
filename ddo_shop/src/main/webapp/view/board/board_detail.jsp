<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>친환경 게시물</title>
<link rel="stylesheet"
	href="../../resource/term/detail/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
<link rel="stylesheet"
	href="../../resource/term/detail/assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="../../resource/term/detail/assets/fonts/simple-line-icons.min.css">
<link rel="stylesheet"
	href="../../resource/term/detail/assets/css/Header-Blue.css">
<link rel="stylesheet"
	href="../../resource/term/detail/assets/css/styles.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
	<header class="" style="background: rgb(92, 198, 186); height: 60px;">
		<nav
			class="navbar navbar-dark navbar-expand-md navigation-clean-search">
			<div class="container-fluid">
				<a href="/board_main"><i class="fa fa-chevron-left"
					style="width: 30px; height: 30px; font-size: 24px; color: rgb(255, 255, 255);"></i></a>
				<a class="navbar-brand" href="/">
					<img src="../../resource/logo/bunriLogo.png" 
						style="height: 30px;"></img>
						</a>
				<button data-bs-toggle="collapse" class="navbar-toggler"
					data-bs-target="#navcol-1">
					<span class="visually-hidden">Toggle navigation</span><span
						class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navcol-1"
					style="background: rgb(92, 198, 186);">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="dropdown-toggle nav-link" aria-expanded="false"
							data-bs-toggle="dropdown" href="#">친환경 검색</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/search_image">사물 검색</a><a
									class="dropdown-item" href="/search_text">라벨 검색</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="/map"
							style="color: rgba(255, 255, 255, 0.55);">지도</a></li>
						<li class="nav-item dropdown"><a
							class="dropdown-toggle nav-link" aria-expanded="false"
							data-bs-toggle="dropdown" href="/board_main">친환경 서비스</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/eco_promote">친환경 홍보</a> <a
									class="dropdown-item" href="/NewFile">알림 설정</a> <a
									class="dropdown-item" href="/eco_calc">친환경 지수</a> <a
									class="dropdown-item" href="/qna">친환경 Q&A</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="dropdown-toggle nav-link" aria-expanded="false"
							data-bs-toggle="dropdown" href="/board_main">게시판</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/board_main">전체 게시판</a> <a
									class="dropdown-item" href="/board_main/1">정보 게시판</a><a
									class="dropdown-item" href="/board_main/2">나눔 게시판</a>
							</div></li>
					</ul>
					<form class="d-flex me-auto navbar-form" target="_self">
						<div class="d-flex align-items-center" style="visibility: hidden">
							<label class="form-label d-flex mb-0" for="search-field">
								<i class="fa fa-search" style="color: white; margin: 0px 10px;"></i>
							</label> <input class="form-control search-field" type="search"
								id="search-field" name="search"
								style="background: rgb(92, 198, 186); border-bottom: 2px solid white;">
						</div>
					</form>
					<c:catch>
						<c:choose>
							<c:when test="${empty userID }">
								<span class="navbar-text"> <a class="login"
									style="margin-right: 20px;" href="/main/login">Log In</a>
								</span>
								<a class="btn btn-light action-button" role="button"
									style="background: rgba(255, 255, 255, 0); border-style: none; color: rgb(255, 255, 255);"
									href="/signup">Sign Up</a>

							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${userID eq '1' }">
										<li>
											<p style="margin-right: 20px;">관리자 ${userID }님, 환영합니다.</p>
										</li>
										<a class="btn btn-light action-button" id="Board_Write"
											style="background: rgba(255, 255, 255, 0); border-style: none; color: rgb(255, 255, 255);"
											role="button" href="/board_main/board_write">글쓰기</a>
										<a class="btn btn-light action-button" id="logout_btn"
											style="background: rgba(255, 255, 255, 0); border-style: none; color: rgb(255, 255, 255);"
											role="button" href="/logout.do">Log Out</a>
									</c:when>
									<c:otherwise>
										<span class="navbar-text" style="margin-right: 20px;">
											<a href="/changepw">${userID}</a>님,반갑습니다!
										</span>
										<c:if test="${userID == list.get(MAX - showNum).board_userid }">
										<a class="btn btn-light action-button" id="Board_Write"
											style="background: rgba(255, 255, 255, 0); border-style: none; color: rgb(255, 255, 255);"
											role="button">글삭제</a>
										</c:if>
										<a class="btn btn-light action-button" id="logout_btn"
											style="background: rgba(255, 255, 255, 0); border-style: none; color: rgb(255, 255, 255);"
											role="button" href="/logout.do">Log Out</a>
										
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:catch>
				</div>
			</div>
		</nav>
		<div class="container hero">
			<div class="row">
				<div
					class="col-md-5 col-lg-5 offset-lg-1 offset-xl-0 d-none d-lg-block phone-holder">
					<div class="phone-mockup"></div>
				</div>
			</div>
		</div>
	</header>
	<div>
		<script type="text/javascript" src="scrollTop.js"></script>
		<div id="boardDetail">
			<div style="width: 100%; text-align: center;">
				<h2>${lists.get(MAX - showNum).eventNum} -> ${lists.get(MAX - showNum).eventTitle}</h2>
			</div>
			<hr>
			<div style="width: 100%; text-align: center;">
				<t> ${lists.get(MAX - showNum).eventContents} </t><br/>
				<t> ${lists.get(MAX - showNum).eventGoods} </t><br/>
				<t> <fmt:formatDate value="${lists.get(MAX - showNum).eventStart}" pattern="yyyy-MM-dd"/> </t><br/>
				<t> <fmt:formatDate value="${lists.get(MAX - showNum).eventEnd}" pattern="yyyy-MM-dd"/> </t><br/>
				<t> ${lists.get(MAX - showNum).eventOngoing} </t><br/>
				<t> ${lists.get(MAX - showNum).eventImageurl} </t><br/>
				<t> ${lists.get(MAX - showNum).eventEmotions} </t><br/>
			</div>
			<a id="back-to-top" href="#"
				class="btn btn-primary btn-lg back-to-top" role="button"
				title="Click to return on the top page" data-toggle="tooltip"
				data-placement="left"><span
				class="glyphicon glyphicon-chevron-up"></span></a>

		</div>
	</div>
	
 	<script type="text/javascript">
		$("#Board_Write").click( function() {
			if (confirm("게시물을 삭제하시겠습니까?")){
			var data = {
					board_num : ${showNum}
			}
			$.ajax({
				url: "/board_main/board_delete.do",
				type: "POST",
				data: data,
				success: function(val) {
					location.href = "/board_main";
				},
				error: function(){
					alert("fail");
				}
			});
			} else {
				
			}
		});
	</script>
	
<!-- 	<script id="dsq-count-scr" src="//bdd-2.disqus.com/count.js" async></script>
	<script>
		/**
		 *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
		 *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
	
		var disqus_config = function() {
			this.page.url = PAGE_URL; // Replace PAGE_URL with your page's canonical URL variable
			this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
		};
	
		(function() { // DON'T EDIT BELOW THIS LINE
			var d = document, s = d.createElement('script');
			s.src = 'https://bdd-2.disqus.com/embed.js';
			s.setAttribute('data-timestamp', +new Date());
			(d.head || d.body).appendChild(s);
		})();
	</script> 
	<noscript>
		Please enable JavaScript to view the <a
			href="https://disqus.com/?ref_noscript">comments powered by
			Disqus.</a>
	</noscript>-->
	<script src="../../resource/term/detail/assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>