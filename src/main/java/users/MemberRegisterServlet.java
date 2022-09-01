package users;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.DBExpert;



@WebServlet("/memberRegister.do")
public class MemberRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberRegisterServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("IDD");
		String pwd = request.getParameter("PASSWORD");
		String name = request.getParameter("NAME");
		String tel = request.getParameter("TEL");
		String addr = request.getParameter("ADDR");
		String gender = request.getParameter("GENDER");
		String email = request.getParameter("EMAIL");
		String job = request.getParameter("JOB");
		User user = new User();//DTO
		user.setId(id);
		user.setPwd(pwd);
		user.setName(name);
		user.setTel(tel);
		user.setAddr(addr);
		user.setGender(gender.charAt(0));
		user.setEmail(email);
		user.setJob(job);
		DBExpert dbe = new DBExpert();
		String result = dbe.putUser(user);
		//페이지 전환(가입자 등록 성공 유무 JSP:entryResult.jsp)
		response.sendRedirect("template.jsp?BODY=entryResult.jsp?RESULT="+result);
		
	}

}
