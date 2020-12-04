<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en" dir ="ltr">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://kit.fontawesome.com/a076d05399.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../css/chatbot2.css">
<link rel="stylesheet" href="../css/chatmove2.css">
	
<title>채팅방</title>

</head>
<body>

    <div class="container">
      
	  	<ul class="pagination">
			<li class="icon"><a href="chatmain.jsp"><span class="fas fa-angle-left"></span>이전</a></li>
			<li ><a href="chatbot.jsp">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li class="icon"><a href="#">다음<span class="fas fa-angle-right"></span></a></li>
			
		</ul>

	
	
    <div class="wrapper">
        <div class="title">Mentor chatbox</div>
        <div class="form">
            <div class="bot-inbox inbox">
                <div class="icon">
                    <i class="fas fa-user"></i>
                </div>
                <div class="msg-header">
                    <p>반가워요 저는 네이버 멘토 박이웃입니다. 궁금하신 것 있으면 언제든지 질문하세요 ~~:)</p>
                    <br>
                    <p>우선 간단한 자기소개 부탁드릴게요!</p>
                </div>
            </div>
        </div>
        <div class="typing-field">
            <div class="input-data">
                <input id="data" type="text" placeholder="메시지를 입력하세요" required>
                <button id="send-btn">전송</button>
            </div> 
        </div>   
    </div>
    
    
 </div>  
    <script>
        $(document).ready(function(){
            $("#send-btn").on("click", function(){
                $value = $("#data").val();
                $msg = '<div class="user-inbox inbox"><div class="msg-header"><p>'+ $value +'</p></div></div>';
                $(".form").append($msg);
                $("#data").val('');
                
                // start ajax code
                $.ajax({
                    url: 'message.php',
                    type: 'POST',
                    data: 'text='+$value,
                    success: function(result){
                        $replay = '<div class="bot-inbox inbox"><div class="icon"><i class="fas fa-user"></i></div><div class="msg-header"><p>'+ result +'</p></div></div>';
                        $(".form").append($replay);
                        // when chat goes down the scroll bar automatically comes to the bottom
                        $(".form").scrollTop($(".form")[0].scrollHeight);
                    }
                });
            });
        });
    </script>
    

    
</body>
</html>
