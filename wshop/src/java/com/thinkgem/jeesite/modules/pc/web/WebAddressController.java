package com.thinkgem.jeesite.modules.pc.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.WxException;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.member.entity.WsAddress;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.member.service.WsAddressService;
import com.thinkgem.jeesite.modules.member.service.WsMemberService;
import com.thinkgem.jeesite.modules.sys.service.AreaService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 收货地址接口
 * @author 大胖老师
 * @version 2017-10-08
 */
@Controller
@RequestMapping(value = "${webPath}/address")
public class WebAddressController extends BaseController {
	
	@Autowired
	private WsAddressService wsAddressService;
	
	@Autowired
	private WsMemberService wsMemberService;
	
	@Autowired
	private AreaService areaService;

    @RequestMapping(value = {"list", ""})
    public String list(String id, HttpServletRequest request, HttpServletResponse response, Model model) {

        try{
            /**
             * 获取用户信息
             */
    		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
    		if(wsMember ==null) {
    			return "redirect:/web/userCenter/loginPage";
    		}
            /**
             * 查询用户地址列表
             */
            WsAddress wsAddress = new WsAddress();
            wsAddress.setWsMember(wsMember);
            List<WsAddress> wsAddressList = wsAddressService.findList(wsAddress);
            model.addAttribute("wsAddressList", wsAddressList);

            if (id != null) {
                 for (WsAddress ws : wsAddressList) {
                     if (id.equals(ws.getId())) {
                         model.addAttribute("ws", ws);
                         break;
                     }
                 }
            }

        }catch(Exception e){
            logger.error("address/list", e);
        }

        return "modules/pc/webUserAddress";
    }

    /**
     * 保存地址
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "save")
    public String save(WsAddress wsAddress, HttpServletRequest request, HttpServletResponse response, Model model) {

        try{
            /**
             * 获取用户信息
             */
    		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
    		if(wsMember ==null) {
    			return "redirect:/web/userCenter/loginPage";
    		}
            wsAddress.setWsMember(wsMember);
            /**
             * 查询用户地址列表
             */
            wsAddressService.save(wsAddress);
        }catch(WxException e){
        }catch(Exception e){
            logger.error("address/save", e);
        }

        return "redirect:" + Global.getConfig("webPath") + "/address/?repage";
    }

    /**
     * 删除地址
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "delete")
    public String delete(WsAddress wsAddress, HttpServletRequest request, HttpServletResponse response, Model model) {
        wsAddressService.delete(wsAddress);
        return "redirect:" + Global.getConfig("webPath") + "/address/?repage";
    }
	

}