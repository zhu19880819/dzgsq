package com.thinkgem.jeesite.modules.pc.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.UrlUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.inter.common.InterConstant;
import com.thinkgem.jeesite.modules.prod.entity.WsConsulation;
import com.thinkgem.jeesite.modules.prod.entity.WsProdCategory;
import com.thinkgem.jeesite.modules.prod.entity.WsProdSku;
import com.thinkgem.jeesite.modules.prod.entity.WsProdSkuAttr;
import com.thinkgem.jeesite.modules.prod.entity.WsProduct;
import com.thinkgem.jeesite.modules.prod.service.WsConsulationService;
import com.thinkgem.jeesite.modules.prod.service.WsProdCategoryService;
import com.thinkgem.jeesite.modules.prod.service.WsProdSkuAttrService;
import com.thinkgem.jeesite.modules.prod.service.WsProdSkuService;
import com.thinkgem.jeesite.modules.prod.service.WsProductService;
import com.thinkgem.jeesite.modules.ws.utils.WsConstant;

/**
 * PC端产品
 *
 */
@Controller
@RequestMapping(value = "${webPath}/product")
public class WebProductController extends BaseController{
	
	@Autowired
	private WsProductService wsProductService;
	
	@Autowired
	private WsProdCategoryService wsProdCategoryService;
	
	@Autowired
	private WsProdSkuAttrService wsProdSkuAttrService;
	
	@Autowired
	private WsProdSkuService wsProdSkuService;
	
	@Autowired
	private WsConsulationService wsConsulationService;
	
	/**
	 * 首页搜索商品
	 */
	@RequestMapping(value="search")
	public String search(String keywords,HttpServletRequest request, HttpServletResponse response, Model model) {
		/**
		 * 查询所有分类
		 */
		WsProdCategory wsProdCategory=new WsProdCategory();
		List<WsProdCategory> wsProdCategoryList=wsProdCategoryService.findList(wsProdCategory);
		/**
		 * 获取产品列表，并根据前端选择进行排序
		 */
		WsProduct wsProduct = new WsProduct();
		wsProduct.setOnGoodState(WsConstant.YES);
		Page<WsProduct> page=new Page<WsProduct>();
		wsProduct.setPage(page);
		wsProduct.setTitle(keywords);
		List<WsProduct> wsProductList=wsProductService.findList(wsProduct);
		model.addAttribute("wsProdCategory",wsProdCategory);
		model.addAttribute("wsProdCategoryList",wsProdCategoryList);
		model.addAttribute("wsProductList",wsProductList);
		model.addAttribute("keywords",keywords);
		return "modules/pc/webProdCatList";
	}
	
