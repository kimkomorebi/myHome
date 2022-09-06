package bbs;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CRUD {
	private final String namespace ="mapper.myhome";
	
	public BBS getBBS(Integer seqno) {
		SqlSession ss = getSession();
		BBS bbs = null; //조회 결과 저장할 변수
		try {
			bbs = ss.selectOne(namespace+".getBBS", seqno);
		}finally {
			
		}
		return bbs;
	}
	public Integer getBBSCount() {
		SqlSession ss = getSession();
		Integer count = null;
		try {
			count =ss.selectOne(namespace+".getBBSCount");
			if(count == null) count = 0;
			
		}finally {
			ss.close();
		}
		return count;
	}
	public List<BBS> getAllBBS(Integer page){
		SqlSession ss = getSession();
		List<BBS> list = null;
		try {
			list = ss.selectList(namespace+".getAllBBS",page);
		}finally {
			ss.close();
		}
		return list;
	}
	
	public Integer putBBS(BBS bbs) {
		SqlSession ss = getSession();
		Integer result = null;
		try {
			result = ss.insert(namespace+".putBBS", bbs);
			if(result > 0 ) ss.commit();
			else ss.rollback();
		}finally {
			ss.close();
		}
		return result;
	}
	
	public int getMaxSeqno() {
		SqlSession ss= getSession();
		int max = -1;
		try {
			Integer i = ss.selectOne(namespace+".maxSeqno");
			if(i == null) max = 0;
			else max = i;
		}finally {
			ss.close();
		}
		return max;
	}//자유 게시판에서 가장 큰 글번호를 찾는 메서드
	
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
