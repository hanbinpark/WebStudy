package com.model;

public class PartyDTO {
	private int no;
	private String party_Title;
	private String id;
	private String platform_Name;
	private String start_Date;
	private String post_Date;
	private int period;
	private int price;
	private int person;
	
	public PartyDTO(int no, String party_Title, String id, String platform_Name, String start_Date, String post_Date,
			int period, int price, int person) {
		this.no = no;
		this.party_Title = party_Title;
		this.id = id;
		this.platform_Name = platform_Name;
		this.start_Date = start_Date;
		this.post_Date = post_Date;
		this.period = period;
		this.price = price;
		this.person = person;
	}

	public int getNo() {
		return no;
	}

	public String getParty_Title() {
		return party_Title;
	}

	public String getId() {
		return id;
	}

	public String getPlatform_Name() {
		return platform_Name;
	}

	public String getStart_Date() {
		return start_Date;
	}

	public String getPost_Date() {
		return post_Date;
	}

	public int getPeriod() {
		return period;
	}

	public int getPrice() {
		return price;
	}

	public int getPerson() {
		return person;
	}
	
	
}
