
<%@page import="com.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>

	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Poppins:300,400,500,600,700|PT+Serif:400,400i&display=swap" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="style.css" type="text/css" />
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="css/custom.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>index_status_logout</title>

</head>

<body class="stretched has-plugin-easing has-plugin-bootstrap has-plugin-html5video device-xs">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<header id="header" class="transparent-header dark">
			<div id="header-wrap">
				<div class="container">
					<div class="header-row">

						<!-- Logo
						============================================= -->
						<div id="logo">
							<a href="index.jsp" class="standard-logo" data-dark-logo="images/neulbo_logo.png"><img src="images/neulbo_logo.png" alt="Canvas Logo"></a>
							<a href="index.jsp" class="retina-logo" data-dark-logo="images/neulbo_logo.png"><img src="images/neulbo_logo.png" alt="Canvas Logo"></a>
						</div><!-- #logo end -->

						<div class="header-misc">

							<!-- Top Search
							============================================= -->
							<div id="top-search" class="header-misc-icon">
								<a href="#" id="top-search-trigger"><i class="icon-line-search"></i><i class="icon-line-cross"></i></a>
							</div><!-- #top-search end -->

							<!-- Top Cart
							============================================= -->
							<div id="top-cart" class="header-misc-icon d-none d-sm-block">
								
							</div><!-- #top-cart end -->

						</div>

						<div id="primary-menu-trigger">
							<svg class="svg-trigger" viewBox="0 0 100 100"><path d="m 30,33 h 40 c 3.722839,0 7.5,3.126468 7.5,8.578427 0,5.451959 -2.727029,8.421573 -7.5,8.421573 h -20"></path><path d="m 30,50 h 40"></path><path d="m 70,67 h -40 c 0,0 -7.5,-0.802118 -7.5,-8.365747 0,-7.563629 7.5,-8.634253 7.5,-8.634253 h 20"></path></svg>
						</div>

						<!-- Primary Navigation
						============================================= -->
						<nav class="primary-menu">

							<ul class="menu-container">
								<li class="menu-item">
									<a class="menu-link" href="videoMain.jsp"><div><i class="icon-camera3"></i>영화 검색</div></a>
									
								</li>
								<li class="menu-item">
									<a class="menu-link" href="party_post_main.jsp"><div><i class="icon-edit"></i>늘보더치</div></a>
									
								</li>
								<li class="menu-item">
									<a class="menu-link" href="post_main.jsp"><div><i class="icon-list-alt"></i>자유게시판</div></a>
									
								</li>
						<% 
							MemberDTO info = (MemberDTO)session.getAttribute("info");
						
							if(info==null){									%>
							
								<li class="menu-item">
									<a class="menu-link" href="login_join.jsp"><div><i class="icon-user4"></i>회원 가입</div></a>
									
								</li>
								<li class="menu-item">
									<a class="menu-link" href="login_join.jsp"><div>로그인</div></a>
									
								</li>
							
						
								
						<% 	}else{ 													%>
						
								<li class="menu-item">
									<a class="menu-link" href="profile.jsp"><div><i class="icon-user4"></i>마이페이지</div></a>
									
								</li>
								<li class="menu-item">
									<a class="menu-link" href="LogoutService"><div>로그아웃</div></a>
									
								</li>
							
						<%
							}
						%>
						</ul>

						</nav><!-- #primary-menu end -->
						

						<form class="top-search-form" action="videoSearchResult.jsp" method="get">
							<input type="text" name="title" class="form-control" value="" placeholder="Type &amp; Hit Enter.." autocomplete="off">
						</form>

					</div>
				</div>
			</div>
			<div class="header-wrap-clone"></div>
		</header><!-- #header end -->

		<section id="slider" class="slider-element min-vh-60 min-vh-md-100 dark error404-wrap include-header">
			<div class="slider-inner">

				<div class="vertical-middle">
					<div class="container text-center py-5 py-md-0">

						<div class="error404">늘보</div>

						<div class="heading-block border-bottom-0">
							<h4>처럼 늘 보고 싶은 사람들의 모임</h4>
							<span>지금 바로 영화 정보를 검색하세요!</span>
						</div>

						<form action="videoSearchResult.jsp" method="get" class="mx-auto mb-0">
							<div class="input-group input-group-lg">
								<input type="text" name="title" class="form-control" placeholder="Search for Pages...">
								<button class="btn btn-danger" type="submit"><i class="icon-line-search"></i></button>
							</div>
						</form>

					</div>
				</div>

				<div class="video-wrap">
					<video poster="images/videos/explore-poster.jpg" preload="auto" loop autoplay muted>
						<source src='images/videos/explore.mp4' type='video/mp4' />
						<source src='images/videos/explore.webm' type='video/webm' />
					</video>
					<div class="video-overlay" style="background-color: rgba(0,0,0,0.3);"></div>
				</div>

			</div>
		</section>

		<!-- Footer
		============================================= -->
		<footer id="footer" class="dark">
			
		<!-- Footer Widgets
			============================================= -->
			<div class="footer-widgets-wrap" style="padding: 30px 0; background-color: #202020;">

			</div><!-- .footer-widgets-wrap end -->
			<!-- Copyrights
			============================================= -->
			<div id="copyrights">
				<div class="container">
					<div class="row col-mb-30">

						<div class="col-md-6 text-center text-md-start">
							Copyrights &copy; 2023 All Rights Reserved by Neulbo Inc.<br>
							<div class="copyright-links"><a href="https://gj-aischool.or.kr/">광주 인공지능사관학교</a></div>
						</div>

						<div class="col-md-6 text-center text-md-end">
							<div class="d-flex justify-content-center justify-content-md-end">
								<a href="https://ko-kr.facebook.com/" class="social-icon si-small si-borderless si-facebook">
									<i class="icon-facebook"></i>
									<i class="icon-facebook"></i>
								</a>

								<a href="https://twitter.com/?lang=ko" class="social-icon si-small si-borderless si-twitter">
									<i class="icon-twitter"></i>
									<i class="icon-twitter"></i>
								</a>

								<a href="https://github.com/" class="social-icon si-small si-borderless si-github">
									<i class="icon-github"></i>
									<i class="icon-github"></i>
								</a>
								
							</div>

							<div class="clear"></div>

							<i class="icon-envelope2"></i> kam_ta_yon@naver.com <span class="middot">&middot;</span> <i class="icon-headphones"></i> 010-2838-5405 <span class="middot">&middot;</span> <i class="icon-skype2"></i> NeouboCampany
						</div>

					</div>

				</div>
			</div><!-- #copyrights end -->
		</footer><!-- #footer end -->

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- JavaScripts
	============================================= -->
	<script src="js/jquery.js"></script>
	<script src="js/plugins.min.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="js/functions.js"></script>


</body>
</html>