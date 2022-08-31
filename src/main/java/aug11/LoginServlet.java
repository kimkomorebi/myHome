package aug11;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String select = "select pwd from users_tbl"+
		" where id = ?";
		String result = ""; // 로그인 결과를 위한 변수 선언
		Connection con = null; PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","hr","hr");
			pstmt = con.prepareStatement(select);
			pstmt.setString(1, id); // 첫 번 째 물음표 계정 설정
			rs = pstmt.executeQuery(); //select 실행
			if(rs.next()) { //조회 결과로 이동 성공 즉 조회 결과 있음
				String pwdInDB = rs.getString(1); //조회결과
				if(pwdInDB.equals(pwd)) {
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
			}else {//조회 결과로 이동 실패 즉 조회 결과가 없음
				result = "NOID"; //계정 없음
			}
		}catch(Exception e) {
			
		}finally {
			try {
				con.close(); pstmt.close(); rs.close();
			}catch(Exception e) {}
		}
		//로그인 결과 JSP(loginResult.jsp)로 전환
		//1.Redirect, 2.Forward, 3.상관 없다.
		response.sendRedirect("template.jsp?BODY=loginResult.jsp?R="+result);
		
	}

}
