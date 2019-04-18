<%@ page contentType="text/html;charset=UTF-8"%>
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
		<!-- 顶部tab -->
		<div class="tab-header">
			<div class="inner">
				<div class="pull-left">
					<div class="pull-left">嗨，欢迎来到<span class="cr">Wshop汇达商城</span></div>
					<a href="temp_article/hd_article4.html">帮助中心</a>
				</div>
				<div class="pull-right">
					<a href="login.html"><span class="cr">登录</span></a>
					<a href="login.html?p=register">注册</a>
					<a href="hd_welcome.html">个人中心</a>
					<a href="hd_order.html">我的订单</a>
					<a href="hd_inform.html">消息通知</a>
				</div>
			</div>
		</div>
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
						<a href="${ctxWeb}/userCenter/userPwd">
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
						<div class="modify_div">
							<div class="clearfix">
								<a href="${ctxWeb}/userCenter/userPwdModify" role="button" class="but">修改登陆密码</a>
								<a href="${ctxWeb}/userCenter/loginPage" role="button" class="but">忘记登陆密码</a>
							</div>
							<div class="help-block">随时都能更改密码，保障您账户的安全</div>
						</div>
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
		<!-- 底部信息 -->
		<div class="footer">
			<div class="footer-tags">
				<div class="tags-box inner">
					<div class="tag-div">
						<img src="images/icons/footer_1.gif" alt="厂家直供">
					</div>
					<div class="tag-div">
						<img src="images/icons/footer_2.gif" alt="一件代发">
					</div>
					<div class="tag-div">
						<img src="images/icons/footer_3.gif" alt="美工活动支持">
					</div>
					<div class="tag-div">
						<img src="images/icons/footer_4.gif" alt="信誉认证">
					</div>
				</div>
			</div>
			<div class="footer-links inner">
				<dl>
					<a href="../index.html"><dt>汇达商城</dt></a>
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
					&nbsp;Copyright&nbsp;@ 2017-2020 周口汇达网络科技有限公司
					<br> 豫ICP备18012972号-1&nbsp;&nbsp;&nbsp;&nbsp;周口市川汇区中原路电商产业孵化园&nbsp;&nbsp;&nbsp;&nbsp;Tel: 13949089293&nbsp;&nbsp;&nbsp;&nbsp;E-mail:351985455@qq.com
				</p>
			</div>
		</div>
	</body>

</html>