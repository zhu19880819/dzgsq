<%@ page  pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">

	<head>
	    <meta name="decorator" content="pc_shop"/>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" href="css/iconfont.css">
		<link rel="stylesheet" href="css/global.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="css/swiper.min.css">
		<link rel="stylesheet" href="css/styles.css">
		<script src="js/jquery.1.12.4.min.js" charset="UTF-8"></script>
		<script src="js/bootstrap.min.js" charset="UTF-8"></script>
		<script src="js/swiper.min.js" charset="UTF-8"></script>
		<script src="js/global.js" charset="UTF-8"></script>
		<script src="js/jquery.DJMask.2.1.1.js" charset="UTF-8"></script>
		<title>修改登录密码</title>
	</head>

	<body>
		<!-- 顶部标题 -->
		<!-- <div class="bgf5 clearfix">
			<div class="top-user">
				<div class="inner">
					<a class="logo" href="index.html"><img src="images/icons/logo.jpg" alt="Wshop汇达商城" class="cover"></a>
					<div class="title">个人中心</div>
				</div>
			</div>
		</div> -->
		<div class="content clearfix bgf5">
			<section class="user-center inner clearfix">
				<div class="pull-left bgf">
					<div class="title"><a href="hd_welcome.html" style="color: white;">Wshop个人中心</a></div>
					<dl class="user-center__nav">
						<dt>帐户信息</dt>
						<a href="hd_setting.html">
							<dd>个人资料</dd>
						</a>
						<a href="hd_treasurer.html">
							<dd>资金管理</dd>
						</a>
						<a href="hd_integral.html">
							<dd>积分平台</dd>
						</a>
						<a href="hd_address.html">
							<dd>收货地址</dd>
						</a>
						<a href="hd_coupon.html">
							<dd>我的优惠券</dd>
						</a>
						<a href="hd_reward.html">
							<dd>邀请奖励</dd>
						</a>
						<a href="hd_paypwd_modify.html">
							<dd>修改支付密码</dd>
						</a>
						<a href="hd_pwd_modify.html">
							<dd class="active">修改登录密码</dd>
						</a>
					</dl>
					<dl class="user-center__nav">
						<dt>订单中心</dt>
						<a href="hd_order.html">
							<dd>我的订单</dd>
						</a>
						<a href="hd_collection.html">
							<dd>我的收藏</dd>
						</a>
						<a href="hd_history.html">
							<dd>我的足迹</dd>
						</a>
						<a href="hd_refund.html">
							<dd>退款/退货</dd>
						</a>
					</dl>
					<dl class="user-center__nav">
						<dt>Wshop汇达商城</dt>
						<a href="temp_article/hd_article10.html">
							<dd>企业简介</dd>
						</a>
						<a href="temp_article/hd_article11.html">
							<dd>加入汇达</dd>
						</a>
						<a href="temp_article/hd_article12.html">
							<dd>隐私说明</dd>
						</a>
						<a href="temp_article/hd_article4.html">
							<dd>常见问题</dd>
						</a>
					</dl>
				</div>
				<div class="pull-right">
					<div class="user-content__box clearfix bgf">
						<div class="title">账户信息-修改登陆密码</div>
						<div class="step-flow-box">
							<div class="step-flow__bd">
								<div class="step-flow__li step-flow__li_done">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">输入旧密码</p>
								</div>
								<div class="step-flow__line step-flow__li_done">
									<div class="step-flow__process"></div>
								</div>
								<div class="step-flow__li step-flow__li_done">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">重置登陆密码</p>
								</div>
								<div class="step-flow__line step-flow__li_done">
									<div class="step-flow__process"></div>
								</div>
								<div class="step-flow__li step-flow__li_done">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">完成</p>
								</div>
							</div>
						</div>
						<div class="modify-success__box text-center">
							<div class="icon b-r50"><i class="iconfont icon-checked cf fz24"></i></div>
							<div class="text c6">登陆密码设置成功！</div>
							<a href="login.html" class="btn"><span id="sec">3</span> 秒后跳转至登陆页面，如果浏览器未跳转请点击这里</a>
						</div>
						<script>
							$(document).ready(function() {
								var time = 3;
								window.setInterval(function() {
									$('#sec').html(time--);
									if(time < 0) {
										window.location.href = 'login.html'
									}
								}, 1000);
							});
						</script>
					</div>
				</div>
			</section>
		</div>
		<!-- 右侧菜单 -->
		<div class="right-nav">
			<ul class="r-with-gotop">
				<li class="r-toolbar-item">
					<a href="hd_welcome.html" class="r-item-hd">
						<i class="iconfont icon-user" data-badge="0"></i>
						<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
					</a>
				</li>
				<li class="r-toolbar-item">
					<a href="hd_shopcart.html" class="r-item-hd">
						<i class="iconfont icon-cart"></i>
						<div class="r-tip__box"><span class="r-tip-text">购物车</span></div>
					</a>
				</li>
				<li class="r-toolbar-item">
					<a href="hd_collection.html" class="r-item-hd">
						<i class="iconfont icon-aixin"></i>
						<div class="r-tip__box"><span class="r-tip-text">我的收藏</span></div>
					</a>
				</li>
				<li class="r-toolbar-item">
					<a href="" class="r-item-hd">
						<i class="iconfont icon-liaotian"></i>
						<div class="r-tip__box"><span class="r-tip-text">联系客服</span></div>
					</a>
				</li>
				<li class="r-toolbar-item">
					<a href="issues.html" class="r-item-hd">
						<i class="iconfont icon-liuyan"></i>
						<div class="r-tip__box"><span class="r-tip-text">留言反馈</span></div>
					</a>
				</li>
				<li class="r-toolbar-item to-top">
					<i class="iconfont icon-top"></i>
					<div class="r-tip__box"><span class="r-tip-text">返回顶部</span></div>
				</li>
			</ul>
			<script>
				$(document).ready(function() {
					$('.to-top').toTop({
						position: false
					})
				});
			</script>
		</div>
	</body>

</html>