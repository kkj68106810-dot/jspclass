package control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/MyPageUpdate.do")
public class MyPageUpdate extends HttpServlet {	
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);		
	}
	
	protected void reqPro (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		
		String id = request.getParameter("id");		
		
		String pass = request.getParameter("pass");
		String passChk = request.getParameter("passChk");
		
		if(!pass.equals(passChk)) {
			System.out.println("비밀번호가 틀리다.");
			response.sendRedirect("MyPage.do?result=passfail");
			return;
		}
		
		String[] arr = request.getParameterValues("hobby");
		String oneHobby = "";
		
		if(arr != null) {
			for(String str: arr) {
				oneHobby += str + " ";
			}	
		}		
		
		// MemberDTO 에 담는다.
		mdto.setId(id);
		mdto.setPass(pass);
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		mdto.setHobby(oneHobby);
		mdto.setJob(request.getParameter("job"));
		mdto.setAge(request.getParameter("age"));
		mdto.setInfo(request.getParameter("info"));
		
		
		mdao.updateMember(mdto);
		
		response.sendRedirect("MyPage.do?result=ok");
		
	}
}
