package cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/modifyCart.do")
public class ModifyCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModifyCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String code = request.getParameter("CODE");
		String num = request.getParameter("NUM");
		String btn = request.getParameter("BTN");
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart != null) {//장바구니가 존재하는 경우
			if(btn.equals("수정")) {
				cart.modifyItem(code, Integer.parseInt(num));
			}else if(btn.equals("삭제")) {
				cart.deleteItem(code);
			}
		}else {//장바구니가 존재하지 않는 경우
			
		}
		response.sendRedirect("cartList.do");
	}

}
