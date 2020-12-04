<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width = device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/login.css">
<title>JSP 회원가입</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="객체지향팀플/html/js/bootstrap.js"></script>
<script type="text/javascript"> // 중복체크 버튼 누를시 AJAX를 이용해 특정 서블릿으로 요청을 보내고 결과를 반환시켜줌
function registerCheckFunction(){
    var userID = $('#userID').val(); // 입력된 userID의 값을 가져옴
    $.ajax({ //ajax함수는 jquery안에 포함되어 있음
       type: 'POST',
       url: './UserRegisterCheckServlet', //입력한 ID 값을 보내는 주소
       data: {userID: userID}, //앞의 UserID는 변수(DB) 값, 뒤의 UserID는 입력 값
       success: function(result){
          if(result == 1){ //중복체크 결과창 설정
             $('#checkMessage').html('사용할 수 있는 아이디입니다.');
             $('#checkType').attr('class', 'modal-content pannel-success');
          }
          else{
             $('#checkMessage').html('이미 사용되고 있는 아이디입니다.');
             $('#checkType').attr('class', 'modal-content pannel-warning');
          }
          $('#checkModal').modal("show"); //checkModal을 함수를 이용해 실행시켜줌
       }
    })
 }
</script>
<script type="text/javascript">
function userNumberCheckFunction(){
    var userNumber = $('#userNumber').val(); // 입력된 userID의 값을 가져옴
    $.ajax({ //ajax함수는 jquery안에 포함되어 있음
       type: 'POST',
       url: './UserNumberCheckServlet', //입력한 ID 값을 보내는 주소
       data: {userNumber: userNumber}, //앞의 UserID는 변수(DB) 값, 뒤의 UserID는 입력 값
       success: function(result){
          if(result == 0){ //중복체크 결과창 설정
             $('#checkMessage').html('학번 인증이 완료되었습니다.');
             $('#checkType').attr('class', 'modal-content pannel-success');
          }
          else{
             $('#checkMessage').html('학번 인증에 실패했습니다.');
             $('#checkType').attr('class', 'modal-content pannel-warning');
          }
          $('#checkModal').modal("show"); //checkModal을 함수를 이용해 실행시켜줌
       }
    })
 }
