package items;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.CRUD;



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
		String id = request.getParameter("ID");//��ǰ ��ȣ
		String name = request.getParameter("NAME");//��ǰ �̸�
		String price = request.getParameter("PRICE");//��ǰ ����
		String code = request.getParameter("CODE");//������(�����ڵ�)
		String spec = request.getParameter("CONTENT");//��ǰ ����
		Item item = new Item();//DTO ����
		item.setId(id);
		item.setName(name);
		item.setPrice(Integer.parseInt(price));
		item.setSpec(spec);
		item.setOrigin(code);
		CRUD crud = new CRUD();
		//boolean result = crud.putItem(item); //��ǰ ���� ����
		int result = crud.putItem(item);
		//������ ��ȯ(����(��ǰ ��� ��ȸ) ����)
		//��ǰ ��� ��ȸ ������ ���� �̸� : getAllItems
		response.sendRedirect("getAllItems?R="+result);
	}
}
