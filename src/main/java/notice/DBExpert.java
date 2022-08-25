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
			pstmt.setInt(1, n.getSeqno());//�۹�ȣ ����
			pstmt.setString(2, n.getId());//�ۼ��� ����
			pstmt.setString(3, n.getTitle());//���� ����
			pstmt.setString(4, n.getContent());//���� ����
			pstmt.executeUpdate();//insert ����
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close(); con.close();
			}catch(Exception e) {}
		}
	}//������ ���
	
	int getSeqno() {
		int maxSeqno = -1;//���� ū �۹�ȣ�� ����� ����
		
		try {
			Class.forName(name);
			con = DriverManager.getConnection(db,"hr","hr");
			String select = "select max(seqno) from notice_tbl";
			stmt = con.createStatement();
			rs = stmt.executeQuery(select); //select ����
			if(rs.next()) {//�˻� ����� �̵��� �Ǵ� ���
				maxSeqno = rs.getInt(1);
			}else {//�˻� ����� �̵��� �� �Ǵ� ���
				maxSeqno = 0;
			}
		}catch(Exception e) {
			e.printStackTrace(); // ���� ������ �ַܼ� ��µȴ�.
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			}catch(Exception e) {}
		}
		return maxSeqno;
	}
	
}
