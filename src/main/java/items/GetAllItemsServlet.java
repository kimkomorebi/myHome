package items;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.CRUD;

/**
 * Servlet implementation class GetAllItemsServlet
 */
@WebServlet("/getAllItems")
public class GetAllItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetAllItemsServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String insertResult = request.getParameter("R");
		String pageNo = request.getParameter("PAGENO");
		//DBExpert dbe = new DBExpert();
		CRUD crud = new CRUD();
		//��ȸ �޼��带 ȣ��
		//ArrayList<Item> list = dbe.getAllItems(pageNo);
		int page = 1;
		if(pageNo != null) {
			page = Integer.parseInt(pageNo);
		}
		List<Item> list = crud.getAllItems(page);
		//int totalCount = dbe.selectItemsCount(); //��ǰ ����
		Integer totalCount = crud.selectItemsCount();
		int pageCount = totalCount / 5; //������ ����
		if(totalCount % 5 != 0) pageCount++;
		//getAllItem.jsp�� ��ȯ
		request.setAttribute("PAGES", pageCount);
		request.setAttribute("R", insertResult);
		request.setAttribute("LIST", list);
		RequestDispatcher rd = request.getRequestDispatcher("template.jsp?BODY=getAllItem.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
