package entity;

public class Borrow {

	public int id;
	public String bookid;
	public String readerid;
	public String borrow_time;
	public String back_time;
	public int is_back;
	
	public int getIs_back() {
		return is_back;
	}
	public void setIs_back(int isBack) {
		is_back = isBack;
	}
	public String bookname;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getReaderid() {
		return readerid;
	}
	public void setReaderid(String readerid) {
		this.readerid = readerid;
	}
	public String getBorrow_time() {
		return borrow_time;
	}
	public void setBorrow_time(String borrowTime) {
		borrow_time = borrowTime;
	}
	public String getBack_time() {
		return back_time;
	}
	public void setBack_time(String backTime) {
		back_time = backTime;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	
}
