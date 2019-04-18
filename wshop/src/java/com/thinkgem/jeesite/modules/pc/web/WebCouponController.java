package com.thinkgem.jeesite.modules.pc.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.service.WxException;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.activity.entity.WsActivityCoupon;
import com.thinkgem.jeesite.modules.activity.service.WsActivityCouponService;
import com.thinkgem.jeesite.modules.inter.common.InterConstant;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.member.entity.WsMemberCoupon;
import com.thinkgem.jeesite.modules.member.service.WsMemberCouponService;
import com.thinkgem.jeesite.modules.member.service.WsMemberService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.ws.utils.WsConstant;
import com.thinkgem.jeesite.modules.ws.utils.WsUtils;

/**
 * 优惠券接口
 * 
 * @author
 * @version 2017-10-08
 */
@Controller
@RequestMapping(value = "${webPath}/coupon")
public class WebCouponController extends BaseController {

	@Autowired
	private WsMemberService wsMemberService;

	@Autowired
	private WsActivityCouponService wsActivityCouponService;

	@Autowired
	private WsMemberCouponService wsMemberCouponService;

	@RequestMapping(value = { "index", "" })
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		WsMember wsMember = (WsMember) UserUtils.getSession().getAttribute("wsMember");
		if (wsMember == null) {
			return "redirect:/web/userCenter/loginPage";
		}
		/**
		 * 查询可兑换优惠券
		 */
		WsActivityCoupon wsActivityCoupon = new WsActivityCoupon();
		wsActivityCoupon.setState(WsConstant.YES);
		List<WsActivityCoupon> wsActivityCouponList = wsActivityCouponService.findList(wsActivityCoupon);
		/**
		 * 查询待使用优惠券
		 */
		WsMemberCoupon wsMemberCoupon = new WsMemberCoupon(wsMember);
		wsMemberCoupon.setState(WsConstant.COUPON_TO_USE);
		List<WsMemberCoupon> toUseCouponList = wsMemberCouponService.findList(wsMemberCoupon);
		/**
		 * 已使用
		 */
		wsMemberCoupon.setState(WsConstant.COUPON_USED);
		List<WsMemberCoupon> usedCouponList = wsMemberCouponService.findList(wsMemberCoupon);
		/**
		 * 已过期
		 */
		wsMemberCoupon.setState(WsConstant.COUPON_EXPIRED);
		List<WsMemberCoupon> expiredCouponList = wsMemberCouponService.findList(wsMemberCoupon);
		model.addAttribute("wsActivityCouponList", wsActivityCouponList);
		model.addAttribute("toUseCouponList", toUseCouponList);
		model.addAttribute("usedCouponList", usedCouponList);
		model.addAttribute("expiredCouponList", expiredCouponList);
		return "modules/pc/webUserCoupon";
	}

	/**
	 * 兑换优惠券
	 */
	@RequestMapping(value = "convert")
	@ResponseBody
	@CrossOrigin
	public Map convert(String couponId, HttpServletRequest request, HttpServletResponse response, Model model) {
		Map data = new HashMap();
		try {
			// 查询当前用户信息
			WsMember member = WsUtils.getMember(request, response);
			/**
			 * 兑换优惠券
			 */
			wsMemberCouponService.saveCoupon(couponId, member);
			/**
			 * 查询待使用优惠券
			 */
			WsMemberCoupon coupon = new WsMemberCoupon(member);
			coupon.setState(WsConstant.COUPON_TO_USE);
			List<WsMemberCoupon> toUseCouponList = wsMemberCouponService.findList(coupon);
			data.put("ret", InterConstant.RET_SUCCESS);
			data.put("toUseCouponList", toUseCouponList);
		} catch (WxException e) {
			data.put("ret", InterConstant.RET_WX);
			data.put("appid", WsUtils.getAccount().getAccountAppid());
		} catch (Exception e) {
			data.put("ret", InterConstant.RET_FAILED);
			data.put("msg", e.getMessage());
			logger.error("coupon/convert", e);
		}
		return data;
	}

}