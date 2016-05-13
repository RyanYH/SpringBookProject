package com.book.mgr;
/*
 *   <dd class="txt_desc">
									<div class="review_point"><span style="width: 93%;"></span></div>
									<strong>9.33</strong> 
									<a href="/front/product/detailProduct.do?prodId=3952087#sub10" target="_blank">¸®ºä<em>(3)</em></a>

 */
public class BookVO {
    private String poster;
    private String title;
    private String author;
    private String publisher;
    private String regdate;
    private int rank;
    private String review;
    private String price;
    private double star;
    private int[] data=new int[12];
    private String strData;
	
	public String getStrData() {
		return strData;
	}
	public void setStrData(String strData) {
		this.strData = strData;
	}
	public int[] getData() {
		return data;
	}
	public void setData(int[] data) {
		this.data = data;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	   
}
