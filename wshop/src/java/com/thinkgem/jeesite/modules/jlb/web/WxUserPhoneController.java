package com.thinkgem.jeesite.modules.jlb.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.WxException;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.inter.common.InterConstant;
import com.thinkgem.jeesite.modules.jlb.entity.WxUserPhone;
import com.thinkgem.jeesite.modules.jlb.service.WxUserPhoneService;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.sms.request.SmsSendRequest;
import com.thinkgem.jeesite.modules.sms.response.SmsSendResponse;
import com.thinkgem.jeesite.modules.sms.utils.ChuangLanSmsUtil;
import com.thinkgem.jeesite.modules.sms.utils.CodeUtils;
import com.thinkgem.jeesite.modules.ws.utils.WsUtils;


/**
 * 会员手机Controller
 * @author 朱亚峰
 * @version 2019-04-14
 */
@Controller
@RequestMapping(value = "${wxPath}/phoneBind")
public class WxUserPhoneController extends BaseController{

	@Autowired
	private WxUserPhoneService wxUserPhoneService;
	
	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@ModelAttribute
	public WxUserPhone get(@RequestParam(required=false) String id) {
		WxUserPhone entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = wxUserPhoneService.get(id);
		}
		if (entity == null){
			entity = new WxUserPhone();
		}
		return entity;
	}
	
	/**
	 * 会员绑定手机号
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	@CrossOrigin
	public Map save(String phone, HttpServletRequest request, HttpServletResponse response) {
		Map data = new HashMap();
		try{
			/**
			 * 获取用户信息
			 */
			WsMember member=WsUtils.getMember(request, response);
			WxUserPhone wxUserPhone = new WxUserPhone();
			wxUserPhone.setOpenId(member.getOpenId());
			wxUserPhone.setPhone(phone);
			wxUserPhone.setScore(0);
			wxUserPhoneService.save(wxUserPhone);
			data.put("ret",InterConstant.RET_SUCCESS);
		}catch(WxException e){
			data.put("ret",InterConstant.RET_WX);
			data.put("appid",WsUtils.getAccount().getAccountAppid());
		}catch(Exception e){
			data.put("ret",InterConstant.RET_FAILED);
			data.put("msg","手机号绑定错误。");
			logger.error("phoneBind/save",e);
		}
		return data;
	}
	
	/**
	 * 当前微信用户是否绑定
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "getByOpenId")
	@ResponseBody
	@CrossOrigin
	public Map getByOpenId(HttpServletRequest request, HttpServletResponse response){
		logger.info("查询当前微信用户是否绑定");
		Map data = new HashMap();
		try{
			WsMember member = WsUtils.getMember(request, response);
			WxUserPhone wxUserPhone = wxUserPhoneService.getByOpenId(member.getOpenId());
			if (null != wxUserPhone) {
				logger.info("已经绑定了");
				data.put("ret",InterConstant.YES);
			} else {
				logger.info("未绑定");
				data.put("ret",InterConstant.NO);
			}
		}catch(WxException e){
			data.put("ret",InterConstant.RET_WX);
			data.put("appid",WsUtils.getAccount().getAccountAppid());
		}catch(Exception e){
			data.put("ret",InterConstant.RET_FAILED);
			data.put("msg",e.getMessage());
			logger.error("phoneBind/getByOpenId",e);
		}
		return data;
	}
	
	
	/**
	 * 获取验证码
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "getCode")
	@ResponseBody
	@CrossOrigin
	public Map getCode(HttpServletRequest request, HttpServletResponse response){
		Map data = new HashMap();
		try{
			String phone = request.getParameter("phone");
			String code = CodeUtils.getCode();
			String msg = "您好，您的验证码是" + code + "。如非本人操作，请忽略。";
			SmsSendRequest smsSingleRequest = new SmsSendRequest(msg, phone);
	        String requestJson = JSON.toJSONString(smsSingleRequest);
	        String responseText = ChuangLanSmsUtil.sendSmsByPost(smsSingleRequest.getHost(), requestJson);
	        SmsSendResponse smsSingleResponse = JSON.parseObject(responseText, SmsSendResponse.class);
	        if (smsSingleResponse.getCode().equals("0")) {  //成功
	        	data.put("code",code);
	        	data.put("ret",InterConstant.YES);
			} else {
				data.put("ret",InterConstant.NO);
			}
		}catch(WxException e){
			data.put("ret",InterConstant.RET_WX);
			data.put("appid",WsUtils.getAccount().getAccountAppid());
		}catch(Exception e){
			data.put("ret",InterConstant.RET_FAILED);
			data.put("msg",e.getMessage());
			logger.error("address/save",e);
		}
		return data;
	}
	
	@RequiresPermissions("member:wsMember:edit")
	@RequestMapping(value = "delete")
	public String delete(WxUserPhone wxUserPhone, RedirectAttributes redirectAttributes) {
		wxUserPhoneService.delete(wxUserPhone);
		addMessage(redirectAttributes, "删除会员资料成功");
		return "redirect:"+Global.getAdminPath()+"/member/wsMember/?repage";
	}
	
}
