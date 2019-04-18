<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:title default="欢迎光临" /></title>
<%@include file="/WEB-INF/views/modules/pc/include/head.jsp"%>
<sitemesh:head />
</head>
<body>
<!-- 顶部tab -->
<div class="tab-header">
	<div class="inner">
		<div class="pull-left">
			<div class="pull-left">嗨，欢迎来到<span class="cr">${prod:getParam('shopTitle').paramValue}</span></div>
			<a href="${ctxWeb}/cms/cms-question">常见问题</a>
		</div>
		<div class="pull-right">
			<c:if test="${empty sessionScope.wsMember}">
			<a href="${ctxWeb}/userCenter/loginPage"><span class="cr">登录</span></a>
			<a href="${ctxWeb}/userCenter/registerPage"">注册</a>
			</c:if>
			<c:if test="${not empty sessionScope.wsMember}">
			<a href="${ctxWeb}/userCenter/index"><span class="cr">${wsMember.nickname}</span></a>
			<a href="${ctxWeb}/userCenter/loginOut"">退出</a>
			</c:if>
			<a href="${ctxWeb}/userCenter/index">个人中心</a>
			<a href="${ctxWeb}/userCenter/userOrderList">我的订单</a>
            <a href="${ctxWeb}/message/list">消息通知</a>
		</div>
	</div>
</div>
<!-- 搜索栏 <-->
<div class="top-search">
	<div class="inner">
		<a class="logo" href="${pageContext.request.contextPath}/"><img src="${ctxStatic}/pcshop/images/icons/logo.jpg" alt="汇达" class="cover"></a>
		<div class="search-box">
			<form class="input-group" action="${ctxWeb}/product/search">
				<input placeholder="搜索关键字" type="text" name="keywords" value="${keywords}">
				<span class="input-group-btn">
				<button type="submit">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
				</span>
			</form>
		</div>
		<div class="cart-box">
			<a href="${ctxWeb}/cart/index" class="cart-but">
				<i class="iconfont icon-shopcart cr fz16"></i> 购物车
			</a>
		</div>
	</div>
</div>
<sitemesh:body />
<!-- 右侧菜单 -->
		<div class="right-nav">
			<ul class="r-with-gotop">
				<li class="r-toolbar-item">
					<a href="${ctxWeb}/userCenter/index" class="r-item-hd">
						<i class="iconfont icon-user"></i>
						<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
					</a>
				</li>
				<li class="r-toolbar-item">
					<a href="${ctxWeb}/cart/index" class="r-item-hd">
						<i class="iconfont icon-cart" data-badge="10"></i>
						<div class="r-tip__box"><span class="r-tip-text">购物车</span></div>
					</a>
				</li>
				<li class="r-toolbar-item">
					<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${prod:getParam('qq').paramValue}&site=qq&menu=yes" class="r-item-hd">
						<i class="iconfont icon-liaotian"></i>
						<div class="r-tip__box" ><span class="r-tip-text">联系客服</span></div>
					</a>
				</li>
				<li class="r-toolbar-item">
					<a href="${ctxWeb}/collect/index" class="r-item-hd">
						<i class="iconfont icon-aixin"></i>
						<div class="r-tip__box"><span class="r-tip-text">我的收藏</span></div>
					</a>
				</li>
				<li class="r-toolbar-item to-top">
					<i class="iconfont icon-top"></i>
					<div class="r-tip__box"><span class="r-tip-text">返回顶部</span></div>
				</li>
			</ul>
		</div>
		<!-- 底部信息 -->
		<div class="footer">
			<div class="footer-tags">
				<div class="tags-box inner">
					<div class="tag-div">
						<img src="${ctxStatic}/pcshop/images/icons/footer_1.gif" alt="厂家直供">
					</div>
					<div class="tag-div">
						<img src="${ctxStatic}/pcshop/images/icons/footer_2.gif" alt="一件代发">
					</div>
					<div class="tag-div">
						<img src="${ctxStatic}/pcshop/images/icons/footer_3.gif" alt="美工活动支持">
					</div>
					<div class="tag-div">
						<img src="${ctxStatic}/pcshop/images/icons/footer_4.gif" alt="信誉认证">
					</div>
				</div>
			</div>
			<div class="footer-links inner">
				<dl>
					<a href="${pageContext.request.contextPath}/"><dt>汇达商城</dt></a>
				</dl>
				<dl>
					<a href="hd_article10.html"><dt>企业简介</dt></a>
				</dl>
				<dl>
					<a href="hd_article11.html"><dt>加入汇达</dt></a>
				</dl>
				<dl>
					<a href="hd_article12.html"><dt>隐私说明</dt></a>
				</dl>
				<dl>
					<a href="hd_article4.html"><dt>常见问题</dt></a>
				</dl>
			</div>
			<div class="copy-box clearfix">
				<!-- 版权 -->
				<p class="copyright">
					&nbsp;Copyright&nbsp;@ 2017-2020 ${prod:getParam('enterprise').paramValue}
					<br> ${prod:getParam('recordNumber').paramValue}&nbsp;&nbsp;&nbsp;&nbsp;${prod:getParam('address').paramValue}&nbsp;&nbsp;&nbsp;&nbsp;Tel: ${prod:getParam('mobile').paramValue}
					&nbsp;&nbsp;&nbsp;&nbsp;E-mail:${prod:getParam('email').paramValue}
				</p>
			</div>
		</div>
</body>
</html>