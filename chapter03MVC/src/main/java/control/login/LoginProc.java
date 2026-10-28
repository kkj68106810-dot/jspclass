package control.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;

@WebServlet("/loginProc.do")
public class LoginProc extends HttpServlet {
	
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);		
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		MemberDAO mdao = new MemberDAO();
		
		boolean loginChk = mdao.loginCheck(id, pass);
		
		if(loginChk) {
			HttpSession session = request.getSession();
			
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(60*30);
			response.sendRedirect("index.jsp");
		} else {
			// 로그인 실패
			request.setAttribute("msg", "아이디와 패스워드를 확인하세요.");
			RequestDispatcher rd = request.getRequestDispatcher("/login/loginErr.jsp");
			
		}
		
		
	}

}
