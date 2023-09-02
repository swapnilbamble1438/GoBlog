package com.entity;

import java.sql.Timestamp;

public class Post {
	
	private int pid;
	private String title;
	private String content;
	private String code;
	private String image;
	private Timestamp creationdate;
	private int cid;
	private int id;
	
	public Post() {
		
	}

	public Post(int pid, String title, String content, String code, String image, Timestamp creationdate, int cid,
			int id) {
		super();
		this.pid = pid;
		this.title = title;
		this.content = content;
		this.code = code;
		this.image = image;
		this.creationdate = creationdate;
		this.cid = cid;
		this.id = id;
	}

	public Post(String title, String content, String code, String image, Timestamp creationdate, int cid, int id) {
		super();
		this.title = title;
		this.content = content;
		this.code = code;
		this.image = image;
		this.creationdate = creationdate;
		this.cid = cid;
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Timestamp getCreationdate() {
		return creationdate;
	}

	public void setCreationdate(Timestamp creationdate) {
		this.creationdate = creationdate;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Post [pid=" + pid + ", title=" + title + ", content=" + content + ", code=" + code + ", image=" + image
				+ ", creationdate=" + creationdate + ", cid=" + cid + ", id=" + id + "]";
	}

	
	
	
	
	
}
