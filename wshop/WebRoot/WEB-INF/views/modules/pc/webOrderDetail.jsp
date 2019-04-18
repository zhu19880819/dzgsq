<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="decorator" content="pc_shop"/>
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
						<div class="title">订单中心-${wsOrder.orderSn }</div>
						<div class="order-info__box">
							<div class="order-addr">收货地址：<span class="c6">${wsOrder.address.consignee }, ${wsOrder.address.tel }, ${wsOrder.address.city }${wsOrder.address.address } </span></div>
							<div class="order-info">
								订单信息
								<table>
									<tr>
										<td>订单编号：${wsOrder.orderSn }</td>
										<td>支付宝交易号：20175215464616164616</td>
										<td>创建时间：<fmt:formatDate value="${wsOrder.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									</tr>
									<tr>
										<td>付款时间：XXXX-XX-XX XX:XX:XX</td>
										<td>成交时间：XXXX-XX-XX XX:XX:XX</td>
										<td></td>
									</tr>
								</table>
							</div>
							<div class="table-thead">
								<div class="tdf3">商品</div>
								<div class="tdf1">状态</div>
								<div class="tdf1">数量</div>
								<div class="tdf1">单价</div>
								<div class="tdf2">优惠</div>
								<div class="tdf1">总价</div>
								<div class="tdf1">运费</div>
							</div>
							<div class="order-item__list">
								<c:forEach items="${wsOrder.wsOrderItemList}" var="wsOrderItem" varStatus="status">
								<div class="item">
									<div class="tdf3">
										<a href="item_show.html">
											<div class="img"><img src="${wsOrderItem.thumb}" alt="${wsOrderItem.wsProduct.title}" class="cover"></div>
											<div class="ep2 c6">${wsOrderItem.wsProduct.title}</div>
										</a>
										<div class="attr ep">${wsOrderItem.skuSpec}</div>
									</div>
									<div class="tdf1">
										<a href="order_evaluate.html">
											<c:if test="${wsOrder.orderState eq '3' }">
												等待评价
											</c:if>
											<c:if test="${wsOrder.orderState eq '5' }">
												已完成
											</c:if>
										</a>
										<!-- 已确认收货 -->
									</div>
									<div class="tdf1">${wsOrderItem.quantity }</div>
									<div class="tdf1">${wsOrderItem.unitPrice }</div>
									<div class="tdf2">
										<div class="ep2">活动8折优惠<br>优惠：¥4.0</div>
									</div>
									<div class="tdf1">${wsOrderItem.reallyPrice }</div>
									<div class="tdf1">
										<div class="ep2">快递<br>${wsOrder.postage }</div>
									</div>
								</div>
								</c:forEach>
							</div>
							<div class="price-total">
								<div class="fz12 c9">使用优惠券【满￥20.0减￥2.0】优惠￥2.0元<br>快递运费 ￥${wsOrder.postage }</div>
								<div class="fz18 c6">实付款：<b class="cr">¥${wsOrder.reallyPrice }</b></div>
								<div class="fz12 c9">（本单可获 <span class="c6">380</span> 积分）</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>