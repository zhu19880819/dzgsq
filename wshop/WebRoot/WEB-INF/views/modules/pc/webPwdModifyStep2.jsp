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
								<div class="step-flow__line step-flow__line_ing">
									<div class="step-flow__process"></div>
								</div>
								<div class="step-flow__li">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">完成</p>
								</div>
							</div>
						</div>
						<form action="${ctxWeb}/userCenter/userPwdModify3" class="user-setting__form" id="passModifyForm" role="form">
							<div class="form-group">
								<input class="form-control" name="newPassword" id="newPassword" required="" maxlength="11" autocomplete="off" type="password" onblur="checkpas1()">
								<span class="tip-text">新的密码</span>
								<span class="see-pwd pwd-toggle" title="显示密码"><i class="glyphicon glyphicon-eye-open"></i></span>
								<span class="error_tip"></span>
							</div>
							<div class="form-group">
								<div class="form-group">
									<input class="form-control" name="confirmPassword" id="confirmPassword" required="" maxlength="11" autocomplete="off" type="password" onchange="checkpas()">
									<span class="tip-text">再次确认新的密码</span>
									<span class="tip" style="color: red;">两次输入的密码不一致</span>
									<span class="see-pwd pwd-toggle" title="显示密码"><i class="glyphicon glyphicon-eye-open"></i></span>
									<span class="error_tip"></span>
								</div>
							</div>
							<div class="user-form-group tags-box">
								<button type="button" class="btn " onclick="checkpas2()">提交</button>
							</div>
							<script src="js/login.js"></script>
							<script>
								$(document).ready(function() {
									$('.form-control').on('blur focus', function() {
										$(this).addClass('focus')
										if($(this).val() == '') {
											$(this).removeClass('focus')
										}
									});
									$(".tip").hide();
								});
								
						        function checkpas1(){//当第一个密码框失去焦点时，触发checkpas1事件
						            var pas1=document.getElementById("newPassword").value;
						            var pas2=document.getElementById("confirmPassword").value;//获取两个密码框的值
						            if(pas1!=pas2&&pas2=="")//此事件当两个密码不相等且第二个密码是空的时候会显示错误信息
						                $(".tip").show();
						            else
						                $(".tip").hide();//若两次输入的密码相等且都不为空时，不显示错误信息。
						            }
						        function checkpas(){//当第二个密码发生改变时触发时间checkpas事件
						            var pas1=document.getElementById("newPassword").value;
						            var pas2=document.getElementById("confirmPassword").value;//获取两个密码框的值
						            if(pas1!=pas2){
						                $(".tip").show();//当两个密码不相等时则显示错误信息
						            }else{
						                $(".tip").hide();
						            }
						            }
						        function checkpas2(){//点击提交按钮时，触发checkpas2事件，会进行弹框提醒以防无视错误信息提交
						            var pas3=document.getElementById("newPassword").value;
						            var pas4=document.getElementById("confirmPassword").value;
						            if(pas3!=pas4){
						                alert("两次输入的密码不一致！");
						                return false;
						            }
						            $("#passModifyForm").submit();
						        }
							</script>
						</form>
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