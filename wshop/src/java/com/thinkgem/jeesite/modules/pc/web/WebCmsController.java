package com.thinkgem.jeesite.modules.pc.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;

/**
 * 商城内容管理接口
 * @author 
 * @version 2017-10-08
 */
@Controller
@RequestMapping(value = "${webPath}/cms")
public class WebCmsController extends BaseController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	@Autowired
	private CategoryService categoryService;

    
    /**
     * 平台公告列表
     */
    @RequestMapping(value = "noticeList")
    public String noticeList(String id, HttpServletRequest request, HttpServletResponse response, Model model) {

        // 获取公告栏目表
        Category category = categoryService.getByCode("notice");
        if(category!=null) {
            // 获取公告列表
            Article article = new Article();
            article.setCategory(category);
            Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
            for(Article art : page.getList()) {
            	art.setArticleData(articleDataService.get(art.getId()));
            }
            model.addAttribute("page", page);
            model.addAttribute("category", category);
            if(StringUtils.isNotEmpty(id)) {
            	article=articleService.get(id);
            	article.setArticleData(articleDataService.get(id));
            	model.addAttribute("article", article);
            }else {
            	if(page.getList()!=null && page.getList().size()>0) {
            		article=page.getList().get(0);
            	}
            }
            model.addAttribute("article", article);
        }
        return "modules/pc/webNoticeList";
    }
    
    /**
     * 关于我们
     */
    @RequestMapping(value = "about")
    public String about(HttpServletRequest request, HttpServletResponse response, Model model) {

        // 获取公告栏目表
        Category category = categoryService.getByCode("about");
        if(category!=null) {
            // 获取公告列表
            Article article = new Article();
            article.setCategory(category);
            Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
            for(Article art : page.getList()) {
            	art.setArticleData(articleDataService.get(art.getId()));
            }
            model.addAttribute("page", page);
            model.addAttribute("category", category);
        	if(page.getList()!=null && page.getList().size()>0) {
        		article=page.getList().get(0);
        	}
            model.addAttribute("article", article);
        }
        return "modules/pc/webAbout";
    }
    
    /**
     * 微信商城
     */
	@RequestMapping(value = "cms-{code}")
	public String index(@PathVariable String code, Model model) {

        // 获取公告栏目表
        Category category = categoryService.getByCode("wshop");
        if(category!=null) {
            // 获取公告列表
            Article article = new Article();
            article.setCategory(category);
            article.setCode(code);
            List<Article> articleList = articleService.findList(article);
        	if(articleList!=null && articleList.size()>0) {
        		article=articleList.get(0);
        		article.setArticleData(articleDataService.get(article.getId()));
        	}
            model.addAttribute("category", category);
            model.addAttribute("article", article);
        }
        return "modules/pc/webUserArticle";
    }
    
    
}
