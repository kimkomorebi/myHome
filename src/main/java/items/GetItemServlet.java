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
 * Servlet implementation class GetItemServlet
 */
@WebServlet("/getItem")
public class GetItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetItemServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		String result = request.getParameter("R");
		DBExpert dbe = new DBExpert();
		Item item = dbe.getItem(id);
		String url = "template.jsp?BODY=itemDetail.jsp";
		if(result != null) url = url+"&R="+result;
		request.setAttribute("ITEM", item);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
