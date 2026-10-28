package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/MyPage.do")
public class MyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);		
	}
	
	protected void reqPro (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String path = "";
		if(session != null) {
			String id = (String) session.getAttribute("id");
			MemberDAO mdao = new MemberDAO();
			MemberDTO mdto = mdao.getMember(id);
			System.out.println("hobby값 : " + mdto.getHobby());
			String[] hobbys = mdto.getHobby().split(" ");
			
			request.setAttribute("member", mdto);
			request.setAttribute("hobbys", hobbys);
			path = "index.jsp?section=/member/Mypage.jsp";
		} else {
			request.setAttribute("msg", "오류");
			path = "index.jsp";
			
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
		
	}
}
