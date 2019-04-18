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
						<div class="title">账户信息-资金管理</div>
						<div class="assets-box">
							<samll class="c6">账户余额：</samll>
							<samll class="cr">¥</samll>
							<b class="fz16 cr">${wsMember.balance}</b>
							<ul class="nav pull-right" role="tablist">
								<li role="presentation" class="active">
									<a href="#add" aria-controls="add" role="tab" data-toggle="tab">充值</a>
								</li>
								<li role="presentation" class="">
									<a href="#up" aria-controls="up" role="tab" data-toggle="tab">提现</a>
								</li>
								<li role="presentation" class="">
									<a href="#log" aria-controls="log" role="tab" data-toggle="tab">交易记录</a>
								</li>
							</ul>
						</div>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="add">
								<form action="" class="user-setting__form" role="form">
									<div class="form-group">
										<label for="add-money">充值金额</label>
										<input id="add-money" class="assets-control" placeholder="输入您要充值的金额" type="text">
									</div>
									<div class="form-group">
										<label for="add-note">备注（可不填）</label>
										<textarea id="add-note" class="assets-control" placeholder=""></textarea>
									</div>
									<div class="form-group">
										<label for="note">支付方式（手续费 <span id="tip">0</span>）</label>
										<div class="pay-method-box tags-box">
											<label><input type="radio" name="pay_method" value="Alipay"><i class="pay-method__img alipay"></i></label>
											<label><input type="radio" name="pay_method" value="WeChat"><i class="pay-method__img wechat"></i></label>
										</div>
									</div>
									<div class="user-form-group tags-box">
										<button type="button" class="btn ">立即支付</button>
										<button type="reset" class="btn ">重置</button>
									</div>
								</form>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="up">
								<form action="" class="user-setting__form" role="form">
									<div class="form-group">
										<label for="up-money">提现金额</label>
										<input id="up-money" class="assets-control" placeholder="输入您要提现的金额" type="text">
										<span class="help-block fz12">注：单次提现，提现金额不低于100.0元</span>
									</div>
									<div class="form-group">
										<label for="up-name">姓名</label>
										<input id="up-name" class="assets-control" placeholder="输入您的姓名" type="text">
									</div>
									<div class="form-group">
										<label for="up-bank">开户行</label>
										<input id="up-bank" class="assets-control" placeholder="开户行" type="text">
									</div>
									<div class="form-group">
										<label for="up-number">银行账号</label>
										<input id="up-number" class="assets-control" placeholder="银行账号" type="text">
									</div>
									<div class="form-group">
										<label for="up-phone">手机号码</label>
										<input id="up-phone" class="assets-control" placeholder="请输入您的联系号码" type="text">
									</div>
									<div class="form-group">
										<label for="up-note">备注（可不填）</label>
										<textarea id="up-note" class="assets-control" placeholder=""></textarea>
									</div>
									<div class="user-form-group tags-box">
										<button type="button" class="btn ">申请提现</button>
										<button type="reset" class="btn ">重置</button>
									</div>
								</form>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="log">
								<div class="bs-example" data-example-id="hoverable-table">
									<table class="assets-table table table-bordered table-hover c6 text-center">
										<thead>
											<tr>
												<th>操作时间</th>
												<th>类型</th>
												<th>金额</th>
												<th>备注</th>
												<th>状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2017.09.20 17:20</td>
												<td>充值</td>
												<td>50.00</td>
												<td>充值代销</td>
												<td><span class="text-primary">未确认</span></td>
												<td>
													<a href="">付款</a>
													<a href="">取消</a>
												</td>
											</tr>
											<tr>
												<td>2017.09.20 17:20</td>
												<td>提现</td>
												<td>50.00</td>
												<td>提现金额</td>
												<td><span class="text-success">完成</span></td>
												<td>-</td>
											</tr>
											<tr>
												<td>2017.09.20 17:20</td>
												<td>提现</td>
												<td>50.00</td>
												<td>提现金额</td>
												<td><span class="text-info">提现中</span></td>
												<td>
													<a href="">联系客服</a>
												</td>
											</tr>
											<tr>
												<td>2017.09.20 17:20</td>
												<td>提现</td>
												<td>50.00</td>
												<td>无</td>
												<td><span class="text-success">完成</span></td>
												<td>-</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>