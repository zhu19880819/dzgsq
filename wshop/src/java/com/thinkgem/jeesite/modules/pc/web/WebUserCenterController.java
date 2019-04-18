package com.thinkgem.jeesite.modules.pc.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.excel.UrlUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.inter.common.InterConstant;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.member.entity.WsMemberCollectLog;
import com.thinkgem.jeesite.modules.member.entity.WsMemberVisitLog;
import com.thinkgem.jeesite.modules.member.service.WsMemberCollectLogService;
import com.thinkgem.jeesite.modules.member.service.WsMemberService;
import com.thinkgem.jeesite.modules.member.service.WsMemberVisitLogService;
import com.thinkgem.jeesite.modules.order.entity.WsOrder;
import com.thinkgem.jeesite.modules.order.entity.WsOrderItem;
import com.thinkgem.jeesite.modules.order.service.WsOrderItemService;
import com.thinkgem.jeesite.modules.order.service.WsOrderService;
import com.thinkgem.jeesite.modules.prod.entity.WsProduct;
import com.thinkgem.jeesite.modules.prod.service.WsProductService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.ws.utils.WsConstant;

/**
 * PC端个人中心首页
 *
 */
@Controller
@RequestMapping(value = "${webPath}/userCenter")
public class WebUserCenterController extends BaseController {

	@Autowired
	private WsMemberService wsMemberService;

	@Autowired
	private WsMemberVisitLogService wsMemberVisitLogService;

	@Autowired
	private WsMemberCollectLogService wsMemberCollectLogService;

	@Autowired
	private WsOrderService wsOrderService;
	
	@Autowired
	private WsProductService wsProductService;
	
	@Autowired
	private WsOrderItemService wsOrderItemService;
	

