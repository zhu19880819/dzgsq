<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
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
						<div class="title">订单中心-申请退款/退货</div>
						<div class="order-info__box">
							<div class="step-flow-box" style="width: 800px;margin: 0 auto 24px">
								<div class="step-flow__bd">
									<div class="step-flow__li step-flow__li_done">
										<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
										<p class="step-flow__title-top">买家申请</p>
									</div>
									<div class="step-flow__line step-flow__line_ing">
										<div class="step-flow__process"></div>
									</div>
									<div class="step-flow__li">
										<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
										<p class="step-flow__title-top">卖家处理</p>
									</div>
									<div class="step-flow__line">
										<div class="step-flow__process"></div>
									</div>
									<div class="step-flow__li">
										<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
										<p class="step-flow__title-top">完毕</p>
									</div>
								</div>
							</div>
							<hr>
							<div class="return-item__info">
								<div class="img"><img src="${wsOrderItem.thumb}" alt="${wsOrderItem.wsProduct.title}" class="cover"></div>
								<div class="name ep2">${wsOrderItem.wsProduct.title}</div>
								<div class="type">${wsOrderItem.skuSpec}</div>
								<div class="num">订单编号：${orderSn }</div>
							</div>
							<form action="" class="user-addr__form form-horizontal" role="form">
								<div class="form-group">
									<label class="col-sm-2 control-label">服务类型：</label>
									<div class="col-sm-6">
										<div class="user-form-group return_val c6">
											<label><input name="money" value="0" type="radio"><i class="iconfont icon-radio"></i>仅退款</label><br>
											<label><input name="money" value="1" type="radio"><i class="iconfont icon-radio"></i>退货退款</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">货物状态：</label>
									<div class="col-sm-6">
										<div class="user-form-group return_val c6">
											<label><input name="item" value="0" type="radio"><i class="iconfont icon-radio"></i> 未收到货</label><br>
											<label><input name="item" value="1" type="radio"><i class="iconfont icon-radio"></i> 已收到货</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">退款金额：</label>
									<div class="col-sm-6">
										<div class="return_val cr">¥${wsOrderItem.reallyUnitPrice}</div>
									</div>
								</div>
								<div class="form-group">
									<label for="cause" class="col-sm-2 control-label">退款原因：</label>
									<div class="col-sm-10">
										<select name="town" id="cause">
											<option value="0">请选择</option>
											<option value="1">质量问题</option>
											<option value="2">发错货物</option>
											<option value="3">七天无理由退换</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="note" class="col-sm-2 control-label">退款说明：</label>
									<div class="col-sm-6">
										<textarea class="form-control" id="note" rows="3"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-3">
										<button type="submit" class="but">提交</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
		
	</body>

</html>