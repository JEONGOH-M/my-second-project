<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="bbs.Bbs" %>
    <%@ page import="bbs.BbsDAO" %>
    <% request.setCharacterEncoding("UTF-8"); %>
   
    
<!DOCTYPE html>
<html lang="ko" dir ="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/custom.css">
<title>커뮤니티</title>
</head>
<body>
<% 
	 String userID = null;
	 if(session.getAttribute("userID") != null) {
		 userID =(String) session.getAttribute("userID");
	 }
	 int bbsID =0;
	 if(request.getParameter("bbsID") != null) {
		 bbsID = Integer.parseInt(request.getParameter("bbsID"));
	 } 
	 if (bbsID == 0){
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("alert('유효하지 않은 글입니다.')");
		 script.println("location.href ='bbs.jsp'");
		 script.println("</script>");
	 }
	 Bbs bbs= new BbsDAO().getBbs(bbsID);
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
				<li class="active"><a href="http://localhost:8181/jsp_code/%EA%B0%9D%EC%B2%B4%EC%A7%80%ED%96%A5%ED%8C%80%ED%94%8C/community/bbs.jsp">자유게시판</a></li>
				<li><a href="http://localhost:8181/javajaba/chatmain.jsp">채팅방</a></li>
				<li><a href="http://localhost:8181/javajaba/study.jsp">스터디</a></li>
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
	<div class="container">
		<div class="row">
		  	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		  		<thead>
		  			<tr>
		  				<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기 </th>
		  				
		  			</tr>
		  		</thead>
		  		<tbody>
		  			<tr>
		  				<td style="width: 20%;">글 제목</td>
		  				<td colspan="2"><%= bbs.getBbsTitle() %></td>
		  			</tr>
		  			<tr>
		  				<td>작성자</td>
		  				<td colspan="2"><%= bbs.getUserID() %></td>
		  			</tr>
		  			<tr>
		  				<td>작성일자</td>
		  				<td colspan="2"><%=bbs.getBbsDate().substring(0, 11)+ bbs.getBbsDate().substring(11,13)+"시" + bbs.getBbsDate().substring(14, 16) +"분" %></td>
		  			</tr>
		  			<tr>
		  				<td>내용</td>
		  				<td colspan="2" style="min-height: 200px; text-align: Left"><%= bbs.getBbsContent() %></td>
		  			</tr>
		  			
		  		</tbody>
		  	</table>
		  	<a href ="bbs.jsp" class="btn btn-primary">목록</a>
		  	<% 
		  		if(userID != null && userID.equals(bbs.getUserID())) {
		  	%>
		  		<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>	
		  		<a href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">삭제</a>
		  	<%	
		  		}
		  	%>
		  	
		  	
		</div>
	</div>
	<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${result.code }" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>

<script>
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/addComment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/board/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].comment + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>
	 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	
	</body>
	</html>
	