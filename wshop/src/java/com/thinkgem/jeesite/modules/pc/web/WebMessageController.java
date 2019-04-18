package com.thinkgem.jeesite.modules.pc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.member.entity.WsMessage;
import com.thinkgem.jeesite.modules.member.entity.WsMessageRecord;
import com.thinkgem.jeesite.modules.member.service.WsMessageRecordService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 系统消息Controller
 * @author 大胖老师
 * @version 2017-10-09
 */
@Controller
@RequestMapping(value = "${webPath}/message")
public class WebMessageController extends BaseController {

	@Autowired
	private WsMessageRecordService wsMessageRecordService;


	
	@RequestMapping(value = "list")
	public String list(String msgType, HttpServletRequest request, HttpServletResponse response, Model model) {
		/**
		 * 获取用户信息
		 */
		WsMember member=(WsMember) UserUtils.getSession().getAttribute("wsMember");
		/**
		 * 获取消息列表
		 */
		WsMessageRecord wsMessageRecord=new WsMessageRecord();
		wsMessageRecord.setMemberId(member.getId());
		WsMessage wsMessage=new WsMessage();
		if(StringUtils.isNotEmpty(msgType)){
			wsMessage.setMsgType(msgType);
			wsMessageRecord.setWsMessage(wsMessage);
		}	
		Page<WsMessageRecord> page = wsMessageRecordService.findPage(new Page<WsMessageRecord>(request, response),wsMessageRecord);
		if(page.getList()!=null && page.getList().size()>0) {
			wsMessageRecord = page.getList().get(0);
		}
		model.addAttribute("wsMessageRecord", wsMessageRecord);
		model.addAttribute("wsMessageRecordList", page.getList());
		return "modules/pc/hd_inform";
	}

}