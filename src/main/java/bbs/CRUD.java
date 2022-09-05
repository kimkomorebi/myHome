package bbs;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CRUD {
	
	private SqlSession getSession() {
		//SqlSession�� ���� : ���۸� ���ؼ� ������ ȣ���Ѵ�.
		String config = "mybatisConfig.xml";//���̹�Ƽ�� ȯ�漳�� ������ �̸�
		InputStream is = null;
		try {
			is = Resources.getResourceAsStream(config);
			//������ ����� ȯ�� ���� ������ ����.
		}catch(Exception e) {}
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = builder.build(is);
		SqlSession session = factory.openSession();
		return session;
	}
}
