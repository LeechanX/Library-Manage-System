package entity;

public class News {
	
	public News(){	
	}

	public String time;
	public String newsname;
	public String contentpath;
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getNewsname() {
		return newsname;
	}
	public void setNewsname(String newsname) {
		this.newsname = newsname;
	}
	public String getContentpath() {
		return contentpath;
	}
	public void setContentpath(String contentpath) {
		this.contentpath = contentpath;
	}
}
