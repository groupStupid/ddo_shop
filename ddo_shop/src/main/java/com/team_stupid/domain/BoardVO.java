package com.team_stupid.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {
	
	private int EVENT_NUM;
	private String EVENT_SHOP_NAME;
	private String EVENT_TITLE;
	private String EVENT_CONTENTS;
	private String EVENT_GOODS;
	private Date EVENT_START;
	private Date EVENT_END;
	private char EVENT_ONGOING;
	private String EVENT_IMAGEURL;
	private int EVENT_EMOTIONS;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public int getEventNum() {
		return EVENT_NUM;
	}
	public void setEventNum(int EVENT_NUM) {
		this.EVENT_NUM = EVENT_NUM;
	}
	public String getEventShopName() {
		return EVENT_SHOP_NAME;
	}
	public void setEventShopName(String EVENT_SHOP_NAME) {
		this.EVENT_SHOP_NAME = EVENT_SHOP_NAME;
	}	
	public String getEventTitle() {
		return EVENT_TITLE;
	}
	public void setEventTitle(String EVENT_TITLE) {
		this.EVENT_TITLE = EVENT_TITLE;
	}
	public String getEventContents() {
		return EVENT_CONTENTS;
	}
	public void setEventContents(String EVENT_CONTENTS) {
		this.EVENT_CONTENTS = EVENT_CONTENTS;
	}
	public String getEventGoods() {
		return EVENT_GOODS;
	}
	public void setEventGoods(String EVENT_GOODS) {
		this.EVENT_GOODS = EVENT_GOODS;
	}
	public String getEventStart() {
		return sdf.format(EVENT_START);
	}
	public void setEventStart(Date EVENT_START) {
		this.EVENT_START = EVENT_START;
	}
	public String getEventEnd() {
		return sdf.format(EVENT_END);
	}
	public void setEventEnd(Date EVENT_END) {
		this.EVENT_END = EVENT_END;
	}
	public String getEventOngoing() {
		if (EVENT_ONGOING == '1') return "진행중"; 
		else return "미진행";
	}
	public void setEventOngoing(char EVENT_ONGOING) {
		this.EVENT_ONGOING = EVENT_ONGOING;
	}
	public String getEventImageurl() {
		return EVENT_IMAGEURL;
	}
	public void setEventImageurl(String EVENT_IMAGEURL) {
		this.EVENT_IMAGEURL = EVENT_IMAGEURL;
	}
	public int getEventEmotions() {
		return EVENT_EMOTIONS;
	}
	public void setEventEmotions(int EVENT_EMOTIONS) {
		this.EVENT_EMOTIONS = EVENT_EMOTIONS;
	}
	
	
}
