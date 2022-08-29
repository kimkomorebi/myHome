package notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/readNotice")
public class ReadNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReadNoticeServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String seqNo = request.getParameter("SEQNO");
		DBExpert dbe = new DBExpert();
		Notice notice = dbe.getNotice(seqNo);
		request.setAttribute("NOTICE", notice);
		RequestDispatcher rd = request.getRequestDispatcher("template.jsp?BODY=readNotice.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
