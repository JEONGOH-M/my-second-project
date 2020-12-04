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
<link rel="stylesheet" href="../css/chatmain.css">


	
<title>채팅방</title>

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
			<a class="navbar-brand" href="http://localhost:8181/jsp_code/%EA%B0%9D%EC%B2%B4%EC%A7%80%ED%96%A5%ED%8C%80%ED%94%8C/html/index.html">멘토스</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">커뮤니티 메인</a></li>
				<li><a href="bbs.jsp">자유게시판</a></li>
				<li  class="active"><a href="chatmain.jsp">채팅방</a></li>
				<li><a href="study.jsp">스터디</a></li>
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
	<h1>SELECT YOUR CHAT</h1>
	<div class="border"></div>
	
	<div class="slider owl-carousel">
		<div class="card">
			<div class="img"><img src="../images/1.png" alt=""></div>
			<div class="content">
				<div class="title">홍삼성</div>
				<div class="sub-title">삼성전자 멘토</div>
				<p> 삼성전자 마케팅직무에 관심있으신 분들은 채팅방에서 함께 이야기 나눠요</p>
				<div class="btn">
					<button>참여하기</button>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="img"><img src="../images/2.png" alt=""></div>
			<div class="content">
				<div class="title">박이웃</div>
				<div class="sub-title">네이버 멘토</div>
				<p> 네이버에서 10년 이상 근무한 멘토에게 직접 질의응답을 할 수 있습니다. 들어오세요</p>
				<div class="btn">
					<button><a href="chatbot2.jsp">참여하기</a></button>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="img"><img src="../images/3.png" alt=""></div>
			<div class="content">
				<div class="title">김롯데</div>
				<div class="sub-title">롯데제과 멘토</div>
				<p> 롯데제과 제품개발 직무에 대한 모든 것을 알려드려요. 멘티분들의 질문은 언제나 환영입니다.</p>
				<div class="btn">
					<button><a href="chatbot.jsp">참여하기</a></button>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="img"><img src="../images/8.png" alt=""></div>
			<div class="content">
				<div class="title">이엘지</div>
				<div class="sub-title">LG 멘토</div>
				<p> LG IT직무에 대한 모든 것을 알려드려요. 멘티분들의 질문은 언제나 환영입니다.</p>
				<div class="btn">
					<button>참여하기</button>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="img"><img src="../images/5.png" alt=""></div>
			<div class="content">
				<div class="title">박멘토</div>
				<div class="sub-title">현대자동차 멘토</div>
				<p>  현대자동차 엔지니어직무에 대한 모든 것을 알려드려요. 멘티분들의 질문은 언제나 환영입니다.</p>
				<div class="btn">
					<button>참여하기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(".slider").owlCarousel({
			loop: true,
			autoplay: true,
			autoplayTimeout: 2000,
			autoplayHoverpause: true,
			
		});
		
	</script>
</div>

</body>
</html>