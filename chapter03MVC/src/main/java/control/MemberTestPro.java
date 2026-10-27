package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberTestDTO;


@WebServlet("/Mproc.do") // form의 action부분을 매핑한다.
public class MemberTestPro extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberTestDTO memDTO = new MemberTestDTO();
		memDTO.setId(request.getParameter("id"));
		memDTO.setPass(request.getParameter("pass"));
		memDTO.setEmail(request.getParameter("email"));
		memDTO.setTel(request.getParameter("tel"));
		memDTO.setAddress(request.getParameter("address"));
		
		// setAttribute()를 통해 mtdto를 한꺼번에 담아
		// MemberTestView.jsp
		// jsp로 넘긴 상태에서 화면그릴때 mt를 표현식에 담는다.
		request.setAttribute("mt", memDTO);
		
		// MemberTestView.jsp 페이지에 내보내기 할때 사용하는 명령어
		RequestDispatcher rd = request.getRequestDispatcher("MemberTestView.jsp");
		rd.forward(request, response); // forward() 앞으로 가다.
	}	

}
