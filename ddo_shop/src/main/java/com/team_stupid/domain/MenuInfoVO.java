package com.team_stupid.domain;

public class MenuInfoVO {
	
	private int MENU_NUM;
	private String MENU_SHOP_SERIALNUM;
	private String MENU_TITLE;
	private String MENU_PRICE;
	private String MENU_IMAGEURL;
	
	
	public int getMenuNum() {
		return MENU_NUM;
	}
	public void setMENU_NUM(int mENU_NUM) {
		MENU_NUM = mENU_NUM;
	}
	public String getMenuShopSerialNum() {
		return MENU_SHOP_SERIALNUM;
	}
	public void setMENU_SHOP_SERIALNUM(String mENU_SHOP_SERIALNUM) {
		MENU_SHOP_SERIALNUM = mENU_SHOP_SERIALNUM;
	}
	public String getMenuTitle() {
		return MENU_TITLE;
	}
	public void setMENU_TITLE(String mENU_TITLE) {
		MENU_TITLE = mENU_TITLE;
	}
	public String getMenuPrice() {
		return MENU_PRICE;
	}
	public void setMENU_PRICE(String mENU_PRICE) {
		MENU_PRICE = mENU_PRICE;
	}
	public String getMenuImageUrl() {
		return MENU_IMAGEURL;
	}
	public void setMENU_IMAGEURL(String mENU_IMAGEURL) {
		MENU_IMAGEURL = mENU_IMAGEURL;
	}
}
