<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- CSS STYLE -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/jobinfo.css">
    <script src="https://kit.fontawesome.com/ee207e1a20.js" crossorigin="anonymous"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
    </style>

</head>
<body>
   <div id="wrap">
        <!-- header -->
        <div id="active_header">
            <div class="header">
                <nav class="navbar">
                    <div class="navbar_logo">
                        <i class="fas fa-user-graduate"></i>
                        <a href="index.html">MENTOS</a>
                    </div>

                    <ul class="navbar_menu">
                        <li><a href="">공지사항</a></li>
                        <li><a href="">커뮤니티</a></li>
                        <li><a href="">진로상담</a></li>
                        <li><a href="">전공질문</a></li>
                        <li><a href="">스터디</a></li>
                    </ul>


                    <ul class="navbar_myinfo">
                        <li><a href="">회원가입</a></li>
                        <li><a href="">로 그 인</a></li>
                        <li><a href="">마이페이지</a></li>
                    </ul>

                    <a href="#" class="navbar_togleBtn">
                        <i class="fas fa-bars"></i>
                    </a>
                </nav>
            </div>
        </div>
        <!-- //header -->
        <div id="header">
            <div class="header-menu">
                <a href="">Designer</a>
                <a href="">Publisher</a>
            </div>
            <div class="header-tit">
                <h1>mentos in myongji</h1><br>
                <h3>www.mentos.com</h3>
            </div>
            <!-- //헤더 타이틀 -->
            <div class="header-icon">
                <a href="#" class="icon1"><span class="ir_pm">icon1</span></a>
                <a href="#" class="icon2"><span class="ir_pm">icon2</span></a>
                <a href="#" class="icon3"><span class="ir_pm">icon3</span></a>
                <a href="#" class="icon4"><span class="ir_pm">icon4</span></a>
            </div>
            <!--//헤더 아이콘-->
        </div>
        <!-- //header -->

        <div id="contents" style=height:5000px;>
            <div id="cont_nav">
                <div class="container">
                    <h2 class="ir_su">전체 메뉴</h2>
                    <div class="list-container">
                        <div class="list">
                            <h3>이용 안내</h3>
                            <ol>
                                <li><a href="">공지사항</a></li>
                                <li><a href="">개인정보</a></li>
                            </ol>
                        </div>
                        <div class="list">
                            <h3>커뮤니티</h3>
                            <ol>
                                <li><a href="">자유게시판</a></li>
                                <li><a href="">학회 홍보</a></li>
                                <li><a href="">자유 채팅</a></li>
                            </ol>
                        </div>
                        <div class="list">
                            <h3>진로취업</h3>
                            <ol>
                                <li><a href="gettingJob.html" target="blank">취업정보</a></li>
                                <li><a href="">MIS로드맵</a></li>
                            </ol>
                        </div>
                        <div class="list">
                            <h3>이벤트&포인트</h3>
                            <ol>
                                <li><a href="">기프티콘 교환</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //cont_nav -->
            <div id="cont-tit">
                <div class="container">
                    <div class="tit">
                        <h2>"나는 멘토다"</h2>
                        <a href="" class='btn'><span class="ir_pm">전체메뉴</span></a>
                    </div>
                </div>
            </div>
            
            
            
            <div class="tab_menu" style="width:80%; margin-left:10%; height:90%; margin-top:20px;">
                                <h4 class="ir_su">공지사항</h4>
                                <ul>
                                    <li class="active"><a href="#">ERP 취업정보</a>
                                        <ul style=width:100%;>
                                            <%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try{
	Class.forName("org.MySQL_code.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentos?useSSL=false", "root", "@gh14041404");
	
	stmt = con.createStatement();
	String sql = "select * from erp_info";
	rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		out.print("<table>");
		do{
			out.print("<tr>");
			out.print("<td>"+rs.getString("INFO_NUM")+"</td>");
			out.print("<td>"+rs.getString("TITLE")+"</td>");
			out.print("<td>"+rs.getString("BODY")+"</td>");
			out.print("<td>"+rs.getString("QUALIFICATION")+"</td>");
			out.print("</tr>");
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
                                        </ul>
                                    </li>
                                    </li>
                                    <li><a href="#">빅데이터 취업정보</a>
                                        <ul style=width:100%;>
                                               <%
                                       
try{
	Class.forName("org.MySQL_code.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentos?useSSL=false", "root", "@gh14041404");
	
	stmt = con.createStatement();
	String sql = "select * from bigdata_info";
	rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		out.print("<table>");
		do{
			out.print("<tr>");
			out.print("<td>"+rs.getString("INFO_NUM")+"</td>");
			out.print("<td>"+rs.getString("TITLE")+"</td>");
			out.print("<td>"+rs.getString("BODY")+"</td>");
			out.print("<td>"+rs.getString("QUALIFICATION")+"</td>");
			out.print("</tr>");
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
                                        </ul>
                                    </li>
                                    <li><a href="#">웹개발 취업정보</a>
                                       <ul style=width:100%;>
                                               <%
                                       
try{
	Class.forName("org.MySQL_code.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentos?useSSL=false", "root", "@gh14041404");
	
	stmt = con.createStatement();
	String sql = "select * from frontend_info";
	rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		out.print("<table>");
		do{
			out.print("<tr>");
			out.print("<td>"+rs.getString("INFO_NUM")+"</td>");
			out.print("<td>"+rs.getString("TITLE")+"</td>");
			out.print("<td>"+rs.getString("BODY")+"</td>");
			out.print("<td>"+rs.getString("QUALIFICATION")+"</td>");
			out.print("</tr>");
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
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            
                            
            <!-- //cont_tit -->

            <div id="footer">
                <div class="container">
                    <h2 class="ir_su">푸터 영역</h2>
                    <div class="footer">
                        <ul>
                            <li><a href="#"><strong>[자바잡아조]</strong></a></li>
                            <li><a href="#">김동현</a></li>
                            <li><a href="#">민정오</a></li>
                            <li><a href="#">박연희</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- //footer -->
        </div>
        <!-- //wrap -->
        <script src="js/main.js" defer></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/toggleBtn.js"></script>
        <!-- <script src="slick.min.js"></script> -->
        <script src="js/slick.js"></script>
        <script type="text/javascript">
            // 탭매뉴
            const $tab_list = $(".tab_menu");
            $tab_list.find("ul ul").hide();
            $tab_list.find("li.active > ul").show();

            function tabMenu(e) {
                e.preventDefault();
                const $this = $(this);

                $this.next("ul").show().parent("li").addClass("active").siblings("li").removeClass("active").find(">ul")
                    .hide();
            }
            $tab_list.find("ul>li>a").click(tabMenu).focus(tabMenu);

            // 배너
            $(".ban").slick({
                infinite: true,
                slidesToShow: 3,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 1000,
                dots: true
            })
        </script>
</body>
</html>