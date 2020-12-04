<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="bbs.BbsDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import = "java.util.*"%>
	<%@ page import = "java.sql.*"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
   	<jsp:setProperty name="bbs" property="bbsTitle" />
   	<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/reset.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');

body{position:relative;}
table{width:800px; height:400px; margin-left:10%; position:absolute; top:150px; left:20%; font-size:20px; text-align:let; line-height: 1.5; border-collapse:collapse;}
.profile{width:100%; height:1000px; background:#f6fdff; }
.profile-container{width:100%; height:700px; background:#dceff7; item-align:center; padding-top:100px;} 
.profile-container img, h1{margin-left:10%;} 
thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #369;
  border-bottom: 3px solid #036;
}
tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}

  
 </style>
 <script src="https://kit.fontawesome.com/ee207e1a20.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID =(String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
<div id="active_header">
            <div class="header">
                <nav class="navbar">
                    <div class="navbar_logo">
                        <i class="fas fa-user-graduate"></i>
                        <a href="index.html">MENTOS</a>
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

                    <a href="#" class="navbar_togleBtn">
                        <i class="fas fa-bars"></i>
                    </a>
                </nav>
            </div>
        </div>
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

	<div class="profile">
		<div class="profile-container">
			<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTJfGDTfkROk5DNFLb6aOAsYOzozBVjnMtbw&usqp=CAU" alt="프로필">
			<h1 style="font-size:20px; margin-top:15px;">안녕하세요 <%out.print(userID);%>님</h1>
			<div class="user-info">
				<%	
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try{
			Class.forName("org.MySQL_code.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentos?useSSL=false", "root", "1234");
			
			stmt = con.createStatement();
			String sql = "select * from user where userID=userID";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				out.print("<table>");
				do{
					out.print("<thead>");
					out.print("<tr>");
					out.print("<th colspan=2>");
					out.print("사용자 정보");
					out.print("</th>");
					out.print("</tr>");
					out.print("</thead>");
					
					out.print("<tbody>");
					out.print("<tr>");
					out.print("<td>유저 ID</td>");
					out.print("<td>"+rs.getString("userID")+"</td>");
					out.print("</tr>");
					
					out.print("<tr>");
					out.print("<td>유저 PW</td>");
					out.print("<td>"+rs.getString("userPassword")+"</td>");
					out.print("</tr>");
					
					out.print("<tr>");
					out.print("<td>유저 이름</td>");
					out.print("<td>"+rs.getString("userName")+"</td>");
					out.print("</tr>");
					
					out.print("<tr>");
					out.print("<td>유저 학번</td>");
					out.print("<td>"+rs.getString("userNumber")+"</td>");
					out.print("</tr>");
					
					out.print("<tr>");
					out.print("<td>유저 나이</td>");
					out.print("<td>"+rs.getString("userAge")+"</td>");
					out.print("</tr>");
					
					out.print("<tr>");
					out.print("<td>유저 성별</td>");
					out.print("<td>"+rs.getString("userGender")+"</td>");
					out.print("</tr>");
					
					out.print("<tr>");
					out.print("<td>유저 Email</td>");
					out.print("<td>"+rs.getString("userEmail")+"</td>");
					
					out.print("<tr>");
					out.print("<td>누적 포인트</td>");
					out.print("<td>"+rs.getString("userPoint")+"</td>");
					out.print("</tr>");
					out.print("</tbody>");
					
				}while(rs.next());
			} else{
				out.print("결과가 없습니다.");
			}
			out.print("</table>");
			System.out.println("성공");
			
			con.close();
			
		} catch(SQLException e1){
			out.print(e1);
			System.out.println("실패");
		} catch(Exception e){
			out.print(e);
		}
		
	%>
			</div>
		</div>
	</div>

</body>
</html>