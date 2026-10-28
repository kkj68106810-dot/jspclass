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
		
		mdto.setId(id);
		
		
		String pass = request.getParameter("pass");
		String passChk = request.getParameter("passChk");
		mdto.setPass(pass);
		
//		mdto.setPasschk(passChk);
		mdto.setTel(request.getParameter("tel"));
		mdto.setAge(request.getParameter("age"));
		mdto.setEmail(request.getParameter("email"));
		
		// hobby는 체크박스이므로 동시에 여러개가 선택되어 저장되도록 코드작성해야함
//		String[] hobbyArr = request.getParameterValues("hobby");
//		String hobbyStr = "";
//		for(String str : hobbyArr) {
//			System.out.println("hobby" + str);
//			hobbyStr += str + " ";
//		};
//		
		
//		System.out.println("hobbyStr" + hobbyStr);
//		mdto.setHobby(hobbyStr);

		mdto.setInfo(request.getParameter("info"));
		mdto.setJob(request.getParameter("job"));
		
		if(pass.equals(passChk)) {
			int resultNum = mdao.updateMember(mdto);
			System.out.println(resultNum);
			
			response.sendRedirect("index.jsp?section=member/Mypage.jsp");
			return;
		} 
		RequestDispatcher rd = request.getRequestDispatcher("member/updateErr.jsp");
		rd.forward(request, response);
		
	}
}
