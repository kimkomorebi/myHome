package cart;

import java.util.ArrayList;

public class Cart {
	public Cart(String id) {
		this.id = id;
	}
	private String id;//����
	private ArrayList<String> codeList = new ArrayList<String>();//��ǰ ��ȣ ����� ���� ����
	private ArrayList<Integer> numList = new ArrayList<Integer>();//��ǰ ���� ����� ���� ����
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
				return; //�޼��� ����
			}//i��° ��ǰ ��ȣ�� code�� �ִ� ��ǰ ��ȣ�� ������ ��
		}//codeList�� �ִ� ��ǰ ��ȣ�� ������ŭ �ݺ�
		//codeList�� code�� �ִ� ��ǰ ��ȣ�� �ִ��� �˻�
		//codeList�� ������ ��ǰ ��ȣ�� ������  ������ ����
		codeList.add(code); numList.add(num);
	}
}//��ٱ��Ͽ� ��ü
