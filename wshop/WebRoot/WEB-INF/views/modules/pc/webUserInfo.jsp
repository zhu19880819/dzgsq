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
					<div class="title">
						<a href="hd_welcome.html" style="color: white;">Wshop个人中心</a>
					</div>
					<dl class="user-center__nav">
						<dt>帐户信息</dt>
						<a href="hd_setting.html">
							<dd class="active">个人资料</dd>
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
							<dd>修改登录密码</dd>
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
						<div class="title">账户信息-个人资料</div>
						<div class="port b-r50" id="crop-avatar">
							<img src="${wsMember.headimgurl}" alt="用户名" class="cover b-r50">
						</div>
						<form action="" class="user-setting__form" role="form">
							<div class="user-form-group">
								<label for="user-id">用户名：</label>
								<input type="text" id="user-id" value="${wsMember.username}" placeholder="请输入您的昵称">
							</div>
							<div class="user-form-group">
								<label>等级：</label> ${wsMember.memberRankName}
								<a href="agent_level.html">提升</a>
							</div>
							<div class="user-form-group">
								<label>积分：</label>
								<label>${wsMember.score}</label>
							</div>
							<div class="user-form-group">
								<label>余额：</label>
								<label>¥${wsMember.balance}</label>
							</div>
						</form>
						<script src="js/zebra.datepicker.min.js"></script>
						<link rel="stylesheet" href="css/zebra.datepicker.css">
						<script>
							$('input.datepicker').Zebra_DatePicker({
								default_position: 'below',
								show_clear_date: false,
								show_select_today: false,
							});
						</script>
					</div>
				</div>
			</section>
		</div>
		<!-- 头像选择模态框 -->
		<link href="css/cropper/cropper.min.css" rel="stylesheet">
		<link href="css/cropper/sitelogo.css" rel="stylesheet">
		<script src="js/cropper/cropper.min.js"></script>
		<script src="js/cropper/sitelogo.js"></script>
		<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<form class="avatar-form" action="{%url('admin/upload-logo')%}" enctype="multipart/form-data" method="post">
						<div class="modal-header">
							<button class="close" data-dismiss="modal" type="button">&times;</button>
							<h4 class="modal-title" id="avatar-modal-label">Change Logo Picture</h4>
						</div>
						<div class="modal-body">
							<div class="avatar-body">
								<div class="avatar-upload">
									<input class="avatar-src" name="avatar_src" type="hidden">
									<input class="avatar-data" name="avatar_data" type="hidden">
									<label for="avatarInput">图片上传</label>
									<input class="avatar-input" id="avatarInput" name="avatar_file" type="file"></div>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-wrapper"></div>
									</div>
									<div class="col-md-3">
										<div class="avatar-preview preview-lg"></div>
										<div class="avatar-preview preview-md"></div>
										<div class="avatar-preview preview-sm"></div>
									</div>
								</div>
								<div class="row avatar-btns">
									<div class="col-md-9">
										<div class="btn-group">
											<button class="btn" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"><i class="fa fa-undo"></i> 向左旋转</button>
										</div>
										<div class="btn-group">
											<button class="btn" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"><i class="fa fa-repeat"></i> 向右旋转</button>
										</div>
									</div>
									<div class="col-md-3">
										<button class="btn btn-success btn-block avatar-save" type="submit"><i class="fa fa-save"></i> 保存修改</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>	
	</body>
</html>