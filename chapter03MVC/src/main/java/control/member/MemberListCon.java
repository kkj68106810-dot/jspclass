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
		ArrayList<MemberDTO> mList = new ArrayList<>();
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		MemberDAO mdao = new MemberDAO();
		
//		ArrayList<MemberDTO> mList = mdao.allMemberList();
		if(searchType == null || keyword == null) {
			mList = mdao.allMemberList();
			
		} else {
			mList = mdao.searchMemberList(searchType, keyword);	
		}		 
		
		System.out.println("mList : " + mList);
		
		request.setAttribute("mList", mList);
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/MemberList.jsp");
		rd.forward(request, response);
		
	}

}
