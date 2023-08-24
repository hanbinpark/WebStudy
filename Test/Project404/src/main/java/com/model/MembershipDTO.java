package com.model;

public class MembershipDTO {
	private int platformNo;
	private String title;
	private int share;
	private int price;
	
	public MembershipDTO(int platformNo, String title, int share, int price) {
		this.platformNo = platformNo;
		this.title = title;
		this.share = share;
		this.price = price;
	}

	public int getPlatformNo() {
		return platformNo;
	}

	public String getTitle() {
		return title;
	}

	public int getShare() {
		return share;
	}

	public int getPrice() {
		return price;
	}
	
	
}
