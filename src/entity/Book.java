package entity;

public class Book {
	public int tid;
	public String id;
	public 	String name;
	public String type;
	public String author;
	public String publisher;
	public String publish_time;
	public int stock;
	public String price;
	public String translator;
	public String bookcaseid;
	public int type2;
	public String bookpic;
	
	
	
	public Book() {
	}

	public Book(int tid, String id, String name, String type, String author,
			String publisher, String publishTime, int stock, String price,
			String translator, String bookcaseid, int type2, String bookpic) {
		super();
		this.tid = tid;
		this.id = id;
		this.name = name;
		this.type = type;
		this.author = author;
		this.publisher = publisher;
		publish_time = publishTime;
		this.stock = stock;
		this.price = price;
		this.translator = translator;
		this.bookcaseid = bookcaseid;
		this.type2 = type2;
		this.bookpic = bookpic;
	}
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPublish_time() {
		return publish_time;
	}
	public void setPublish_time(String publishTime) {
		publish_time = publishTime;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public String getBookcaseid() {
		return bookcaseid;
	}
	public void setBookcaseid(String bookcaseid) {
		this.bookcaseid = bookcaseid;
	}
	public int getType2() {
		return type2;
	}
	public void setType2(int type2) {
		this.type2 = type2;
	}
	public String getBookpic() {
		return bookpic;
	}
	public void setBookpic(String bookpic) {
		this.bookpic = bookpic;
	}
    
}
