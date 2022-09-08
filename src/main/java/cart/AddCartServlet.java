package cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addCart.do")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("CODE");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGINID");
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart == null) cart = new Cart(id);
		
		cart.addCart(code, 1);//��ǰ��ȣ�� 1�� ��ٱ��Ͽ� ����
		session.setAttribute("CART", cart);
		//addCartResult.jsp�� ��ȯ
		response.sendRedirect("addCartResult.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
