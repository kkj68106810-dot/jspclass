package control.member;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		reqPro(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO mdao = new MemberDAO();
		
		ArrayList<MemberDTO> mList = mdao.allMemberList();  
		System.out.println("mList : " + mList);
		
		request.setAttribute("mList", mList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/MemberList.jsp");
		rd.forward(request, response);
		
	}

}
