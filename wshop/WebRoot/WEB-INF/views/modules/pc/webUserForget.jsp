<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${prod:getParam('shopTitle').paramValue}</title>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" href="${ctxStatic}/pcshop/favicon.ico">
		<link rel="stylesheet" href="${ctxStatic}/pcshop/css/iconfont.css">
		<link rel="stylesheet" href="${ctxStatic}/pcshop/css/global.css">
		<link rel="stylesheet" href="${ctxStatic}/pcshop/css/bootstrap.min.css">
		<link rel="stylesheet" href="${ctxStatic}/pcshop/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="${ctxStatic}/pcshop/css/login.css">
		<script src="${ctxStatic}/pcshop/js/jquery.1.12.4.min.js" charset="UTF-8"></script>
		<script src="${ctxStatic}/pcshop/js/bootstrap.min.js" charset="UTF-8"></script>
		<script src="${ctxStatic}/pcshop/js/jquery.form.js" charset="UTF-8"></script>
		<script src="${ctxStatic}/pcshop/js/global.js" charset="UTF-8"></script>
		<script src="${ctxStatic}/pcshop/js/login.js" charset="UTF-8"></script>
		<title>${fns:getConfig('productName')}- 忘记密码</title>
	</head>

	<body>
		<div class="public-head-layout container">
			<a class="logo" href="index.html"><img src="${ctxStatic}/pcshop/images/icons/logo.jpg" alt="汇达商城" class="cover"></a>
		</div>
		<div style="background:url(${ctxStatic}/pcshop/images/login1.jpg) no-repeat center center; ">
			<div class="login-layout container">
				<div class="form-box resetpwd">
					<div class="tabs-nav clearfix">
						<h2>找回密码<a href="javascript:;" class="pull-right fz16" id="pwdlogin">返回登录</a></h2>
					</div>
					<div class="tabs_container">
						<form class="tabs_form" action="${ctxWeb}/userCenter/forget" method="post" id="resetpwd_form">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
									</div>
									<input class="form-control phone" name="phone" id="resetpwd_phone" required placeholder="手机号" maxlength="11" autocomplete="off" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input class="form-control" name="sms" id="resetpwd_sms" placeholder="输入验证码" type="text">
									<span class="input-group-btn">
									<button class="btn btn-primary getsms" type="button">发送短信验证码</button>
								</span>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									</div>
									<input class="form-control password" name="password" id="resetpwd_pwd" placeholder="新的密码" autocomplete="off" type="password">
									<div class="input-group-addon pwd-toggle" title="显示密码"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></div>
								</div>
							</div>
							<!-- 错误信息 -->
							<div class="form-group">
								<div class="error_msg" id="resetpwd_error"></div>
							</div>
							<button class="btn btn-large btn-primary btn-lg btn-block submit" id="resetpwd_submit" type="button">重置密码</button>
						</form>
						<div class="tabs_div">
							<div class="success-box">
								<div class="success-msg">
									<i class="success-icon"></i>
									<p class="success-text">密码重置成功</p>
								</div>
							</div>
							<div class="option-box">
								<div class="buts-title">
									现在您可以
								</div>
								<div class="buts-box">
									<a role="button" href="${ctxWeb}/" class="btn btn-block btn-lg btn-default">继续访问商城</a>
									<a role="button" href="${ctxWeb}/userCenter/loginPage" class="btn btn-block btn-lg btn-info">返回登陆</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script>
					$(document).ready(function() {
						$('.login').show();
						// 以下确定按钮仅供参考
						$('.submit').click(function() {
							var mobile = $("#mobile").val();
							var password = $("#password").val();
							if(mobile==null || mobile == ""){
								alert("账号不能为空!");
								return;
							}
							if(password==null || password == ""){
								alert("密码不能为空!");
								return;
							}
							$("#login_form").submit();
						})
					});
				</script>
			</div>
		</div>
		<div class="footer-login container clearfix">
				<!-- 版权 -->
				<p class="copyright">
					&nbsp;Copyright&nbsp;@ 2017-2020 ${prod:getParam('enterprise').paramValue}
					<br> ${prod:getParam('recordNumber').paramValue}&nbsp;&nbsp;&nbsp;&nbsp;${prod:getParam('address').paramValue}&nbsp;&nbsp;&nbsp;&nbsp;Tel: ${prod:getParam('mobile').paramValue}
					&nbsp;&nbsp;&nbsp;&nbsp;E-mail:${prod:getParam('email').paramValue}
				</p>
		</div>
	</body>

</html>