package notice;

public class Notice {
	private int seqno;//공지글 번호
	private String title;//공지글 제목
	private String id;//공지글 작성자
	private String content;//공지글 내용
	private String date;//공지글 작성일
	public int getSeqno() {
		return seqno;
	}
	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}// 게시글 정보를 저장하는 DTO
