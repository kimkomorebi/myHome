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
		Notice notice = new Notice(); //DTO ����
		notice.setSeqno(seqno);//�۹�ȣ ����
		notice.setTitle(title);//������ ����
		notice.setContent(content);//�۳��� ����
		notice.setId(writer);//�ۼ��� ����
		dbe.insertNotice(notice);//������ ���
		// �� ��ȣ : ������ ���� ū �� ��ȣ + 1
		// select max(seqno) from notice_tbl
		// �ۼ��� : ���ǿ��� MANAGER�� ã�´�.
		// session.getAttribute("MANAGER");
		// �ۼ��� : ����Ŭ�� sysdate �Լ� ���
		//����(������ ��ü ��ȸ) ����
		response.sendRedirect("NoticeSelectAllServlet");
	}

}
