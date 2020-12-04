<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://kit.fontawesome.com/a076d05399.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../css/chat.css">
	<title>채팅방</title>
	
</head>
<body>
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
			<a class="navbar-brand" href="../index.html.jsp">멘토스</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">커뮤니티 메인</a></li>
				<li><a href="bbs.jsp">자유게시판</a></li>
				<li  class="active"><a href="chat.jsp">채팅방</a></li>
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
	
	<h1>Your Chatting Area</h1>
	<div class="border"></div>
	
	<div class="chatbox">
		<div class ="chatlogs">
		
			<div class ="chat friend">
				<div class="user-photo"><img src="../images/pro.jpg"></div>
				<p class="chat-message">안녕하세요</p>
			</div>
			
			<div class ="chat self">
				<div class="user-photo"><img src="../images/profile.jpeg"></div>
				<p class="chat-message2">반가워요. 저는 이번에 새로 멘티가 된 000입니다. 잘부탁드려요</p>
			</div>
			
			<div class ="chat mento">
				<div class="user-photo"><img src="../images/sam.png"></div>
				<p class="chat-message">안녕하세요. 여러분들의 멘토 홍삼성이라고 합니다. 앞으로 잘 부탁드립니다.
				<br> 앞으로 저희가 수행할 목록은
				<br>-
				<br>-
				<br>-
				<br>-
				<br>-
				<br>-
				<br>-
				<br>-
				<br> 입니다.
				</p>
			</div>
			
				
		</div>
		
		
		<div class="chat-form">
				<textarea id="chatContent" class="form-control" placeholder="메시지를 입력하세요" maxlength="100"></textarea>
			
			<div class="btn">
					<button>전송</button>
			</div>
		</div>
		</div>
		
		</div>
		
	
		
	

</body>
</html>