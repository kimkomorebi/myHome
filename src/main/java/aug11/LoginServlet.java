package aug11;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs.CRUD;
import cart.Cart;
import items.CartItem;

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
		//�� ���� ���̺� �ִ� ������ ��ȣ�� ���Ѵ�.
		CRUD crud = new CRUD();
		String result = ""; // �α��� ����� ���� ���� ����
			
		String pwdInDB = crud.getPwd(id); //��ȸ���
		if(pwdInDB == null) {
			result = "NOID"; //���� ����
		}else if(pwdInDB.equals(pwd)) {
			//�Է��� ��ȣ�� DB�� ��ȣ�� ��
			result = "OK";//�α��� ����
			HttpSession session = request.getSession();
			if(id.equals("manager")) {
				session.setAttribute("MANAGER", id);
			}else {
				session.setAttribute("LOGINID", id);
			}
			//DB���� �α��� �������� ��ٱ��ϸ� ã�´�. ����//
			List<CartItem> cartList = crud.getCart(id);
			if(cartList != null) {
				Cart cart = new Cart(id);//��ٱ��ϸ� ����
				for(int i=0; i<cartList.size(); i++) {
					CartItem ci = cartList.get(i);
					cart.getCodeList().add(ci.getCode());
					cart.getNumList().add(ci.getNum());
				}
				session.setAttribute("CART", cart);
			}
			//DB���� �α��� �������� ��ٱ��ϸ� ã�´�. ����//
		}else {
			result = "NOPWD"; //��ȣ ����ġ
		}
		//�α��� ��� JSP(loginResult.jsp)�� ��ȯ
		//1.Redirect, 2.Forward, 3.��� ����.
		response.sendRedirect("template.jsp?BODY=loginResult.jsp?R="+result);
		
	}

}
