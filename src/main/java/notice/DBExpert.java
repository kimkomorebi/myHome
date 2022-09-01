package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import items.Item;
import users.User;

public class DBExpert {
	public DBExpert(){}
	final String name = "oracle.jdbc.OracleDriver";
	final String db = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
	Connection con; Statement stmt; PreparedStatement pstmt;
	ResultSet rs;
	
	
	public ArrayList<User> selectAllUser() {
//		String select = "select id, pwd, name, phone, addr, gender, email, job, to_char(entry_date, 'YY/MM/DD hh:mm:ss')"+
//				" from (select id, pwd, name, phone, addr, gender, email, job, to_char(entry_date, 'YY/MM/DD hh:mm:ss'), rownum rn"+
//				" from (select id, pwd, name, phone, addr, gender, email, job, to_char(entry_date, 'YY/MM/DD hh:mm:ss')"+
//				" from users_tbl))"
//				+" where rn > ? and rn < ? order by id asc";
		String select = "select id, pwd, name, phone, addr, gender, email, job, to_char(entry_date, 'YY/MM/DD hh:mm:ss') "+
				"from users_tbl order by id asc";
		ArrayList<User> al = new ArrayList<User>();
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			stmt = con.createStatement();
			rs = stmt.executeQuery(select);
			
//			pstmt = con.prepareStatement(select);
//			Integer pageNum = 1;// 페이지 번호
//			if(page != null) {
//				pageNum = Integer.parseInt(page);
//			}
//			int start = (pageNum = 1) * 5;
//			int end = ((pageNum - 1) *5) + 6;
//			pstmt.setInt(1, start);
//			pstmt.setInt(2, end);
//			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getString(1));
				user.setPwd(rs.getString(2));
				user.setName(rs.getString(3));
				user.setTel(rs.getString(4));
				user.setAddr(rs.getString(5));
				user.setGender(rs.getString(6).charAt(0));
				user.setEmail(rs.getString(7));
				user.setJob(rs.getString(8));
				user.setEntry_date(rs.getString(9));
				al.add(user);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close(); con.close(); stmt.close();
			}catch(Exception e) {}
		}
		return al;
	}
	public String putUser(User user) {
		String insert = "insert into users_tbl values("+
				"?,?,?,?,?,?,?,?,sysdate)";
		String result = "";
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			pstmt = con.prepareStatement(insert);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getTel());
			pstmt.setString(5, user.getAddr());
			pstmt.setString(6, user.getGender()+"");
			//pstmt.setObject(6, user.getGender(), java.sql.Types.CHAR);
			pstmt.setString(7, user.getEmail());
			pstmt.setString(8, user.getJob());
			pstmt.executeUpdate();//insert 실행
			result = "OK"; // 삽입 성공
		}catch(Exception e) {
			result = "NOK"; //삽입 실패
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {}
		}
		return result;
	}//가입자 삽입 메서드
	public String userIdCheck(String id) {
		String select = "select id from users_tbl"+
		" where id =?";
		String checkID = null;
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			pstmt = con.prepareStatement(select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) checkID = rs.getString(1);
		}catch(Exception e) {
			
		}finally {
			try {
				con.close(); pstmt.close(); rs.close();
			}catch(Exception e) {}
		}
		return checkID;
	}
	public String getID(String id) {
		String select = "select id from items_tbl"+
		" where id = ?";
		String selectedid = null;
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			pstmt = con.prepareStatement(select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) selectedid = rs.getString(1);
		}catch(Exception e) {
			
		}finally {
			try {
				rs.close(); pstmt.close(); con.close();
			}catch(Exception e) {}
		}
		return selectedid;
	}
	
	public Item getItem(String id) {
		String select = "select * from items_tbl "+
		"where id = ?";
		Item item = null;
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			pstmt = con.prepareStatement(select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				item = new Item();
				item.setId(rs.getString(1));
				item.setName(rs.getString(2));
				item.setPrice(rs.getInt(3));
				item.setSpec(rs.getString(4));
				item.setOrigin(rs.getString(5));
			}
		}catch(Exception e) {
			
		}finally {
			try {
				con.close(); rs.close(); pstmt.close();
			}catch(Exception e) {}
		}
		return item;
	}
	
	public ArrayList<Item> getAllItems(String page){
		String select = "	select id, name, price, origin"
				+ " from (select id, name, price, origin, rownum rn"
				+ " from (select id, name, price, origin"
				+ " from items_tbl))"
				+ " where rn > ? and rn < ? order by id asc";
		ArrayList<Item> list = new ArrayList<Item>();
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			pstmt = con.prepareStatement(select);
			Integer pageNo = 1; //페이지 번호를 넣는다.
			if(page != null) {
				pageNo = Integer.parseInt(page);
			}
			int start = (pageNo - 1) * 5;
			int end = ((pageNo - 1) * 5) +6;
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery(); //조회 실행
			while(rs.next()) {
				Item item = new Item(); //DTO 생성
				item.setId(rs.getString(1));//상품 번호
				item.setName(rs.getString(2));//상품 이름
				item.setPrice(rs.getInt(3));//가격
				item.setOrigin(rs.getString(4));//국가 코드
				list.add(item);//ArrayList에 조회 결과 저장
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close(); con.close(); pstmt.close();
			}catch(Exception e) {}
		}
		return list;
	}
	
	
	public boolean putItem(Item item) {
		String insert = "insert into items_tbl "+
		"values(?,?,?,?,?)";
		boolean result = false;
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			pstmt = con.prepareStatement(insert);
			pstmt.setString(1, item.getId());
			pstmt.setString(2, item.getName());
			pstmt.setInt(3, item.getPrice());
			pstmt.setString(4, item.getSpec());
			pstmt.setString(5, item.getOrigin());
			pstmt.executeUpdate();
			result = true; //삽입 성공을 의미
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close(); 
			}catch(Exception e) {}
		}
		return result;
	}
	public ArrayList<String> getNations(){
		String select = "select code from nation_code";
		ArrayList<String> list = new ArrayList<String>();
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			stmt = con.createStatement();
			rs = stmt.executeQuery(select);
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				stmt.close(); rs.close(); con.close();
			}catch(Exception e) {}
		}
		return list;
	}
	
	Notice getNotice(String seqno) {
		String select = "select seqno, id, title,"+
		" to_char(input_date, 'YY/MM/DD hh:mm:ss'),"+
		"content from notice_tbl"+
		" where seqno = ?";
		Notice notice = null; // 조회 결과 저장을 위한 변수 선언
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			pstmt = con.prepareStatement(select);
			pstmt.setInt(1, Integer.parseInt(seqno));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				notice = new Notice();
				notice.setSeqno(rs.getInt(1));// 글 번호 설정
				notice.setId(rs.getString(2));// 작성자 설정
				notice.setTitle(rs.getString(3));// 제목 설정
				notice.setDate(rs.getString(4));// 작성일 설정
				notice.setContent(rs.getString(5));// 내용 설정
			}
		}catch(Exception e) {
			
		}finally {
			try {
				rs.close(); pstmt.close(); con.close();
			}catch(Exception e) {}
		}
		return notice;
	}
	public int selectItemsCount() {
		String select = "select count(*) from items_tbl";
		int count = -1;
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			stmt = con.createStatement();
			rs = stmt.executeQuery(select);
			if(rs.next()) count = rs.getInt(1);
			else count = 0;
		}catch(Exception e) {
			
		}finally {
			try {
				rs.close(); stmt.close(); con.close();
			}catch(Exception e) {}
		}
		return count;
	}
	int selectTotalCount() {
		String select = "select count(*) from notice_tbl";
		int count = -1;
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			stmt = con.createStatement();
			rs = stmt.executeQuery(select);
			if(rs.next()) count = rs.getInt(1);
			else count = 0;
		}catch(Exception e) {
			
		}finally {
			try {
				rs.close(); stmt.close(); con.close();
			}catch(Exception e) {}
		}
		return count;
	}
	ArrayList<Notice> selectAllNotice(String page) {
		ArrayList<Notice> al = new ArrayList<Notice>();
		//조회 결과를 Notice에 담고,
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
//			String select = "select seqno,id, title,"+
//					"to_char(input_date, 'yy/mm/dd hh:mm:ss')"
//					+ " from notice_tbl order by seqno desc";
			String select = "select seqno, id, title, d"
					+" from (select seqno, id, title, d, rownum rn"
					+" from (select seqno, id, title, to_char(input_date, 'yy/mm/dd hh:mm:ss') d"
					+" from notice_tbl order by seqno desc)"
					+" )"
					+ " where rn > ? and rn < ?";
			pstmt = con.prepareStatement(select);
			Integer pageNo = 1; //페이지 번호를 넣는다.
			if(page != null) {
				pageNo = Integer.parseInt(page);
			}
			int start = (pageNo - 1) * 5;
			int end = ((pageNo - 1) * 5) +6;
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery(); // select 실행
			while(rs.next()) {
				Notice notice = new Notice(); // DTO 생성
				notice.setSeqno(rs.getInt(1));//글번호
				notice.setId(rs.getString(2));//작성자
				notice.setTitle(rs.getString(3));//제목
				notice.setDate(rs.getString(4));//작성일
				al.add(notice);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close(); stmt.close(); con.close();
			}catch(Exception e) {}
		}
		//Notice를 ArrayList에 담는다.
		return al;
	}
	
	void insertNotice(Notice n) {
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			String insert = "insert into notice_tbl values("+
					"?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(insert);
			pstmt.setInt(1, n.getSeqno());//글번호 설정
			pstmt.setString(2, n.getId());//작성자 설정
			pstmt.setString(3, n.getTitle());//제목 설정
			pstmt.setString(4, n.getContent());//내용 설정
			pstmt.executeUpdate();//insert 실행
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close(); con.close();
			}catch(Exception e) {}
		}
	}//공지글 등록
	
	int getSeqno() {
		int maxSeqno = -1;//가장 큰 글번호가 저장될 변수
		
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			String select = "select max(seqno) from notice_tbl";
			stmt = con.createStatement();
			rs = stmt.executeQuery(select); //select 실행
			if(rs.next()) {//검색 결과로 이동이 되는 경우
				maxSeqno = rs.getInt(1);
			}else {//검색 결과로 이동이 안 되는 경우
				maxSeqno = 0;
			}
		}catch(Exception e) {
			e.printStackTrace(); // 예외 정보가 콘솔로 출력된다.
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			}catch(Exception e) {}
		}
		return maxSeqno;
	}
	
}
