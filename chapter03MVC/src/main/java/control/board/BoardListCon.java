package control.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.board.BoardDAO;
import model.board.BoardDTO;

@WebServlet("/BoardListCon.do")  // header.jsp 의 게시판메뉴 클릭하면 목록이 출력되도록
public class BoardListCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// header.jsp로 넘어갈때 페이징할 변수를 담아서 떠넘겨주어야 함
		// 아래부분은 페이징을 하기위한 기본변수와 연산식을 작성할 예정임
		// board테이블의 모든 레코드가 넘겨저야 함
		// DAO가 필요함 => getAllboard() 메소드
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("id");
		System.out.println("loginId : " + loginId);
		int count = 0;
		int pageSize = 5;		
		// 현재 보고 있는 페이지 넘버 1 2 3 ==> 현재 1페이지에 있음
		// pageNum = 1; request로 받아옴
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		// 게시글의 번호를 최신글순으로 출력되도록 번호를 지정하기 위해
		int number = 0;
		// 현재 보여지고 있는 페이지 문자를 숫자로 변환
		// 현재 currentPage = 1;
		int currentPage = Integer.parseInt(pageNum);
		
		// 전체 게시글의 개수를 가져오는 데이터 베이스에서 가져오기 위해 boardDAO를 인스턴스화
		BoardDAO boardDAO = new BoardDAO();		
		count = boardDAO.getAllCount(); // 현재 count 10
		
		// startRow를 계산해야 시작하는 번호  1, 2, 3, 처럼 보고 있는 페이지의 시작행으로 출력할수 있다.
		// 시작행으로 출력할수 있다.
		// limit 시작위치, 개수
		// currentPage = 1 한페이지 출력 개수는 pageSize
		int startRow = (currentPage-1)*pageSize;
		
		ArrayList<BoardDTO> bList = boardDAO.getAllboard(startRow, pageSize);		
		
		// jsp 화면에 [번호]부분에 들어갈 number 값을 계산하는 부분
		// 단, 단 최신글 순서대로 번호가 출력된다.
		// count=10, currentPage=1, => 현재 보고 있는 [1]페이지 첫 번째 글 번호가 10이어야 한다.
		// => 현재 보고있는 [1] 페이지의 마지막 글 번호가 
//		number = count-(currentPage-1)*pageSize;
		number = count - startRow;
		
		// ----------------------------
		// 페이징 처리한 계산로직
		int pageCount = 0; // 전체페이지 넘버수를 담는 변수
		int pageBlock = 3; // 한 화면에 페이징하고 싶은 개수 예 
		int startPage = 1; // 한화면에 제일 첫번째 페이징 번호를 담는 변수
		int endPage = 0; // 한 화면에 제일 마지막 페이징 넘버를 담는 변수
		
		if(count>0) {
			pageCount = count/pageSize + (count % pageSize == 0 ? 0 : 1);
			
			if(currentPage % pageBlock != 0) {
				startPage = (currentPage/pageBlock)*pageBlock + 1;				
			} else {
				startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
			}
			
			endPage = startPage + pageBlock -1;
			
			
			// 페이징의 번호가 [1][2][3] 이 출력되는 경우는 count의 데이터
			// count가 10개이면 페이징번호는 [1][2] 만 존재해야함
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			
		}		
		
		// -------
		// BoardList.jsp View 단으로 Dispatcher 이용하여 넘기기
		request.setAttribute("blist", bList);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("loginId", loginId);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?section=board/BoardList.jsp");
		rd.forward(request, response);
		
		
	}

}
