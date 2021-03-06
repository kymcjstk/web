package com.b2b.web.model;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {
	
	
	private int bno;    
	private String title;
    private String content;
    private String writer;
    private Date regdate;
    private int viewcnt;
    private String[] files;
    private int attachcnt;
    
    public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}   
	
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getAttachcnt() {
		return attachcnt;
	}
	public void setAttachcnt(int attachcnt) {
		this.attachcnt = attachcnt;
	}
	
	@Override
    public String toString() {
        return "tbl_board{" +
                "bno=" + bno +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                ", regdate=" + regdate +
                ", viewcnt=" + viewcnt +
                ", files=" + Arrays.toString(files) +
                ", attachcnt=" + attachcnt +              
                '}';              
    }
    
}
