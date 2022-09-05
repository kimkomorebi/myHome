package items;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.DBExpert;

@WebServlet("/itemUpdate.do")
public class ItemUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ItemUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("ID");
		String name = request.getParameter("NAME");
		String price = request.getParameter("PRICE");
		String spec = request.getParameter("SPEC");
		Item item = new Item();
		item.setId(id);
		item.setName(name);
		item.setPrice(Integer.parseInt(price));
		item.setSpec(spec);
		DBExpert dbe = new DBExpert();
		String result = dbe.updateProduct(item);
		response.sendRedirect("getItem?ID="+item.getId()+"&R="+result);
	
	}

}
