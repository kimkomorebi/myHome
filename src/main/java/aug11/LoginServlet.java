package aug11;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs.CRUD;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		String pwd = request.getParameter("PWD");
		//고객 정보 테이블에 있는 계정과 암호와 비교한다.
		CRUD crud = new CRUD();
		String result = ""; // 로그인 결과를 위한 변수 선언
			
		String pwdInDB = crud.getPwd(id); //조회결과
		if(pwdInDB == null) {
			result = "NOID"; //계정 없음
		}else if(pwdInDB.equals(pwd)) {
			//입력한 암호와 DB의 암호를 비교
			result = "OK";//로그인 성공
			HttpSession session = request.getSession();
			if(id.equals("manager")) {
				session.setAttribute("MANAGER", id);
			}else {
				session.setAttribute("LOGINID", id);
			}
		}else {
			result = "NOPWD"; //암호 불일치
		}
		//로그인 결과 JSP(loginResult.jsp)로 전환
		//1.Redirect, 2.Forward, 3.상관 없다.
		response.sendRedirect("template.jsp?BODY=loginResult.jsp?R="+result);
		
	}

}
