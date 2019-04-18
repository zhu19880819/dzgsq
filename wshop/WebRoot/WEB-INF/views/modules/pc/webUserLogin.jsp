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
		<title>${fns:getConfig('productName')} - 登录 / 注册</title>
	</head>

	<body>
		<div class="public-head-layout container">
			<a class="logo" href="index.html"><img src="${ctxStatic}/pcshop/images/icons/logo.jpg" alt="汇达商城" class="cover"></a>
		</div>
		<div style="background:url(${ctxStatic}/pcshop/images/login1.jpg) no-repeat center center; ">
			<div class="login-layout container">
				<div class="form-box login">
					<div class="tabs-nav">
						<h2>欢迎登录${fns:getConfig('productName')}</h2>
					</div>
					<div class="tabs_container">
						<form class="tabs_form" action="${ctxWeb}/userCenter/login" method="post" id="login_form">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
									</div>
									<input class="form-control phone" name="mobile" id="mobile" required placeholder="手机号" maxlength="11" autocomplete="off" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									</div>
									<input class="form-control password" name="password" id="password" placeholder="请输入密码" autocomplete="off" type="password">
									<div class="input-group-addon pwd-toggle" title="显示密码"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></div>
								</div>
							</div>
							<div class="checkbox">
								<label>
	                        	<input checked="" id="login_checkbox" type="checkbox"><i></i> 30天内免登录
	                        </label>
								<a href="${ctxWeb}/userCenter/forgetPage" class="pull-right" id="resetpwd">忘记密码？</a>
							</div>
							<!-- 错误信息 -->
							<c:if test="${not empty message}">
							<div class="form-group">
								<div class="error_msg" id="login_error">
								<div class="alert alert-warning alert-dismissible fade in" role="alert">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<strong>${message}</strong>
								</div>
								</div>
							</div>
							</c:if>
							<button class="btn btn-large btn-primary btn-lg btn-block submit" id="login_submit" type="button">登录</button><br>
							<p class="text-center">没有账号？
								<a href="${ctxWeb}/userCenter/registerPage" id="register">免费注册</a>
							</p>
						</form>
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