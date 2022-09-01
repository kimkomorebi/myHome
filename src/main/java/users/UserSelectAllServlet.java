package users;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.DBExpert;

@WebServlet("/UserSelectAllServlet")
public class UserSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserSelectAllServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBExpert dbe = new DBExpert();
		ArrayList<User> al = dbe.selectAllUser();
		request.setAttribute("AL", al);
		RequestDispatcher rd = request.getRequestDispatcher("template.jsp?BODY=getAllUser.jsp");
		rd.forward(request, response);
		System.out.println("회원 목록"+al);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
