package com.thinkgem.jeesite.modules.jlb.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class WxUserPhone extends DataEntity<WxUserPhone>{

	private static final long serialVersionUID = 1L;
	private String openId;		// 微信端唯一标识=个人在微信中的id
	private String phone;		// 手机
	private int score;		// 积分
	
	
	public WxUserPhone() {
		super();
	}

	public WxUserPhone(String id){
		super(id);
	}
	
	@Length(min=0, max=200, message="微信端唯一标识=个人在微信中的id长度必须介于 0 和 200 之间")
	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}
	
	@Length(min=0, max=64, message="手机长度必须介于 0 和 64 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

}
