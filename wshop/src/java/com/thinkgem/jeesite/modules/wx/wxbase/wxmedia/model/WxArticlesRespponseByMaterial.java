package com.thinkgem.jeesite.modules.wx.wxbase.wxmedia.model;

import java.util.ArrayList;
import java.util.List;

import com.thinkgem.jeesite.modules.wx.wxsendmsg.model.WxArticle;
/**
 * 获得媒体信息
 * @author lihongxuan
 *
 */
public class WxArticlesRespponseByMaterial {
	List<WxArticle> news_item = new ArrayList<WxArticle>();

	

	public List<WxArticle> getNews_item() {
		return news_item;
	}



	public void setNews_item(List<WxArticle> news_item) {
		this.news_item = news_item;
	}



	@Override
	public String toString() {
		return "WxArticlesRequest [news_item=" + news_item + "]";
	}

}
