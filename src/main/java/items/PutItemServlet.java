package items;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.DBExpert;



@WebServlet("/putItem.do")
public class PutItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PutItemServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("ID");//상품 번호
		String name = request.getParameter("NAME");//상품 이름
		String price = request.getParameter("PRICE");//상품 가격
		String code = request.getParameter("CODE");//원산지(국가코드)
		String spec = request.getParameter("CONTENT");//상품 설명
		Item item = new Item();//DTO 생성
		item.setId(id);
		item.setName(name);
		item.setPrice(Integer.parseInt(price));
		item.setSpec(spec);
		item.setOrigin(code);
		DBExpert dbe = new DBExpert();
		boolean result = dbe.putItem(item); //상품 정보 삽입
		//페이지 전환(서블릿(상품 목록 조회) 매핑)
		//상품 목록 조회 서블릿의 매핑 이름 : getAllItems
		response.sendRedirect("getAllItems?R="+result);
	}
}