</script>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					
			</button>
			<a class="navbar-brand" href="index.html">멘토스</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="community/main.jsp">커뮤니티 메인</a></li>
				<li><a href="community/bbs.jsp">자유게시판</a></li>
				<li><a href="community/chatmain.jsp">채팅방</a></li>
				<li><a href="community/study.jsp">스터디</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="login.jsp" class="dropdown-toggle">로그인<span></span></a>
				</li>
			</ul>

		</div>
	</nav>


   <div class="center" style="width:70%;">
      <form method="post" action="./userRegister">
         <table class="table table-bordered table-hover"
            style="text-align: center; border: 1px solid #3498db; border-top:none;">
            <thead>
               <tr>
                  <th colspan="3"><h1>Welcome MENTOS</h1></th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td style="width: 110px;"><h5>아이디</h5></td>
                  <td><input class="form-control" type="text" id="userID"
                     name="userID" maxLength="20" placeholder="아이디를 입력해주세요."></td>
                  <td style="width: 110px"><button class="btn btn-primary"
                        onclick='registerCheckFunction();' type="button">중복체크</button></td>
               </tr>
               <tr>
                  <td style="width: 110px;"><h5>비밀번호</h5></td>
                  <td colspan="2"><input class="form-control" type="password"
                     id="userPassword1" name="userPassword1" maxLength="20"
                     placeholder="비밀번호를 입력해주세요."></td>
               </tr>
               <tr>
                  <td style="width: 110px;"><h5>비밀번호 확인</h5></td>
                  <td colspan="2"><input class="form-control" type="password"
                     id="userPassword2" name="userPassword2" maxLength="20"
                     placeholder="비밀번호를 입력해주세요."></td>
               </tr>
               <tr>
                  <td style="width: 110px;"><h5>이름</h5></td>
                  <td colspan="2"><input class="form-control" type="text"
                     id="userName" name="userName" maxLength="20"
                     placeholder="이름을 입력해주세요."></td>
               </tr>
               <tr>
                  <td style="width: 110px;"><h5>학번</h5></td>
                  <td><input class="form-control" type="text" id="userNumber"
                     name="userNumber" maxLength="20" placeholder="학번을 입력해주세요."></td>
                  <td style="width: 110px"><button class="btn btn-primary"
                        onclick='userNumberCheckFunction();' type="button">학번 인증</button></td>
                     
               </tr>
               <tr>
                  <td style="width: 110px;"><h5>나이</h5></td>
                  <td colspan="2"><input class="form-control" type="text"
                     id="userAge" name="userAge" maxLength="20"
                     placeholder="나이를 입력해주세요."></td>
               </tr>
               <tr>
                  <td style="width: 110px;"><h5>성별</h5></td>
                  <td colspan="2">
                     <div class="form-group" style="text-align: center;">
                        <div class="btn-group" data-toggle="buttons">
                           <label class="btn btn-primary active"> <input
                              type="radio" name="userGender" autocomplete="off" value="남자"
                              checked>남자
                           </label> <label class="btn btn-primary"> <input type="radio"
                              name="userGender" autocomplete="off" value="여자" checked>여자
                           </label>
                        </div>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td style="width: 110px;"><h5>이메일</h5></td>
                  <td colspan="2"><input class="form-control" type="email"
                     id="userEamil" name="userEmail" maxLength="20"
                     placeholder="이메일을 입력해주세요."></td>
               </tr>
               <tr>
                  <td style="text-align: left" colspan="4">
                  <input class="btn btn-primary pull-right" type="submit" value="회원가입"></td>
                  <!-- 내용 전송으로 회원가입 가능하게함-->
               </tr>
            </tbody>
         </table>
      </form>
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
   <div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
      aria-hidden="true">
      <div class="vertical-alignment-helper">
         <div class="modal-dialog vertical-align-center">
            <!-- 알림창 중간에 위치시킴 -->

            <div class="modal-content"
               <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success");%>>
               <div class="modal-header panel-heading">
                  <button type="button" class="close" data-dismiss="modal">
                     <!-- 버튼을 눌렀을 때 모달 창 꺼짐 -->
                     <span aria-hidden="true">&times;</span>
                     <!--종료 버튼-->
                     <span class="sr-only">Close </span>
                  </button>
                  <h4 class="modal-title">
                     <%= messageType %>
                  </h4>
               </div>
               <div class="modal-body">
                  <!-- 메세지 내용 -->
                  <%= messageContent %>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                  <!-- 모달창 종료 명시적인 팝업창 내리기 버튼 -->
               </div>
            </div>
         </div>
      </div>
   </div>

   <script>
            $('#messageModal').modal("show");<!-- messageModal을 실행시켜줌 -->
   </script>

   <%
            session.removeAttribute("messageContent");
            session.removeAttribute("messageType");
            //한번 메세지가 출력된 이후로는 다시 나오지 않도록 세션 제거
               }
     %>
   <!-- 회원가입 페이지에서 비밀번호가 틀리거나, 입력값을 입력하지 않았을 경우의 팝업창 -->
   <div class="modal fade" id="checkModal" tabindex="-1" role="dialog"
      aria-hidden="true">
      <div class="vertical-alignment-helper">
         <div class="modal-dialog vertical-align-center">
            <!-- 알림창 중간에 위치시킴 -->
            <div id="checkType" class="modal-content panel-info">
               <!-- checkType은 위에서 실시간으로 결과에 따라서 성공/실패 클래스 출력 동적으로 바꿔짐   -->
               <div class="modal-header panel-heading">
                  <button type="button" class="close" data-dismiss="modal">
                     <!-- 버튼을 눌렀을 때 모달 창 꺼짐 -->
                     <span aria-hidden="true">&times;</span>
                     <!--종료 버튼-->
                     <span class="sr-only">Close </span>
                  </button>
                  <h4 class="modal-title">확인 메시지</h4>
               </div>
               <div class="modal-body" id="checkMessage"></div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                  
                  <!-- 모달창 종료 명시적인 팝업창 내리기 버튼 -->
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>