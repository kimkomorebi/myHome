package cart;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs.CRUD;
import items.Item;

@WebServlet("/cartList.do")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart == null) {//장바구니가 없는 경우
			request.setAttribute("LISTS", null);
		}else {//장바구니가 있는 경우
			ArrayList<String> codeList = cart.getCodeList();
			ArrayList<Integer> numList = cart.getNumList();
			ArrayList<Item> itemList = new ArrayList<Item>();
			CRUD crud = new CRUD();
			int total = 0;//총액 계산을 위한 변수 선언
			for(int i = 0; i<codeList.size(); i++) {
				String code = codeList.get(i);
				int num = numList.get(i);
				//code에 있는 상품 번호로 조회
				Item item = crud.getItem(code);
				//item.setId(code);
				item.setNum(num);
				total += item.getPrice() * num;
				//total = total + (item.getPrice() * num);
				itemList.add(item);
			}
			request.setAttribute("LISTS", itemList);
			request.setAttribute("TOTAL", total);
		}
		RequestDispatcher rd = request.getRequestDispatcher("template.jsp?BODY=cartList.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
