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

@WebServlet("/getNationCodes")
public class GetNationCodeSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetNationCodeSevlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CRUD crud = new CRUD();
		List<String> codes = crud.getNations();
		request.setAttribute("CODES", codes);
		RequestDispatcher rd = request.getRequestDispatcher("template.jsp?BODY=itemInput.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
