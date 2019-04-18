package com.thinkgem.jeesite.modules.interwap.web;

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

import com.thinkgem.jeesite.common.utils.excel.UrlUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.config.entity.WsAd;
import com.thinkgem.jeesite.modules.config.service.WsAdService;
import com.thinkgem.jeesite.modules.inter.common.InterConstant;
import com.thinkgem.jeesite.modules.prod.entity.WsProdCategory;
import com.thinkgem.jeesite.modules.prod.entity.WsProduct;
import com.thinkgem.jeesite.modules.prod.service.WsProdCategoryService;
import com.thinkgem.jeesite.modules.prod.service.WsProductService;
import com.thinkgem.jeesite.modules.ws.utils.WsConstant;

/**
 * 微信首页接口
 * @author 大胖老师
 * @version 2017-10-08
 */
@Controller
@RequestMapping(value = "${wapPath}")
public class IndexWapController extends BaseController {
	
	@Autowired
	private WsAdService wsAdService;
	
	@Autowired
	private WsProductService wsProductService;
	
	@Autowired
	private WsProdCategoryService wsProdCategoryService;
	
	@RequestMapping(value = {"index", ""})
	@ResponseBody
	@CrossOrigin
	public Map<String,Object> index(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> data=new HashMap<String,Object>();
		try{
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
			 * 查询首页活动列表
			 */
			WsAd adActivity=new WsAd();
			adActivity.setImgType(InterConstant.IMG_TYPE_ACTIVITY);
			List<WsAd> adActivityList=wsAdService.findList(adActivity);
			//将图片地址转换为网络地址
			for (WsAd ad:adActivityList) {
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
			 * 查询分类
			 */
			WsProdCategory wsProdCategory=new WsProdCategory();
			List<WsProdCategory> wsProdCategoryList=wsProdCategoryService.findList(wsProdCategory);
			for (WsProdCategory prodCat:wsProdCategoryList) {
				prodCat.setImageUrl(UrlUtils.getNetUrl(prodCat.getImageUrl()));
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
			data.put("adBannerList",adBannerList);
			data.put("adActivityList",adActivityList);
			data.put("adBandList",adBandList);
			data.put("wsProductList",wsProductList);
			data.put("wsProdCategoryList",wsProdCategoryList);
		}catch(Exception e){
			data.put("ret",InterConstant.RET_FAILED);
			data.put("msg",e.getMessage());
			logger.error("index",e);
		}
		return data;
	}


}