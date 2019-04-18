package com.thinkgem.jeesite.modules.wx.report.datastatistics;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.thinkgem.jeesite.modules.wx.core.common.JSONHelper;
import com.thinkgem.jeesite.modules.wx.core.exception.WexinReqException;
import com.thinkgem.jeesite.modules.wx.report.datastatistics.graphicanalysis.JwGraphicAnalysisAPI;
import com.thinkgem.jeesite.modules.wx.report.datastatistics.graphicanalysis.model.GraphicAnalysisRtnInfo;
import com.thinkgem.jeesite.modules.wx.report.datastatistics.useranalysis.JwUserAnalysisAPI;
import com.thinkgem.jeesite.modules.wx.report.datastatistics.useranalysis.model.UserAnalysisRtnInfo;
import com.thinkgem.jeesite.modules.wx.wxbase.wxtoken.JwTokenAPI;


public class Test {

	private static String appid = "wx00737224cb9dbc7d";
	private static String appscret = "b9479ebdb58d1c6b6efd4171ebe718b5";
	
	public static void main(String[] args) throws WexinReqException, UnsupportedEncodingException {
		Test t = new Test();
		//测试 获取用户增减数据
//		t.getUserSummary();
		//测试 获取累计用户数据
//		t.getUserCumulate();
		//测试  获取图文群发每日数据
//		t.getArticleSummary();
		//获取图文群发总数据
		t.getArticleTotal();
		//获取图文统计数据
//		t.getUserRead();
		//获取图文统计分时数据
//		t.getUserReadHour();
		//获取图文分享转发数据
//		t.getUserShare();
		//获取图文分享转发分时数据
//		t.getUserShareHour();
	}
	
	public String getAccessToken() throws WexinReqException{
		return JwTokenAPI.getAccessToken(appid, appscret);
	}
	//测试 获取用户增减数据
	@SuppressWarnings("static-access")
	public void getUserSummary() throws WexinReqException{
		JwUserAnalysisAPI jua = new JwUserAnalysisAPI();
		List<UserAnalysisRtnInfo> userAnalysisList = jua.getUserSummary(getAccessToken(), "2015-01-27", "2015-01-30");
		
		for (UserAnalysisRtnInfo userAnalysisRtnInfo : userAnalysisList) {
			System.out.println(JSONHelper.bean2json(userAnalysisRtnInfo));
		}
	}
	//测试 获取累计用户数据
	@SuppressWarnings("static-access")
	public void getUserCumulate() throws WexinReqException{
		JwUserAnalysisAPI jua = new JwUserAnalysisAPI();
		List<UserAnalysisRtnInfo> userAnalysisRtnInfoList = jua.getUserCumulate(getAccessToken(), "2015-01-24", "2015-01-30");
		
		for (UserAnalysisRtnInfo userAnalysisRtnInfo : userAnalysisRtnInfoList) {
			System.out.println(JSONHelper.bean2json(userAnalysisRtnInfo));
		}
	}
	//获取图文群发每日数据
	@SuppressWarnings("static-access")
	public void getArticleSummary() throws WexinReqException, UnsupportedEncodingException{
		JwGraphicAnalysisAPI jga = new JwGraphicAnalysisAPI();
		List<GraphicAnalysisRtnInfo> graphicAnalysisRtnInfoList = jga.getArticleSummary(getAccessToken(), "2015-03-02", "2015-03-02");
		
		for (GraphicAnalysisRtnInfo graphicAnalysisRtnInfo : graphicAnalysisRtnInfoList) {
			System.out.println(JSONHelper.bean2json(graphicAnalysisRtnInfo));
		}
	}
	//获取图文群发总数据
	@SuppressWarnings("static-access")
	public void getArticleTotal() throws WexinReqException, UnsupportedEncodingException{
		JwGraphicAnalysisAPI jga = new JwGraphicAnalysisAPI();
		List<GraphicAnalysisRtnInfo> graphicAnalysisRtnInfoList = jga.getArticleTotal(getAccessToken(), "2015-03-03", "2015-03-03");
		
		for (GraphicAnalysisRtnInfo graphicAnalysisRtnInfo : graphicAnalysisRtnInfoList) {
			System.out.println(JSONHelper.bean2json(graphicAnalysisRtnInfo));
		}
	}
	//获取图文统计数据
	@SuppressWarnings("static-access")
	public void getUserRead() throws WexinReqException{
		JwGraphicAnalysisAPI jga = new JwGraphicAnalysisAPI();
		List<GraphicAnalysisRtnInfo> graphicAnalysisRtnInfoList = jga.getUserRead(getAccessToken(), "2015-01-29", "2015-01-30");
		
		for (GraphicAnalysisRtnInfo graphicAnalysisRtnInfo : graphicAnalysisRtnInfoList) {
			System.out.println(JSONHelper.bean2json(graphicAnalysisRtnInfo));
		}
	}
	//获取图文统计分时数据
	@SuppressWarnings("static-access")
	public void getUserReadHour() throws WexinReqException{
		JwGraphicAnalysisAPI jga = new JwGraphicAnalysisAPI();
		List<GraphicAnalysisRtnInfo> graphicAnalysisRtnInfoList = jga.getUserReadHour(getAccessToken(), "2015-01-30", "2015-01-30");
		
		for (GraphicAnalysisRtnInfo graphicAnalysisRtnInfo : graphicAnalysisRtnInfoList) {
			System.out.println(JSONHelper.bean2json(graphicAnalysisRtnInfo));
		}
	}
	//获取图文分享转发数据
	@SuppressWarnings("static-access")
	public void getUserShare() throws WexinReqException{
		JwGraphicAnalysisAPI jga = new JwGraphicAnalysisAPI();
		List<GraphicAnalysisRtnInfo> graphicAnalysisRtnInfoList = jga.getUserShare(getAccessToken(), "2015-01-24", "2015-01-30");
		
		for (GraphicAnalysisRtnInfo graphicAnalysisRtnInfo : graphicAnalysisRtnInfoList) {
			System.out.println(JSONHelper.bean2json(graphicAnalysisRtnInfo));
		}
	}
	//获取图文分享转发分时数据
	@SuppressWarnings("static-access")
	public void getUserShareHour() throws WexinReqException{
		JwGraphicAnalysisAPI jga = new JwGraphicAnalysisAPI();
		List<GraphicAnalysisRtnInfo> graphicAnalysisRtnInfoList = jga.getUserShareHour(getAccessToken(), "2015-01-30", "2015-01-30");
		
		for (GraphicAnalysisRtnInfo graphicAnalysisRtnInfo : graphicAnalysisRtnInfoList) {
			System.out.println(JSONHelper.bean2json(graphicAnalysisRtnInfo));
		}
	}
}
