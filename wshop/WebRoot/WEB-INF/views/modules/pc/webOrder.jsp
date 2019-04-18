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
		<script type="text/javascript">
			$(document).ready(function() {
			});
			function page(n,s){
				$("#pageNo").val(n);
				$("#pageSize").val(s);
				$("#searchForm").submit();
	        	return false;
	        };
	      
		</script>
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
						<div class="title">订单中心-我的订单</div>
						<div class="order-list__box bgf">
							<div class="order-panel">
								<ul class="nav user-nav__title" >
									
									<li  class="nav-item <c:if test="${staus eq 'ALL'}">active</c:if>">
										<a href="${ctxWeb}/order/pcOrder/allListOrder" >所有订单</a>
									</li>
									<li  class="nav-item <c:if test="${staus eq 'waitePay'}">active</c:if>">
										<a href="${ctxWeb}/order/pcOrder/waitePayListOrder" >待付款 <span class="cr">${fn:length(waiePayOrderList)}</span></a>
									</li>
									<li  class="nav-item <c:if test="${staus eq 'waiteSend'}">active</c:if>">
										<a href="${ctxWeb}/order/pcOrder/waiteSendListOrder" >待发货 <span class="cr">${fn:length(waieSendOrderList)}</span></a>
									</li>
									<li  class="nav-item <c:if test="${staus eq 'waiteRecevied'}">active</c:if>">
										<a href="${ctxWeb}/order/pcOrder/waiteReceviedListOrder">待收货 <span class="cr">${fn:length(waieReceviedOrderList)}</span></a>
									</li>
									<li  class="nav-item <c:if test="${staus eq 'waiteEvaluation'}">active</c:if>">
										<a href="${ctxWeb}/order/pcOrder/waiteEvaluationListOrder">待评价 <span class="cr">${fn:length(waieEvaluationOrderList)}</span></a>
									</li>
								</ul>

								<div class="tab-content">
									<div role="tabpanel" class="tab-pane fade in active" id="all">
										<table class="table text-center">
											<tr>
												<th width="380">商品信息</th>
												<th width="85">单价</th>
												<th width="85">数量</th>
												<th width="120">实付款</th>
												<th width="120">交易状态</th>
												<th width="120">交易操作</th>
											</tr>
											<c:forEach items="${page.list}" var="wsOrder">
											<tr class="order-item">
												<table class="table text-center">
													<tr>
														<td colspan="6">
															<label>
																<a href="hd_order_detail.html" class="num">
																	<fmt:formatDate value="${wsOrder.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> 订单号: ${wsOrder.orderSn}
																</a>
															</label>
														</td>
													</tr>
													<c:forEach items="${wsOrder.wsOrderItemList}" var="wsOrderItem" varStatus="status">
													<tr class="order-item">
														<td>
															<label>
																<div class="card">
																	<div class="img"><img src="${wsOrderItem.thumb}" alt="${wsOrderItem.wsProduct.title}" class="cover"></div>
																	<div class="name ep2">${wsOrderItem.wsProduct.title}</div>
																	<div class="format">${wsOrderItem.skuSpec}</div>
																	<div class="favour">使用优惠券：优惠¥2.00</div>
																</div>
															</label>
														</td>
														<td>${wsOrderItem.reallyUnitPrice}</td>
														<td>${wsOrderItem.quantity }</td>
														<td>${wsOrderItem.reallyPrice}<br><span class="fz12 c6 text-nowrap">(含运费: ${wsOrder.postage} )</span></td>
														<c:if test="${status.count eq 1 }">
														<td class="state" rowspan="${fn:length(wsOrder.wsOrderItemList)}" style="vertical-align: inherit;">
															<c:if test="${wsOrder.orderState eq '0' }">
																<a class="but c6">等待付款</a>
															</c:if>
															<c:if test="${wsOrder.orderState eq '1' }">
																<a class="but c6">等待发货</a>
															</c:if>
															<c:if test="${wsOrder.orderState eq '2' }">
																<a class="but c6">等待收货</a>
															</c:if>
															<c:if test="${wsOrder.orderState eq '3' }">
																<a class="but c6">等待评价</a>
															</c:if>
															<c:if test="${wsOrder.orderState eq '5' }">
																<a class="but c6">已完成</a>
															</c:if>
															<c:if test="${wsOrder.orderState eq '6' }">
																<a class="but c6">退款订单</a>
															</c:if>
															<c:if test="${wsOrder.orderState eq '7' }">
																<a class="but c6">已取消</a>
															</c:if>
															<a href="${ctxWeb}/order/pcOrder/showListDetailOrder?orderId=${wsOrder.id}" class="but c9">订单详情</a>
														</td>
														<td class="order" rowspan="${fn:length(wsOrder.wsOrderItemList)}" style="vertical-align: inherit;">
															<div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
															<c:if test="${wsOrder.orderState eq '0' }">
																<a href="hd_shopcart_pay.html" class="but but-primary">立即付款</a>
																<a href="${ctxWeb}/order/pcOrder/closeOrder?id=${wsOrder.id}" onclick="return confirmx('确认要取消该订单吗？', this.href)" class="but c3">取消订单</a>
															</c:if>
															<c:if test="${wsOrder.orderState eq '3' }">
																<a class="but c6">等待评价</a>
															</c:if>
															<a href="${ctxWeb}/order/pcOrder/payOrder?orderId=${wsOrder.id}" class="but but-primary">立即付款</a>
															<a href="${ctxWeb}/order/pcOrder/applyReturnOrder?itemId=${wsOrderItem.id}&orderSn=${wsOrder.orderSn}" class="but c3">退款/退货</a>
														</td>
														</c:if>
													</tr>
													</c:forEach>
												</table>
											</tr>
											
											</c:forEach>
										</table>
										${page}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>