package com.shuwa.model;

public class Word {
	private int id;
	private String word;
	private String url;
	private int startSecond;
	private int endSecond;

	public Word(int id, String word, String url, int startSecond, int endSecond) {
		this.id = id;
		this.word = word;
		this.url = url;
		this.startSecond = startSecond;
		this.endSecond = endSecond;
	}

	public int getId() { return id;}
	public String getWord() { return word;}
	public String getUrl() { return url;}
	public int getStartSecond() { return startSecond;}
	public int getEndSecond() { return endSecond;}
	
}