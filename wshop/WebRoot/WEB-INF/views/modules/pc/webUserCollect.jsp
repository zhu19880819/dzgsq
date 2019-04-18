<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="pc_shop"/>
<title>${prod:getParam('shopTitle').paramValue}</title>
<style type="text/css">
	.new-li a {
		color: #9D9D9D;
	}
	
	.new-li a:hover {
		color: white;
	}
</style>
</head>
	<body>
		<!-- 顶部标题 -->
		<div class="bgf5 clearfix">
			<div class="top-user">
				<div class="inner">
					<a class="logo" href="index.html"><img src="images/icons/logo.jpg" alt="Wshop汇达商城" class="cover"></a>
					<div class="title">个人中心</div>
				</div>
			</div>
		</div>
		<div class="content clearfix bgf5">
			<section class="user-center inner clearfix">
				<div class="pull-left bgf">
					<div class="title"><a href="hd_welcome.html" style="color: white;">个人中心</a></div>		
					<dl class="user-center__nav">
						<dt>帐户信息</dt>
						<a href="${ctxWeb}/userCenter/userInfo">
							<dd>个人资料</dd>
						</a>
						<a href="${ctxWeb}/address/list">
							<dd>收货地址</dd>
						</a>
						<a href="${ctxWeb}/coupon/index">
							<dd>我的优惠券</dd>
						</a>
						<a href="hd_reward.html">
							<dd>邀请奖励</dd>
						</a>
						<a href="hd_pwd_modify.html">
							<dd>修改登录密码</dd>
						</a>
					</dl>
					<dl class="user-center__nav">
						<dt>订单中心</dt>
						<a href="${ctxWeb}/order/pcOrder/allListOrder">
							<dd>我的订单</dd>
						</a>
						<a href="${ctxWeb}/userCenter/userCollect">
							<dd>我的收藏</dd>
						</a>
						<a href="${ctxWeb}/userCenter/userFoot">
							<dd>我的足迹</dd>
						</a>
						<a href="${ctxWeb}/userCenter/refundProd">
							<dd>退款/退货</dd>
						</a>
					</dl>
					<dl class="user-center__nav">
						<dt>Wshop汇达商城</dt>
						<a href="${ctxWeb}/cms/cms-profile">
							<dd class="${article.code eq 'profile'?'active':'' }">企业简介</dd>
						</a>
						<a href="${ctxWeb}/cms/cms-enter">
							<dd class="${article.code eq 'enter'?'active':'' }">加入汇达</dd>
						</a>
						<a href="${ctxWeb}/cms/cms-conceal">
							<dd class="${article.code eq 'conceal'?'active':'' }">隐私说明</dd>
						</a>
						<a href="${ctxWeb}/cms/cms-question">
							<dd class="${article.code eq 'question'?'active':'' }">常见问题</dd>
						</a>
					</dl>
				</div>
				<div class="pull-right">
					<div class="user-content__box clearfix bgf">
						<div class="title">订单中心-我的收藏</div>
						<div class="collection-list__area clearfix">
						
						
						<c:forEach items="${wsMemberCollectLogList}" var="wsMemberCollectLog">
							<div class="item-card">
								<a href="${wsMemberCollectLog.wsProduct.prodImage}" class="photo">
									<img src="${wsMemberCollectLog.wsProduct.prodImage}" alt="${wsMemberCollectLog.wsProduct.title}" class="cover">
									<div class="name">${wsMemberCollectLog.wsProduct.title}</div>
								</a>
								<div class="middle">
									<div class="price"><small>￥</small>${wsMemberCollectLog.wsProduct.defaultPrice}</div>
									<div class="sale">
										<a href="">取消收藏</a>
									</div>
								</div>
							</div>
						</c:forEach>
							
							
						</div>
						<div class="page text-right clearfix">
							<a class="disabled">上一页</a>
							<a class="select">1</a>
							<a href="">2</a>
							<a href="">3</a>
							<a class="" href="">下一页</a>
							<a class="disabled">1/3页</a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>