package items;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.DBExpert;

/**
 * Servlet implementation class ItemIDCheckServlet
 */
@WebServlet("/itemIdCheck.do")
public class ItemIDCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ItemIDCheckServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		DBExpert dbe = new DBExpert();
		String result = dbe.getID(id);
		request.setAttribute("ID", id);
		request.setAttribute("DUP", result);
		//result�� null�� ���, �Է��� ��ǰ ��ȣ�� ��� ����
		//result�� null�� �ƴ� ���, �Է��� ��ǰ ��ȣ�� �̹� ��� ��
		RequestDispatcher rd = request.getRequestDispatcher("itemIdCheck.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
