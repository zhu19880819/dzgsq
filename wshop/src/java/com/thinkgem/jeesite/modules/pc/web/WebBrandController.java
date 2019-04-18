package com.thinkgem.jeesite.modules.pc.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.utils.excel.UrlUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.prod.entity.WsBrand;
import com.thinkgem.jeesite.modules.prod.service.WsBrandService;

/**
 * PC端品牌 管理
 */
@Controller
@RequestMapping(value = "${webPath}/brand")
public class WebBrandController extends BaseController{
	
	@Autowired
	private WsBrandService wsBrandService;
	
	/**
	 * 品牌列表
	 */
	@RequestMapping(value="list")
	public String list(Model model) {
		/**
		 * 查询首页品牌列表
		 */
		WsBrand wsBrand=new WsBrand();
		List<WsBrand> bandList=wsBrandService.findList(wsBrand);
		//将图片地址转换为网络地址
		for (WsBrand brand:bandList) {
			brand.setLogo(UrlUtils.getNetUrl(brand.getLogo()));
		}
		model.addAttribute("bandList", bandList);
		return "modules/pc/webBrandList";
	}
	
}
