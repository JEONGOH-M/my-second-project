<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<title></title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/reset.css">
<script src="https://kit.fontawesome.com/ee207e1a20.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width = device-width, initial-scale=1">


<title>마이 페이지</title>
</head>
<body>

	<div id="active_header">
		<div class="header">
			<nav class="navbar">
				<div class="navbar_logo">
					<i class="fas fa-user-graduate"></i> <a href="index.html">MENTOS</a>
				</div>
				<ul class="navbar_menu">
					<li><a href="">공지사항</a></li>
					<li><a href="../community/index.jsp">커뮤니티</a></li>
					<li><a href="../community/bbs.jsp">자유게시판</a></li>
					<li><a href="../community/study.jsp">스터디</a></li>
				</ul>
				<ul class="navbar_myinfo">
					<li><a href="../../join.jsp">회원가입</a></li>
					<!-- <li><a href="../../login.jsp">로 그 인</a></li> -->
					<li><a href="mypage.jsp">마이페이지</a></li>
				</ul>

				<a href="#" class="navbar_togleBtn"> <i class="fas fa-bars"></i>
				</a>
			</nav>
		</div>
	</div>

	<div class="box1">
		<form method="post" action="./userRegister">
			<table class="table table-bordered table-hover"
				style="text-align: center; border: 1px solid #3498db">
				<thead>
					<tr>
						<th colspan="3"><h4>선물교환</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>허니콤보 세트</h5></td>
						
						<td style="width: 110px"><button class="btn btn-primary"
								onclick='change1();' type="button">교환하기</button></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>베스킨라빈스</h5></td>
						<td style="width: 110px"><button class="btn btn-primary"
								onclick='change2();' type="button">교환하기</button></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>스타벅스</h5></td>
						<td style="width: 110px"><button class="btn btn-primary"
								onclick='change3();' type="button">교환하기</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div class="gift_img">
		<div class="notice_hover_gift">
			<h4>기프티콘 TOP3</h4>
			<ul>
				<li><a> <span><img
							src="https://t1.daumcdn.net/cfile/tistory/99E133445C982CEB1F"
							></span> <strong>허니콤보 세트</strong>
				</a></li>
				<li><a> <span><img
							src="data:image/jpeg;base64,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"
							></span> <strong>베스킨라빈스</strong>
				</a></li>
				<li class="job_info1"><a><span><img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7_Pec-CJGq-39WsFg7N9LvVJhafnL6PdxIw&usqp=CAU"
							></span> <strong>스타벅스</strong>
				</a></li>
			</ul>
		</div>
	</div>

	<%
      String messageContent = null;
      if(session.getAttribute("messageContent") != null) { //현재 세션값이 들어와 있다면 세션 아이디가 messageContent인게 존재하는지 확인
         messageContent = (String) session.getAttribute("messageContent"); //오류 메세지가 건너 왔으면 인덱스 페이지의 messageContent안에 담김
      }
      String messageType = null;
      if(session.getAttribute("messageType") != null) { 
         messageType = (String) session.getAttribute("messageType");
      }
      
      if(messageContent != null){ //메세지가 서버로 부터 도착했을 경우
   %>

	<%
            session.removeAttribute("messageContent");
            session.removeAttribute("messageType");
            //한번 메세지가 출력된 이후로는 다시 나오지 않도록 세션 제거
               }
     %>
<script type="text/javascript">
function change1(){
	
	if(result3 >= 1)
		alert("안녕");
	else
		alert("못해");
}
function change2(){
	alert(result3);
}

function change3(){
	alert("안녕");
}
</script>
</body>
</html>