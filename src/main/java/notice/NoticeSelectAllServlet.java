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
		int totalCount = dbe.selectTotalCount();//��ü ���� ����
		int pageCount = totalCount / 5; //���� ������ ����
		if(totalCount % 5 != 0) pageCount++;
		//������ ����� ����ϴ� JSP(noticeAll.jsp)�� ��ȯ
		request.setAttribute("LIST", list);
		request.setAttribute("PAGES", pageCount);
		RequestDispatcher rd = request.getRequestDispatcher("template.jsp?BODY=noticeAll.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
