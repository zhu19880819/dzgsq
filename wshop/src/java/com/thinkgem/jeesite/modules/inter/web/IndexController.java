package com.thinkgem.jeesite.modules.inter.web;

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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.WxException;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.UrlUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.config.entity.WsAd;
import com.thinkgem.jeesite.modules.config.service.WsAdService;
import com.thinkgem.jeesite.modules.inter.common.InterConstant;
import com.thinkgem.jeesite.modules.member.entity.WsMember;
import com.thinkgem.jeesite.modules.member.entity.WsMessageRecord;
import com.thinkgem.jeesite.modules.member.service.WsMessageRecordService;
import com.thinkgem.jeesite.modules.prod.entity.WsProdCategory;
import com.thinkgem.jeesite.modules.prod.entity.WsProduct;
import com.thinkgem.jeesite.modules.prod.service.WsProdCategoryService;
import com.thinkgem.jeesite.modules.prod.service.WsProductService;
import com.thinkgem.jeesite.modules.sys.service.SysParamService;
import com.thinkgem.jeesite.modules.ws.entity.WxAccount;
import com.thinkgem.jeesite.modules.ws.utils.WsConstant;
import com.thinkgem.jeesite.modules.ws.utils.WsUtils;
import com.thinkgem.jeesite.modules.wx.js.WxConfig;

/**
 * 微信首页接口
 * @author 大胖老师
 * @version 2017-10-08
 */
@Controller
@RequestMapping(value = "${wxPath}")
public class IndexController extends BaseController {
	
	@Autowired
	private WsMessageRecordService wsMessageRecordService;
	
	@Autowired
	private WsAdService wsAdService;
	
	@Autowired
	private SysParamService sysParamService;
	
	@Autowired
	private WsProductService wsProductService;
	
	@Autowired
	private WsProdCategoryService wsProdCategoryService;
	
	@RequestMapping(value = {"index", ""})
	@ResponseBody
	@CrossOrigin
	public Map index(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> data=new HashMap();
		try{
			/**
			 * 获取用户信息
			 */
			WsMember member=WsUtils.getMember(request, response);
			/**
			 * 获取未读消息数量
			 */
			WsMessageRecord wsMessageRecord=new WsMessageRecord();
			wsMessageRecord.setMemberId(member.getId());
			wsMessageRecord.setReadFlag(InterConstant.NO);
			int messagenum=wsMessageRecordService.findCount(wsMessageRecord);
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
			WsProdCategory parent = new WsProdCategory();
			parent.setId("04d9d4e659754f6598e1bff48d128481");  //只查询积分商品的分类
			WsProdCategory wsProdCategory=new WsProdCategory();
			wsProdCategory.setParent(parent);
			wsProdCategory.setId("04d9d4e659754f6598e1bff48d128481");
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
			wsProduct.setIsGift("2");   //默认查询积分商品
			List<WsProduct> wsProductList=wsProductService.findList(wsProduct);
			for (WsProduct prod:wsProductList) {
				prod.setProdImage(UrlUtils.getNetUrl(prod.getProdImage()));
			}
			/**
			 * 查询自定义分享信息
			 */
			String title=sysParamService.getByParamCode(WsConstant.SHARE_TITLE).getParamValue().replaceAll("nickname", member.getNickname());
			String desc=sysParamService.getByParamCode(WsConstant.SHARE_DESC).getParamValue().replaceAll("nickname", member.getNickname());
			String imgUrl=sysParamService.getByParamCode(WsConstant.IMGURL).getParamValue();
			String link= Global.getWxDoMain()+"/index.html?ruid="+member.getId();
			/**
			 * 判断是否页面重定向获取Openid,如果重定向需要刷新当前页面，才能自定义分享推广信息
			 */
			String code = request.getParameter("code");
			if (StringUtils.isEmpty(code)||code.equals("null")) {
				data.put("ret",InterConstant.RET_SUCCESS);
			}else{
				data.put("ret","3");
			}
			data.put("messagenum",messagenum);
			data.put("member",member);
			data.put("adBannerList",adBannerList);
			data.put("adActivityList",adActivityList);
			data.put("adBandList",adBandList);
			data.put("wsProductList",wsProductList);
			data.put("wsProdCategoryList",wsProdCategoryList);
			data.put("title",title);
			data.put("desc",desc);
			data.put("imgUrl",imgUrl);
			data.put("link",link);
		}catch(WxException e){
			data.put("ret",InterConstant.RET_WX);
			data.put("appid",WsUtils.getAccount().getAccountAppid());
		}catch(Exception e){
			data.put("ret",InterConstant.RET_FAILED);
			data.put("msg",e.getMessage());
			logger.error("index",e);
		}
		return data;
	}

	
	/**
	 * 获取微信配置
	 * @throws Exception 
	 */
	@RequestMapping(value = "getWxConfig")
	@ResponseBody
	@CrossOrigin
	public Map getWxConfig(String url, HttpServletRequest request, HttpServletResponse response,Model model) throws Exception {
		Map data=new HashMap();
		try{
			url= url.replaceAll("&amp;", "&");
			WxAccount wxAccount=WsUtils.getAccount();	
			Map map=WxConfig.sign(WsUtils.getJsApiTicket(), url);
			data.put("ret","1");
			data.put("jsapi_appId",wxAccount.getAccountAppid());
			data.put("jsapi_timestamp",map.get("timestamp"));
			data.put("jsapi_nonceStr",map.get("nonceStr"));
			data.put("jsapi_signature",map.get("signature"));
			data.put("ret","1");
		}catch(Exception e){
			data.put("ret","0");
			data.put("msg",e.getMessage());
		}
		return data;	
	}

}