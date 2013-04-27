package entity;

public class DetailedBook extends Book{
	
	public String bookcasename;
	public String nexttype;
	public String position;
	
	public String getBookcasename() {
		return bookcasename;
	}
	public void setBookcasename(String bookcasename) {
		this.bookcasename = bookcasename;
	}
	public String getNexttype() {
		return nexttype;
	}
	public void setNexttype(String nexttype) {
		this.nexttype = nexttype;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
}
