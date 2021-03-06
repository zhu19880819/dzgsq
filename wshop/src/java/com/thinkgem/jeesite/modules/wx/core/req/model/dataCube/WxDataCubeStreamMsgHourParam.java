package com.thinkgem.jeesite.modules.wx.core.req.model.dataCube;

import com.thinkgem.jeesite.modules.wx.core.annotation.ReqType;
import com.thinkgem.jeesite.modules.wx.core.req.model.WeixinReqParam;

/**
 * 参数类--获取消息分送分时数据
 * @author luweichao
 *
 * 2015年1月27日
 */
@ReqType("getupstreammsghour")
public class WxDataCubeStreamMsgHourParam extends WeixinReqParam {
	
	// 开始时间
	private String begin_date = null;
	
	// 结束时间
	private String end_date = null;

	public String getBegin_date() {
		return begin_date;
	}

	public void setBegin_date(String begin_date) {
		this.begin_date = begin_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
}
