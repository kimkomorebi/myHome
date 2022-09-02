package users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.DBExpert;

/**
 * Servlet implementation class UserDetailServlet
 */
@WebServlet("/userDetail.do")
public class UserDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		String result = request.getParameter("R");
		DBExpert dbe = new DBExpert();
		//계정으로 가입자 조회
		User user = dbe.getUser(id);
		//조회 결과를 JSP(userDetail.jsp)로 전송
		String url = "template.jsp?BODY=userDetail.jsp";
		if(result != null) url = url+"&R="+result;
		request.setAttribute("USER", user);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
