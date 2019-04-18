package com.thinkgem.jeesite.modules.pc.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.utils.UserAgentUtils;
import com.thinkgem.jeesite.common.utils.excel.UrlUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.config.entity.WsAd;
import com.thinkgem.jeesite.modules.config.service.WsAdService;
import com.thinkgem.jeesite.modules.inter.common.InterConstant;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.prod.entity.WsProdCategory;
import com.thinkgem.jeesite.modules.prod.entity.WsProduct;
import com.thinkgem.jeesite.modules.prod.service.WsProdCategoryService;
import com.thinkgem.jeesite.modules.prod.service.WsProductService;
import com.thinkgem.jeesite.modules.prod.utils.ProdUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.ws.utils.WsConstant;

/**
 * PC端商城首页
 *
 */
@Controller
@RequestMapping(value = "/")
public class WebIndexController extends BaseController{
	
	
	@Autowired
	private WsProductService wsProductService;
	
	@Autowired
	private WsProdCategoryService wsProdCategoryService;
	
	@Autowired
	private WsAdService wsAdService;
	
	
	/**
	 * 网站首页
	 */
	@RequestMapping
	public String index(HttpServletRequest request,Model model) {
		/**
		 * 手机端访问跳转到手机端页面
		 */
		if(UserAgentUtils.isMobileOrTablet(request)){
			String wapurl=ProdUtils.getParam("wapurl").getParamValue();
			return "redirect:"+wapurl;
		}
		
		/**
		 * 查询分类
		 */
		WsMember member = (WsMember) UserUtils.getSession().getAttribute("member");
		WsProdCategory wsProdCategory=new WsProdCategory();
		List<WsProdCategory> wsProdCategoryList=wsProdCategoryService.findList(wsProdCategory);
		for (WsProdCategory prodCat:wsProdCategoryList) {
			prodCat.setImageUrl(UrlUtils.getNetUrl(prodCat.getImageUrl()));
		}
		/**
		 * 查询首页轮播图广告
		 */
		WsAd wsAdBanner=new WsAd();
		wsAdBanner.setImgType(InterConstant.IMG_TYPE_SLIDE);
		List<WsAd> adBannerList=wsAdService.findList(wsAdBanner);
		//将图片地址转换为网络地址
		for (WsAd ad:adBannerList) {
			ad.setImgUrl(UrlUtils.getNetUrl(ad.getImgUrl()));
		}
		/**
		 * 查询首页品牌列表
		 */
		WsAd adBand=new WsAd();
		adBand.setImgType(InterConstant.IMG_TYPE_BAND);
		List<WsAd> adBandList=wsAdService.findList(adBand);
		//将图片地址转换为网络地址
		for (WsAd ad:adBandList) {
			ad.setImgUrl(UrlUtils.getNetUrl(ad.getImgUrl()));
		}
		/**
		 * 查询首页推荐商品
		 */
		WsProduct wsProduct=new WsProduct();
		wsProduct.setOnGoodState(WsConstant.YES);
		wsProduct.setIsHomeRecommd(InterConstant.YES);
		List<WsProduct> wsProductList=wsProductService.findList(wsProduct);
		for (WsProduct prod:wsProductList) {
			prod.setProdImage(UrlUtils.getNetUrl(prod.getProdImage()));
		}
		model.addAttribute("wsProdCategoryList", wsProdCategoryList);
		model.addAttribute("adBannerList", adBannerList);
		model.addAttribute("adBandList", adBandList);
		model.addAttribute("wsProductList", wsProductList);
		model.addAttribute("member", member);
		return "modules/pc/webIndex";
	}
	
}
