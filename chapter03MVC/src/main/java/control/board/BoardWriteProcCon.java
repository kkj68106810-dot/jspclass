package control.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.board.BoardDAO;
import model.board.BoardDTO;

@WebServlet("/BoardWriteProcCon.do")
public class BoardWriteProcCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);		
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		BoardDAO bdao = new BoardDAO();
		
		String loginId = (String) session.getAttribute("id");		

//		if(loginId == null) {
//			response.setContentType("text/html: charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('로그인이 필요합니다.')");
//			out.println("location.href='index.jsp?section=login/loginForm.jsp'");
//			out.println("<script>");			
//		}
		String currentDate = LocalDate.now().toString();
		
		
		BoardDTO bdto = new BoardDTO();
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String content = request.getParameter("content");		
		bdto.setId(loginId);
		bdto.setWriter(writer);
		bdto.setSubject(subject);
		bdto.setEmail(email);
		bdto.setPassword(password);
		bdto.setContent(content);
		bdto.setReg_date(currentDate);
		bdao.insertBoard(bdto);
		
		response.sendRedirect("BoardListCon.do");
	}

}
