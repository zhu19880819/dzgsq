package com.thinkgem.jeesite.modules.pc.web;

import java.math.BigDecimal;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.utils.excel.UrlUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.prod.entity.WsCart;
import com.thinkgem.jeesite.modules.prod.service.WsCartService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;



/**
 * PC端购物车
 *
 */
@Controller
@RequestMapping(value = "${webPath}/cart")
public class WebCartController extends BaseController{
	
	@Autowired
	private WsCartService wsCartService;
	
	/**
	 * 购物车
	 */
	@RequestMapping(value="index")
	public String index(Model model) {
		/**
		 * 获取用户信息
		 */
		WsMember member =(WsMember) UserUtils.getSession().getAttribute("wsMember");
		if(member ==null) {
			return "redirect:/web/userCenter/loginPage";
		}
		/**
		 * 查询购物车产品
		 */
		WsCart wsCart=new WsCart();
		wsCart.setMemberId(member.getId());
		List<WsCart> wsCartList=wsCartService.findList(wsCart);
		//图片路径转换
		for(WsCart cart:wsCartList){
			cart.setThumb(UrlUtils.getNetUrl(cart.getThumb()));
		}
		
		Integer num=0;
		BigDecimal totalPrice=new BigDecimal(0);
		for (WsCart cart : wsCartList) {
			 num+=cart.getQuantity();
			 BigDecimal cartnum=new BigDecimal(cart.getQuantity());
			 totalPrice=totalPrice.add(cart.getUnitPrice().multiply(cartnum));
		}
		model.addAttribute("num",num);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("wsCartList",wsCartList);
		return "modules/pc/webCart";
	}
	
	@RequestMapping(value = "delete")
	public String delete(WsCart wsCart, RedirectAttributes redirectAttributes,Model model) {
		wsCartService.delete(wsCart);
		return "redirect:/web/cart/index";
	}
	
	@RequestMapping(value = "batchdelete")
	public String batchdelete(@RequestParam(required=false) String id) {
		String[] numberArray = id.split(",");  
		for(int i = 0;i<numberArray.length;i++){
			wsCartService.delete(new WsCart(numberArray[i]));
		}
		return "redirect:/web/cart/index";
	}
	
}
