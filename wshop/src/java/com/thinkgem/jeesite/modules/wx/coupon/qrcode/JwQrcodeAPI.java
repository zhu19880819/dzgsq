package com.thinkgem.jeesite.modules.wx.coupon.qrcode;

import com.thinkgem.jeesite.modules.wx.core.exception.WexinReqException;
import com.thinkgem.jeesite.modules.wx.core.req.WeiXinReqService;
import com.thinkgem.jeesite.modules.wx.coupon.qrcode.model.Getticket;
import com.thinkgem.jeesite.modules.wx.coupon.qrcode.model.GetticketRtn;
import com.thinkgem.jeesite.modules.wx.coupon.qrcode.model.QrcodeInfo;
import com.thinkgem.jeesite.modules.wx.coupon.qrcode.model.QrcodeRtnInfo;

import net.sf.json.JSONObject;


/**
 * 微信卡券 - 卡券投放
 * @author lihongxuan
 *
 */
public class JwQrcodeAPI {

	/**
	 * 创建二维码
	 * @throws WexinReqException 
	 */
	public static QrcodeRtnInfo doAddQrcode(String accesstoken,QrcodeInfo qrcodeInfo) throws WexinReqException {
		if (accesstoken != null) {
			qrcodeInfo.setAccess_token(accesstoken);
			JSONObject result = WeiXinReqService.getInstance().doWeinxinReqJson(qrcodeInfo);
			QrcodeRtnInfo qrcodeRtnInfo = (QrcodeRtnInfo)JSONObject.toBean(result, QrcodeRtnInfo.class);
			return qrcodeRtnInfo;
		}
		return null;
	}

	/**
	 * 获取api_ticket
	 */
	public static GetticketRtn doGetticket(String accesstoken)throws WexinReqException {
		if (accesstoken != null) {
			Getticket gk = new Getticket();
			gk.setAccess_token(accesstoken);
			JSONObject result = WeiXinReqService.getInstance().doWeinxinReqJson(gk);
			GetticketRtn getticketRtn = (GetticketRtn)JSONObject.toBean(result, GetticketRtn.class);
			return getticketRtn;
		}
		return null;
	}

}
 