<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en" dir ="ltr">
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/study.css">

	<title>스터디</title>
</head>
<body style="background: #f2f2f2">
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	
	%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					
			</button>
			<a class="navbar-brand" href="../index.html">멘토스</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.isp">커뮤니티 메인</a></li>
				<li><a href="bbs.jsp">자유게시판</a></li>
				<li><a href="chatmain.jsp">채팅방</a></li>
				<li class="active"><a href="study.jsp">스터디</a></li>
			</ul>
			<% 
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../login.jsp">로그인</a></li>
						<li><a href="../join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">로그아웃하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="gallery-section">
			
			<div class="inner-width">
			<h1>Select Your Study</h1>
			<div class="border"></div>
			<div class="gallery">
			
			
				<a href="images/study1.jpeg" class="image">
					<img src="../images/study1.jpeg" alt="">
					
				</a>
			
				<a href="images/study2.jpg" class="image">
					<img src="../images/study2.jpg" alt="">
				
				</a>
			
				<a href="images/study3.jpeg" class="image">
					<img src="../images/study3.jpeg" alt="">
					
				</a>
			
				<a href="images/study4.jpg" class="image">
					<img src="../images/study4.jpg" alt="">
					
				</a>
				
				<a href="images/study5.jpg" class="image">
					<img src="../images/study5.jpg" alt="">
					
				</a>
					
				<a href="images/study6.jpeg" class="image">
					<img src="../images/study6.jpeg" alt="">
					
				</a>
			
			
				<a href="images/study7.jpg" class="image">
					<img src="../images/study7.jpg" alt="">
					
				</a>
				
				<a href="study2.jsp" class="image">
					<img src="../images/study8.png" alt="">
					
				</a>
			
			
			</div>
		</div>
	</div>
	
</body>
</html>