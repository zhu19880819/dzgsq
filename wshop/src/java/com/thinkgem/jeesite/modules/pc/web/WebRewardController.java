package com.thinkgem.jeesite.modules.pc.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * PC端邀请奖励
 *
 */
@Controller
@RequestMapping(value = "${webPath}/reward")
public class WebRewardController extends BaseController{
	
	
	
	
	/**
	 * 奖励页面
	 */
	@RequestMapping(value="index")
	public String index(Model model) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		return "modules/pc/webRewardIndex";
	}
	
}
