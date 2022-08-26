package notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NoticeInputServlet
 */
@WebServlet("/noticeInput.do")
public class NoticeInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeInputServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String title = request.getParameter("TITLE");
		String content = request.getParameter("CONTENT");
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("MANAGER");
		DBExpert dbe = new DBExpert();
		int seqno = dbe.getSeqno() + 1;
		Notice notice = new Notice(); //DTO 생성
		notice.setSeqno(seqno);//글번호 설정
		notice.setTitle(title);//글제목 설정
		notice.setContent(content);//글내용 설정
		notice.setId(writer);//작성자 설정
		dbe.insertNotice(notice);//공지글 등록
		// 글 번호 : 기존의 가장 큰 글 번호 + 1
		// select max(seqno) from notice_tbl
		// 작성자 : 세션에서 MANAGER를 찾는다.
		// session.getAttribute("MANAGER");
		// 작성일 : 오라클의 sysdate 함수 사용
		//서블릿(공지글 전체 조회) 매핑
		response.sendRedirect("NoticeSelectAllServlet");
	}

}
