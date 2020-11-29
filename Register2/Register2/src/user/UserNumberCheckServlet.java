package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserNumberCheckServlet")
//서블릿 같은 경우는 HttpServlet을 상속 받아야 함
public class UserNumberCheckServlet extends HttpServlet {
	
	private static final long serialVersionUID =1L;
	//doPost: 사용자가 post한 것을 처리하는 방식
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		String userNumber = request.getParameter("userNumber"); //사용자가 입력한 학번을 저장
		System.out.println(userNumber);
		response.getWriter().write(new userDAO().userNumberCheck(userNumber) + ""); //변수를 클라이언트에 출력해서 보여줌
	}
}
