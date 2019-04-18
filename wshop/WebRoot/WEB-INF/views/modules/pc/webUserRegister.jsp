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
		<title>Wshop汇达商城 - 登录 / 注册</title>
	</head>

	<body>
		<div class="public-head-layout container">
			<a class="logo" href="index.html"><img src="${ctxStatic}/pcshop/images/icons/logo.jpg" alt="汇达商城" class="cover"></a>
		</div>
		<div style="background:url(${ctxStatic}/pcshop/images/login1.jpg) no-repeat center center; ">
			<div class="login-layout container">
				<div class="form-box register">
					<div class="tabs-nav">
						<h2>欢迎注册<a href="${ctxWeb}/userCenter/loginPage" class="pull-right fz16" id="reglogin">返回登录</a></h2>
					</div>
					<div class="tabs_container">
						<form class="tabs_form" action="${ctxWeb}/userCenter/saveRegister" method="post" id="register_form">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
									</div>
									<input class="form-control phone" name="phone" id="register_phone" required placeholder="手机号" maxlength="11" autocomplete="off" type="text">
								</div>
							</div>
							<!-- 短信验证码 
							<div class="form-group">
								<div class="input-group">
									<input class="form-control" name="smscode" id="register_sms" placeholder="输入验证码" type="text">
									<span class="input-group-btn">
									<button class="btn btn-primary getsms" type="button">发送短信验证码</button>
								</span>
								</div>
							</div>
							-->
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									</div>
									<input class="form-control password" name="password" id="register_pwd" placeholder="请输入密码" autocomplete="off" type="password">
									<div class="input-group-addon pwd-toggle" title="显示密码"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></div>
								</div>
							</div>
							<div class="checkbox">
								<label>
	                        	<input checked="" id="register_checkbox" type="checkbox"><i></i> 同意<a href="temp_article/hd_article3.html">汇达用户协议</a>
	                        </label>
							</div>
							<!-- 错误信息 -->
							<div class="form-group">
								<div class="error_msg" id="register_error"></div>
							</div>
							<button class="btn btn-large btn-primary btn-lg btn-block submit" id="register_submit" type="button">注册</button>
						</form>
					</div>
				</div>
				<div class="form-box resetpwd">
					<div class="tabs-nav clearfix">
						<h2>找回密码<a href="javascript:;" class="pull-right fz16" id="pwdlogin">返回登录</a></h2>
					</div>
				</div>
				<script>
					$(document).ready(function() {
						// 判断直接进入哪个页面 例如 login.php?p=register
						$('.register').show();
						// 发送验证码事件
						$('.getsms').click(function() {
							var phone = $(this).parents('form').find('input.phone');
							var error = $(this).parents('form').find('.error_msg');
							switch(phone.validatemobile()) {
								case 0:
									// 短信验证码的php请求
									error.html(msgtemp('验证码 <strong>已发送</strong>', 'alert-success'));
									$(this).rewire(60);
									break;
								case 1:
									error.html(msgtemp('<strong>手机号码为空</strong> 请输入手机号码', 'alert-warning'));
									break;
								case 2:
									error.html(msgtemp('<strong>手机号码错误</strong> 请输入11位数的号码', 'alert-warning'));
									break;
								case 3:
									error.html(msgtemp('<strong>手机号码错误</strong> 请输入正确的号码', 'alert-warning'));
									break;
							}
						});
						// 以下确定按钮仅供参考
						$('.submit').click(function() {
							var form = $(this).parents('form')
							var phone = form.find('input.phone');
							var pwd = form.find('input.password');
							var error = form.find('.error_msg');
							var success = form.siblings('.tabs_div');
							var options = {
								beforeSubmit: function() {
									console.log('喵喵喵')
								},
								success: function(data) {
									console.log(data)
								}
							}
							// 验证手机号参考这个
							switch(phone.validatemobile()) {
								case 1:
									error.html(msgtemp('<strong>手机号码为空</strong> 请输入手机号码', 'alert-warning'));
									return;
									break;
								case 2:
									error.html(msgtemp('<strong>手机号码错误</strong> 请输入11位数的号码', 'alert-warning'));
									return;
									break;
								case 3:
									error.html(msgtemp('<strong>手机号码错误</strong> 请输入正确的号码', 'alert-warning'));
									return;
									break;
							}
							// 验证密码复杂度参考这个
							switch(pwd.validatepwd()) {
								case 1:
									error.html(msgtemp('<strong>密码不能为空</strong> 请输入密码', 'alert-warning'));
									return;
									break;
								case 2:
									error.html(msgtemp('<strong>密码过短</strong> 请输入6位以上的密码', 'alert-warning'));
									return;
									break;
								case 3:
									error.html(msgtemp('<strong>密码过于简单</strong><br>密码需为字母、数字或特殊字符组合', 'alert-warning'));
									return;
									break;
							}
							form.ajaxForm(options);
							// 请求成功执行类似这样的事件
							// form.fadeOut(150,function() {
							// 	success.fadeIn(150);
							// });
						})
					});
				</script>
			</div>
		</div>
		<div class="footer-login container clearfix">
			<!-- 版权 -->
			<p class="copyright">
				&nbsp;Copyright&nbsp;@ 2017-2020 周口汇达网络科技有限公司
				<br> 豫ICP备18012972号-1&nbsp;&nbsp;&nbsp;&nbsp;周口市川汇区中原路电商产业孵化园&nbsp;&nbsp;&nbsp;&nbsp;Tel: 13949089293&nbsp;&nbsp;&nbsp;&nbsp;E-mail:351985455@qq.com
			</p>
		</div>
	</body>

</html>