	/**
	 * 产品详情
	 */
	@RequestMapping(value="detail")
	public String detail(String id,Model model) {
		WsProduct wsProduct = wsProductService.get(id);
		//查询产品副图（轮播图）
		wsProduct.setProdImageList(wsProductService.getProdImageList(wsProduct.getProdImage(), wsProduct.getProdImages()));
		/**
		 * 查询产品非销售属性,多选的要进行拼接，方面页面展示
		 */
		WsProdSkuAttr wsProdSkuAttr=new WsProdSkuAttr();
		wsProdSkuAttr.setProdId(wsProduct.getId());
		//所有的非销售属性值
		List<WsProdSkuAttr> WsProdSkuAttrAllList=wsProdSkuAttrService.findList(wsProdSkuAttr);
		//所有的产品属性
		List<WsProdSkuAttr> WsProdSkuAttrubteIdList=wsProdSkuAttrService.findAttrbuteIdList(wsProdSkuAttr);
		List<WsProdSkuAttr> WsProdSkuBaseAttrList=new ArrayList<WsProdSkuAttr>();
		//每条属性对应一条属性值，拼接多选的属性
		for (WsProdSkuAttr skuAttrAttrubte:WsProdSkuAttrubteIdList) {
			WsProdSkuAttr skuAttr=new WsProdSkuAttr();
			for (WsProdSkuAttr skuAttrAll:WsProdSkuAttrAllList) {
				if(skuAttrAttrubte.getAttrbuteId().equals(skuAttrAll.getAttrbuteId())){
					skuAttr.setAttrbuteName(skuAttrAll.getAttrbuteName());
					if(StringUtils.isNotEmpty(skuAttr.getAttrbuteValueName())){
						skuAttr.setAttrbuteValueName(skuAttr.getAttrbuteValueName()+skuAttrAll.getAttrbuteValueName()+",");
					}else{
						skuAttr.setAttrbuteValueName(skuAttrAll.getAttrbuteValueName()+",");
					}
				}
			}
			if(StringUtils.isNotEmpty(skuAttr.getAttrbuteValueName())){
				skuAttr.setAttrbuteValueName(skuAttr.getAttrbuteValueName().substring(0, skuAttr.getAttrbuteValueName().length()-1));
			}
			WsProdSkuBaseAttrList.add(skuAttr);
		}
		//查询产品sku规格方便用户进行选择
		WsProdSku wsProdSku=new WsProdSku();
		wsProdSku.setWsProduct(wsProduct);
		List<WsProdSku> wsProdSkuList=wsProdSkuService.findList(wsProdSku);
		/**
		 * 查询产品的评价
		 */
		WsConsulation wsConsulation=new WsConsulation();
		wsConsulation.setProductId(wsProduct.getId());
		List<WsConsulation> wsConsulationList = wsConsulationService.findList(wsConsulation);
		/**
		 * 查询爆款推荐
		 */
		WsProduct wsProductContion = new WsProduct();
		wsProductContion.setIsHomeRecommd(InterConstant.YES);
		wsProductContion.setProdCategoryId(wsProduct.getProdCategoryId());
		List<WsProduct> homeProductList = wsProductService.findList(wsProductContion);
		for(WsProduct homeProduct:homeProductList){
			homeProduct.setProdImage(UrlUtils.getNetUrl(homeProduct.getProdImage()));
		}
		model.addAttribute("wsProduct",wsProduct);
		model.addAttribute("WsProdSkuBaseAttrList",WsProdSkuBaseAttrList);
		model.addAttribute("wsProdSkuList",wsProdSkuList);
		model.addAttribute("wsConsulationList",wsConsulationList);
		model.addAttribute("wsConsulationCount",wsConsulationList.size());
		model.addAttribute("homeProductList",homeProductList);
		return "modules/pc/webProductDetail";
	}
	
	/**
	 * 根据产品分类查询产品信息
	 */
	@RequestMapping(value="getProdListByBrand")
	public String getProdListByBrand(String brandId,String prodOrderBy,HttpServletRequest request, HttpServletResponse response, Model model) {

		return "modules/pc/webProdBrandList";
	}
	
	/**
	 * 根据产品分类查询产品信息
	 */
	@RequestMapping(value="getProdListByCat")
	public String getProdListByCat(String prodCategoryId,String prodOrderBy,HttpServletRequest request, HttpServletResponse response, Model model) {
		/**
		 * 查询所有分类
		 */
		WsProdCategory wsProdCategory=new WsProdCategory();
		List<WsProdCategory> wsProdCategoryList=wsProdCategoryService.findList(wsProdCategory);
		/**
		 * 查询指定的分类信息
		 */
		wsProdCategory=wsProdCategoryService.get(prodCategoryId);
		/**
		 * 查询指定分类的一级分类信息
		 */
		WsProdCategory topProdCategory=null;
		if(wsProdCategory.getParent().equals("0")){
			topProdCategory=wsProdCategory;
		}else{
			topProdCategory=wsProdCategoryService.get(wsProdCategory.getParent().getId());
		}
		/**
		 * 获取产品列表，并根据前端选择进行排序
		 */
		WsProduct wsProduct = new WsProduct();
		wsProduct.setOnGoodState(WsConstant.YES);
		Page<WsProduct> page=new Page<>();
		page.setOrderBy(prodOrderBy);
		wsProduct.setPage(page);
		wsProduct.setProdCategoryId(prodCategoryId);
		List<WsProduct> wsProductList=wsProductService.findList(wsProduct);
		model.addAttribute("wsProdCategory",wsProdCategory);
		model.addAttribute("topProdCategory",topProdCategory);
		model.addAttribute("wsProdCategoryList",wsProdCategoryList);
		model.addAttribute("wsProductList",wsProductList);
		return "modules/pc/webProdCatList";
	}
	
}
