package bbs;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CRUD {
	
	private SqlSession getSession() {
		//SqlSession의 역할 : 매퍼를 통해서 쿼리를 호출한다.
		String config = "mybatisConfig.xml";//마이바티스 환경설정 파일의 이름
		InputStream is = null;
		try {
			is = Resources.getResourceAsStream(config);
			//위에서 선언된 환경 설정 파일을 연다.
		}catch(Exception e) {}
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = builder.build(is);
		SqlSession session = factory.openSession();
		return session;
	}
}
