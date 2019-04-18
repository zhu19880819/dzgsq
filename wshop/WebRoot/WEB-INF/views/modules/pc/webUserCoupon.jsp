<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="pc_shop" />
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
				<a class="logo" href="index.html"><img
					src="images/icons/logo.jpg" alt="Wshop汇达商城" class="cover"></a>
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
					<div class="title">账户信息-我的优惠券</div>
					<ul class="nav user-nav__title" role="tablist">
						<li role="presentation" class="nav-item active"><a
							href="#useful" aria-controls="useful" role="tab"
							data-toggle="tab">待使用</a></li>
						<li role="presentation" class="nav-item "><a href="#used"
							aria-controls="used" role="tab" data-toggle="tab">已使用</a></li>
						<li role="presentation" class="nav-item "><a href="#overdue"
							aria-controls="overdue" role="tab" data-toggle="tab">已过期</a></li>
						<li role="presentation" class="nav-item "><a href="#exchange"
							aria-controls="exchange" role="tab" data-toggle="tab">可兑换</a></li>
					</ul>

					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="useful">
							<div class="coupon-list">
								<c:forEach items="${toUseCouponList}" var="toUseCoupon">
									<div class="coupon">
										<div class="coupon-hd">
											<b><small class="fz16">¥</small>${toUseCoupon.couponMoney}</b>
											<div class="fz12">
												【使用期限】<br><fmt:formatDate value="${toUseCoupon.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>至<fmt:formatDate value="${toUseCoupon.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</div>
										</div>
										<div class="coupon-bd">
											<div class="fz12 c9">券号：${toUseCoupon.conditionMoney}</div>
											<div class="fz12 c9">规则：满
												${toUseCoupon.conditionMoney}使用</div>
										</div>
										<a href="item_sale_page.html" class="coupon-ft">立即使用</a>
									</div>
								</c:forEach>

							</div>
							<div class="page text-right clearfix">
								<a class="disabled">上一页</a> <a class="select">1</a> <a href="">2</a>
								<a href="">3</a> <a class="" href="">下一页</a>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="used">

							<div class="coupon-list">
								<c:forEach items="${usedCouponList}" var="usedCoupon">
									<div class="coupon">
										<div class="coupon-hd">
											<b><small class="fz16">¥</small>${usedCoupon.couponMoney}</b>
											<div class="fz12">
												【使用期限】<br><fmt:formatDate value="${usedCoupon.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>至<fmt:formatDate value="${usedCoupon.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</div>
										</div>
										<div class="coupon-bd">
											<div class="fz12 c9">券号：${usedCoupon.conditionMoney}</div>
											<div class="fz12 c9">规则：满
												${usedCoupon.conditionMoney}使用</div>
										</div>
										<a href="item_sale_page.html" class="coupon-ft">立即使用</a>
									</div>
								</c:forEach>
							</div>


							<!-- 	<div class="coupon-list">
								<div class="empty-msg">哇，居然没有优惠券了？</div>
							</div> -->
							<div class="page text-right clearfix">
								<a class="disabled">上一页</a> <a class="select">1</a> <a href="">2</a>
								<a href="">3</a> <a class="" href="">下一页</a>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="overdue">
							<div class="coupon-list">
								<c:forEach items="${expiredCouponList}" var="expiredCoupon">
									<div class="coupon">
										<div class="coupon-hd">
											<b><small class="fz16">¥</small>${expiredCoupon.couponMoney}</b>
											<div class="fz12">
												
												【使用期限】<br><fmt:formatDate value="${expiredCoupon.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>至<fmt:formatDate value="${expiredCoupon.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</div>
										</div>
										<div class="coupon-bd">
											<div class="fz12 c9">券号：${expiredCoupon.conditionMoney}</div>
											<div class="fz12 c9">规则：满
												${expiredCoupon.conditionMoney}使用</div>
										</div>
										<!-- <a href="javascript:;" class="coupon-ft">已经过期</a> -->
									</div>
								</c:forEach>
								
							</div>
							<div class="page text-right clearfix">
								<a class="disabled">上一页</a> <a class="select">1</a> <a href="">2</a>
								<a href="">3</a> <a class="" href="">下一页</a>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="exchange">
							<div class="coupon-list">
								<c:forEach items="${wsActivityCouponList}" var="wsActivityCoupon">
									<div class="coupon">
										<div class="coupon-hd">
											<b><small class="fz16">¥</small>${wsActivityCoupon.couponMoney}</b>
											<div class="fz12">
													【使用期限】<br><fmt:formatDate value="${wsActivityCoupon.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>至<fmt:formatDate value="${wsActivityCoupon.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</div>
										</div>
										<div class="coupon-bd">
											<div class="fz12 c9">券号：${wsActivityCoupon.conditionMoney}</div>
											<div class="fz12 c9">规则：满
												${wsActivityCoupon.conditionMoney}使用</div>
										</div>
									<!-- 	<a href="javascript:;" class="coupon-ft">已经过期</a> -->
									</div>
								</c:forEach>
								
							</div>
							<div class="page text-right clearfix">
								<a class="disabled">上一页</a> <a class="select">1</a> <a href="">2</a>
								<a href="">3</a> <a class="" href="">下一页</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>