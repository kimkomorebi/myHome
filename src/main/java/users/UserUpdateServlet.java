package users;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.DBExpert;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/userUpdate.do")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UserUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("ID");
		String tel = request.getParameter("TEL");
		String addr = request.getParameter("ADDR");
		String email = request.getParameter("EMAIL");
		String job = request.getParameter("JOB");
		User user = new User();
		user.setId(id);
		user.setTel(tel);
		user.setAddr(addr);
		user.setEmail(email);
		user.setJob(job);
		DBExpert dbe = new DBExpert();
		//수정 실행 -> 수정한 계정으로 조회(서블릿) - > 조회 결과 출력
		String result = dbe.updateuser(user);
		response.sendRedirect("userDetail.do?ID="+user.getId()+"&R="+result);
	}
}
