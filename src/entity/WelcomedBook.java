package entity;

public class WelcomedBook extends Book{
	
	int number;

	public WelcomedBook(int tid, String id, String name, String type,
			String author, String publisher, String publishTime, int stock,
			String price, String translator, String bookcaseid, int type2,
			String bookpic, int number) {
		super(tid, id, name, type, author, publisher, publishTime, stock,
				price, translator, bookcaseid, type2, bookpic);
		this.number = number;
	}
	
	public WelcomedBook() {
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

}
