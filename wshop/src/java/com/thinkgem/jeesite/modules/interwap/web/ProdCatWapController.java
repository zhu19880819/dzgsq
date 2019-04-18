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
import com.thinkgem.jeesite.modules.inter.common.InterConstant;
import com.thinkgem.jeesite.modules.prod.entity.WsProdCategory;
import com.thinkgem.jeesite.modules.prod.service.WsProdCategoryService;

/**
 * 产品分类接口
 * @author 大胖老师
 * @version 2017-10-08
 */
@Controller
@RequestMapping(value = "${wapPath}/prodCat")
public class ProdCatWapController extends BaseController {
	
	@Autowired
	private WsProdCategoryService wsProdCategoryService;
	
	@RequestMapping(value = {"index", ""})
	@ResponseBody
	@CrossOrigin
	public Map<String,Object> index(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> data=new HashMap<String,Object>();
		try{
			/**
			 * 查询分类
			 */
			WsProdCategory wsProdCategory=new WsProdCategory();
			List<WsProdCategory> wsProdCategoryList=wsProdCategoryService.findList(wsProdCategory);
			for (WsProdCategory prodCat:wsProdCategoryList) {
				prodCat.setImageUrl(UrlUtils.getNetUrl(prodCat.getImageUrl()));
			}
			data.put("ret",InterConstant.RET_SUCCESS);
			data.put("wsProdCategoryList",wsProdCategoryList);
		}catch(Exception e){
			data.put("ret",InterConstant.RET_FAILED);
			data.put("msg",e.getMessage());
			logger.error("prodCat",e);
		}
		return data;
	}



}