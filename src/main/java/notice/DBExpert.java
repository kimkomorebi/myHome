package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBExpert {
	DBExpert(){}
	final String name = "oracle.jdbc.OracleDriver";
	final String db = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
	Connection con; Statement stmt; PreparedStatement pstmt;
	ResultSet rs;
	
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
