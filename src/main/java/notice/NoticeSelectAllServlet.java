package notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/NoticeSelectAllServlet")
public class NoticeSelectAllServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    public NoticeSelectAllServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBExpert dbe = new DBExpert();
		ArrayList<Notice> list = dbe.selectAllNotice();
		int totalCount = dbe.selectTotalCount();//전체 글의 갯수
		int pageCount = totalCount / 5; //정수 나누기 정수
		if(totalCount % 5 != 0) pageCount++;
		//공지글 목록을 출력하는 JSP(noticeAll.jsp)로 전환
		request.setAttribute("LIST", list);
		request.setAttribute("PAGES", pageCount);
		RequestDispatcher rd = request.getRequestDispatcher("template.jsp?BODY=noticeAll.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