	/**
	 * 个人中心首页
	 */
	@RequestMapping(value = "index")
	public String index(Model model) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		/**
		 * 爆款商品
		 */
		Page<WsProduct> page =new Page<>();
		WsProduct wsProduct = new WsProduct();
		wsProduct.setIsHomeRecommd(InterConstant.YES);
		List<WsProduct> productList=wsProductService.findPage(page, wsProduct).getList();
		/**
		 * 查询全部订单
		 */
		WsOrder wsOrder=new WsOrder();
		wsOrder.setMemberId(wsMember);
		List<WsOrder> wsAllOrderList=wsOrderService.findList(wsOrder);
		List<WsOrderItem> wsAllOrderItemList=new ArrayList<WsOrderItem>();
		for (WsOrder order:wsAllOrderList) {
			WsOrderItem wsOrderItem=new WsOrderItem();
			wsOrderItem.setWsOrder(order);
			List<WsOrderItem> wsOrderItemList=wsOrderItemService.findList(wsOrderItem);
			for(WsOrderItem item:wsOrderItemList){
				item.setThumb(UrlUtils.getNetUrl(item.getThumb()));
				item.setWsOrder(order);
			}
			wsAllOrderItemList.addAll(wsOrderItemList);
		}
		/**
		 * 查询当前用户待付款订单
		 */
	
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_PAY);
		List<WsOrder> waiePayOrderList = wsOrderService.findList(wsOrder);
		/**
		 * 查询当前用户待发货订单
		 */
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_SEND);
		List<WsOrder> waieSendOrderList = wsOrderService.findList(wsOrder);
		/**
		 * 查询当前用户待收货订单
		 */
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_RECEVIED);
		List<WsOrder> waieReceviedOrderList = wsOrderService.findList(wsOrder);
		/**
		 * 查询当前用户待评价订单
		 */
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_EVALUATION);
		List<WsOrder> waieEvaluationOrderList = wsOrderService.findList(wsOrder);
		/**
		 * 退款中的订单
		 */
		wsOrder.setOrderState(WsConstant.ORDER_STATE_WAITE_BACK);
		List<WsOrder> waieBackOrderList = wsOrderService.findList(wsOrder);
		model.addAttribute("wsMember", wsMember);
		model.addAttribute("wsAllOrderItemList", wsAllOrderItemList);
		model.addAttribute("waiePayOrderList", waiePayOrderList);
		model.addAttribute("waieSendOrderList", waieSendOrderList);
		model.addAttribute("waieReceviedOrderList", waieReceviedOrderList);
		model.addAttribute("waieEvaluationOrderList", waieEvaluationOrderList);
		model.addAttribute("waieBackOrderList", waieBackOrderList);		
		model.addAttribute("productList", productList);		
		return "modules/pc/webUserCenter";
	}
	
	
	@RequestMapping(value = "userInfo")
	public String userInfo(Model model) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		model.addAttribute("wsMember", wsMember);
		return "modules/pc/webUserInfo";
	}
	//修改登录密码
	@RequestMapping(value = "userPwd")
	public String userPwd(Model model) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		model.addAttribute("wsMember", wsMember);
		return "modules/pc/webPwdModify";
	}
	/**
	  * 修改登录密码步骤1
	 */
	@RequestMapping(value = "userPwdModify")
	public String userPwdModify(Model model,RedirectAttributes redirectAttributes) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			addMessage(redirectAttributes, "请先登录！再修改密码");
			return "redirect:/web/userCenter/loginPage";
		}
		
		return "modules/pc/webPwdModifyStep1";
	}
	
	/**
	  * 修改登录密码步骤2
	 */
	@RequestMapping(value = "userPwdModify2")
	public String userPwdModify2(Model model,String password,RedirectAttributes redirectAttributes) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		if(wsMember.getPassword().equals(password)) {
			model.addAttribute("wsMember", wsMember);
			return "modules/pc/webPwdModifyStep2";
		}else{
			if(password!=null||password!=""){
				model.addAttribute("message", "请填写登录密码！");
			}
			model.addAttribute("message", "密码输入错误，请重新输入！");
			return "modules/pc/webPwdModifyStep1";
		}
	}
	
	/**
	  * 修改登录密码步骤3
	 */
	@RequestMapping(value = "userPwdModify3")
	public String userPwdModify3(Model model,String newPassword) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		wsMember.setPassword(newPassword);
		wsMemberService.save(wsMember);
		return "modules/pc/webPwdModifyStep3";
	}
	
	@RequestMapping(value = "userScore")
	public String userScore(Model model) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		model.addAttribute("wsMember", wsMember);
		return "modules/pc/webUserScore";
	}
	
	@RequestMapping(value = "userBalance")
	public String userBalance(Model model) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		model.addAttribute("wsMember", wsMember);
		return "modules/pc/webUserBalance";
	}
	
	@RequestMapping(value = "userCollect")
	public String userCollect(Model model) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		/**
		 * 查询用户收藏
		 */
		WsMemberCollectLog wsMemberCollectLog=new WsMemberCollectLog();
		wsMemberCollectLog.setWsMember(wsMember);
		List<WsMemberCollectLog> wsMemberCollectLogList=wsMemberCollectLogService.findList(wsMemberCollectLog);
		for (WsMemberCollectLog collectLog:wsMemberCollectLogList) {
			collectLog.getWsProduct().setProdImage(UrlUtils.getNetUrl(collectLog.getWsProduct().getProdImage()));
		}
		model.addAttribute("wsMember", wsMember);
		model.addAttribute("wsMemberCollectLogList", wsMemberCollectLogList);
		return "modules/pc/webUserCollect";
	}
	
	@RequestMapping(value = "userFoot")
	public String userFoot(Model model) {
		WsMember wsMember =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(wsMember ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		/**
		 * 查询用户访问记录
		 */
		WsMemberVisitLog wsMemberVisitLog=new WsMemberVisitLog();
		wsMemberVisitLog.setWsMember(wsMember);
		Page<WsMemberVisitLog> page=wsMemberVisitLogService.findPage(new Page<WsMemberVisitLog>(), wsMemberVisitLog);
		for (WsMemberVisitLog visitLog:page.getList()) {
			visitLog.getWsProduct().setProdImage(UrlUtils.getNetUrl(visitLog.getWsProduct().getProdImage()));
		}
		model.addAttribute("wsMember", wsMember);
		model.addAttribute("wsMemberVisitLogList", page.getList());
		return "modules/pc/webUserFoot";
	}
	
	/**
	 * 登录页面
	 */
	@RequestMapping(value = "loginPage")
	public String loginPage(Model model) {
		return "modules/pc/webUserLogin";
	}
	
	/**
	 * 登录页面
	 */
	@RequestMapping(value = "login")
	public String login(String mobile,String password,Model model) {
		WsMember member = wsMemberService.getByMobile(mobile);
		if(member != null && member.getPassword().equals(password)){
			UserUtils.getSession().setAttribute("wsMember", member);
			return "redirect:/";
		}else{
			model.addAttribute("message", "账号密码不正确！");
			return "modules/pc/webUserLogin";
		}
		
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "loginOut")
	public String loginOut(Model model) {
		UserUtils.getSession().removeAttribute("wsMember");
		return "redirect:/";
		
	}
	
	/**
	 * 注册页面
	 */
	@RequestMapping(value = "registerPage")
	public String registerPage(Model model) {
		return "modules/pc/webUserRegister";
	}
	
	
	/**
	 * 注册账号
	 */
	@RequestMapping(value = "saveRegister")
	public String saveRegister(String mobile,String password,Model model) {
		WsMember member = wsMemberService.getByMobile(mobile);
		if(member != null && member.getPassword().equals(password)){
			UserUtils.getSession().setAttribute("wsMember", member);
			return "redirect:/";
		}else{
			model.addAttribute("message", "账号密码不正确！");
			return "modules/pc/webUserLogin";
		}
	}
	
	/**
	 * 忘记密码页面
	 */
	@RequestMapping(value = "forgetPage")
	public String forget(Model model) {
		return "modules/pc/webUserForget";
	}
	
	
	/**
	 * 找回忘记密码信息
	 */
	@RequestMapping(value = "forget")
	public String forget(String mobile,String password,Model model) {
		WsMember member = wsMemberService.getByMobile(mobile);
		if(member != null && member.getPassword().equals(password)){
			UserUtils.getSession().setAttribute("wsMember", member);
			return "redirect:/";
		}else{
			model.addAttribute("message", "账号密码不正确！");
			return "modules/pc/webUserLogin";
		}
		
	}
	
	
	/**
	 * 我的订单
	 */
	@RequestMapping(value = "userOrderList")
	public String userOrderList(Model model) {
		return "modules/pc/webUserRegister";
	}
	
}
