package com.thinkgem.jeesite.modules.wx.core.req.model.user;

import com.thinkgem.jeesite.modules.wx.core.annotation.ReqType;
import com.thinkgem.jeesite.modules.wx.core.req.model.WeixinReqParam;

/**
 * 
 * 
 * @author sfli.sir
 * 
 */
@ReqType("groupMembersUpdate")
public class GroupMembersUpdate extends WeixinReqParam {
	
	private String openid;
	
	private String to_groupid;

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getTo_groupid() {
		return to_groupid;
	}

	public void setTo_groupid(String to_groupid) {
		this.to_groupid = to_groupid;
	}

	
}
