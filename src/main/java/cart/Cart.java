package cart;

import java.util.ArrayList;

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
	public void addCart(String code, int num) {
		for(int i=0; i< codeList.size(); i++) {
			if(codeList.get(i).equals(code)) {
				numList.set(i, numList.get(i)+num);
				return; //메서드 종료
			}//i번째 상품 번호와 code에 있는 상품 번호가 같은지 비교
		}//codeList에 있는 상품 번호의 갯수만큼 반복
		//codeList에 code에 있는 상품 번호가 있는지 검사
		//codeList에 동일한 상품 번호가 있으면  갯수를 증가
		codeList.add(code); numList.add(num);
	}
}//장바구니용 객체
