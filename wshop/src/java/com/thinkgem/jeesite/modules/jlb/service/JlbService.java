package com.thinkgem.jeesite.modules.jlb.service;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.SLEmojiFilter;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.UrlUtils;
import com.thinkgem.jeesite.modules.config.entity.WsMrank;
import com.thinkgem.jeesite.modules.config.service.WsMrankService;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.member.service.WsMemberService;
import com.thinkgem.jeesite.modules.ws.entity.WxKeyResponse;
import com.thinkgem.jeesite.modules.ws.entity.WxMaterialAudio;
import com.thinkgem.jeesite.modules.ws.entity.WxMaterialNewsItem;
import com.thinkgem.jeesite.modules.ws.entity.WxMaterialPhoto;
import com.thinkgem.jeesite.modules.ws.entity.WxMaterialText;
import com.thinkgem.jeesite.modules.ws.entity.WxMaterialVideo;
import com.thinkgem.jeesite.modules.ws.entity.WxMenu;
import com.thinkgem.jeesite.modules.ws.entity.WxSubscribe;
import com.thinkgem.jeesite.modules.ws.resp.Article;
import com.thinkgem.jeesite.modules.ws.resp.Image;
import com.thinkgem.jeesite.modules.ws.resp.ImageMessageResp;
import com.thinkgem.jeesite.modules.ws.resp.NewsMessageResp;
import com.thinkgem.jeesite.modules.ws.resp.TextMessageResp;
import com.thinkgem.jeesite.modules.ws.resp.Video;
import com.thinkgem.jeesite.modules.ws.resp.VideoMessageResp;
import com.thinkgem.jeesite.modules.ws.resp.Voice;
import com.thinkgem.jeesite.modules.ws.resp.VoiceMessageResp;
import com.thinkgem.jeesite.modules.ws.utils.MessageUtil;
import com.thinkgem.jeesite.modules.ws.utils.WsConstant;
import com.thinkgem.jeesite.modules.ws.utils.WsUtils;
import com.thinkgem.jeesite.modules.wx.core.exception.WexinReqException;
import com.thinkgem.jeesite.modules.wx.wxuser.user.JwUserAPI;
import com.thinkgem.jeesite.modules.wx.wxuser.user.model.Wxuser;

@Service
@Transactional(readOnly = true)
public class JlbService extends BaseService implements Runnable{
	
	@Autowired
	private WsMemberService wsMemberService;
	
	@Autowired
	private WsMrankService wsMrankService;
	
	private HttpServletRequest jblRequest;
	
	@Transactional(readOnly = false)
	public String autoResponse() {
		String respMessage = null;
		try {
			// 默认返回的文本消息内容
			String respContent = "请求处理异常，请稍候尝试！";
			// xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(this.getJblRequest());
			// 发送方帐号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众帐号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");
			String msgId = requestMap.get("MsgId");
			//消息内容
			String content = requestMap.get("Content");
			logger.info("------------微信客户端发送请求---------------------   |   fromUserName:"+fromUserName+"   |   ToUserName:"+toUserName+"   |   msgType:"+msgType+"   |   msgId:"+msgId+"   |   content:"+content);
			// 默认回复此文本消息
			TextMessageResp textMessage = new TextMessageResp();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setContent(WsConstant.DEFAULT_REPLY_MSG);
			respMessage = MessageUtil.textMessageToXml(textMessage);
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				respMessage = doTextReply(requestMap, textMessage, respMessage, toUserName, fromUserName, respContent);
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
				//【微信触发类型】图片消息
				respContent = "您发送的是图片消息！"+WsConstant.DEFAULT_REPLY_MSG;
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
				//【微信触发类型】地理位置消息
				respContent = "您发送的是地理位置消息！"+WsConstant.DEFAULT_REPLY_MSG;
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
				//【微信触发类型】链接消息
				respContent = "您发送的是链接消息！"+WsConstant.DEFAULT_REPLY_MSG;
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
				//【微信触发类型】音频消息
				respContent = "您发送的是音频消息！"+WsConstant.DEFAULT_REPLY_MSG;
			}else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				//【微信触发类型】事件推送
				// 事件类型
				String eventType = requestMap.get("Event");
				// 关注
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					
				}
				// 取消关注
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息
				}
				// 自定义菜单点击事件
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					
				}else if (eventType.equals(MessageUtil.EVENT_TYPE_SCAN)) {
					
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return respMessage;
	}
	
	//文本消息处理
	private String doTextReply(Map<String, String> requestMap,TextMessageResp textMessage ,String respMessage
			,String toUserName,String fromUserName,String respContent){
		String content = requestMap.get("Content");
		WxKeyResponse wxKeyResponse=new WxKeyResponse();
		wxKeyResponse.setKeyword(content);
		
		return respMessage;
	}

	@Override
	public void run() {
		this.autoResponse();
	}

	public HttpServletRequest getJblRequest() {
		return jblRequest;
	}

	public void setJblRequest(HttpServletRequest jblRequest) {
		this.jblRequest = jblRequest;
	}
	
	
}
