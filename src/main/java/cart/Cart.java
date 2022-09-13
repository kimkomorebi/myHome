package cart;

import java.util.ArrayList;

import bbs.CRUD;
import items.CartItem;

public class Cart {
	public Cart(String id) {
		this.id = id;
	}
	private String id;//계정
	private ArrayList<String> codeList = new ArrayList<String>();//상품 번호 저장용 변수 선언
	private ArrayList<Integer> numList = new ArrayList<Integer>();//상품 갯수 저장용 변수 선언
	public ArrayList<String> getCodeList() {
		return codeList;
	}
	public ArrayList<Integer> getNumList() {
		return numList;
	}
	
	public void deleteItem(String id) {
		for(int i=0; i<codeList.size(); i++) {
			if(codeList.get(i).equals(id)) {
				codeList.remove(i);//i번째 상품 번호 삭제
				numList.remove(i);//i번째 상품 갯수 삭제
				//DB연동
				CRUD crud = new CRUD();
				CartItem ci = new CartItem();
				ci.setId(this.id);
				ci.setCode(id);
				crud.deleteCart(ci);
				//DB연동 끝
				return;// 메서드 종료
			}//i번째 상품 번호와 삭제하려는 상품 번호가 같은 경우
		}
	}//장바구니에서 상품을 삭제하는 메서드
	
	public void modifyItem(String id, int num) {
		for(int i=0; i<codeList.size(); i++) {
			if(codeList.get(i).equals(id)) {
				numList.set(i, num);//i번째 상품 갯수를 num으로 변경
				//DB연동 시작
				CRUD crud = new CRUD();
				CartItem ci = new CartItem();
				ci.setId(this.id);
				ci.setCode(id);
				ci.setNum(numList.get(i));
				crud.updateCart(ci);
				//DB연동 끝
				return; //메서드 종료
			}//i번째 상품의 번호와 수정하려는 상품의 번호가 같은 경우
		}
	}//장바구니에서 상품의 갯수를 변경하는 메서드
	
	public void addCart(String code, int num) {
		for(int i=0; i< codeList.size(); i++) {
			if(codeList.get(i).equals(code)) {
				numList.set(i, numList.get(i)+num);
				//DB 연동 시작//
				CRUD crud = new CRUD();
				CartItem ci = new CartItem();
				ci.setId(this.id);//계정 설정
				ci.setCode(code);//상품 번호 설정
				ci.setNum(numList.get(i));//상품 갯수 설정
				crud.updateCart(ci);//장바구니 테이블 update
				return; //메서드 종료
			}//i번째 상품 번호와 code에 있는 상품 번호가 같은지 비교
		}//codeList에 있는 상품 번호의 갯수만큼 반복
		//codeList에 code에 있는 상품 번호가 있는지 검사
		//codeList에 동일한 상품 번호가 있으면  갯수를 증가
		codeList.add(code); numList.add(num);
		//DB연동 시작//
		CRUD crud = new CRUD();
		CartItem ci = new CartItem();
		ci.setSeq(crud.maxCart()+1);//일련번호 설정
		ci.setId(this.id);//계정 설정
		ci.setCode(code);//상품 번호 설정
		ci.setNum(num);//상품 갯수 설정
		crud.addCart(ci);//장바구니 테이블에 삽입
		//DB연동 끝//
	}
}//장바구니용 객체
