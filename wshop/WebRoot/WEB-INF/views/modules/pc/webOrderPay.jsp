<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<!DOCTYPE html>
<html >

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
				<div class="user-content__box clearfix bgf">
					<div class="title">购物车-确认支付 </div>
					<div class="shop-title">收货地址</div>
					<form action="" class="shopcart-form__box">
						<div class="addr-radio">
							<c:forEach items="${wsMember.wsAddressList}" var="wsAddressItem" varStatus="status">
							<div class="radio-line radio-box active">
								<label class="radio-label ep" title="${wsAddressItem.address } ${wsAddressItem.consignee } ${wsAddressItem.tel }">
									<input name="addr" checked="" value="0" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
									${wsAddressItem.city } ${wsAddressItem.address } ${wsAddressItem.consignee } ${wsAddressItem.tel }
								</label>
								<a href="javascript:;" class="default">默认地址</a>
								<a href="hd_address_edit.html" class="edit">修改</a>
							</div>
							</c:forEach>
						</div>
						<div class="add_addr">
							<a href="hd_address.html">添加新地址</a>
						</div>
						<div class="shop-title">确认订单</div>
						<div class="shop-order__detail">
							<table class="table">
								<thead>
									<tr>
										<th width="120"></th>
										<th width="300">商品信息</th>
										<th width="150">单价</th>
										<th width="200">数量</th>
<!-- 										<th width="200">运费</th> -->
										<th width="80">总价</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${wsOrder.wsOrderItemList}" var="wsOrderItem" varStatus="status">
									<tr>
										<th scope="row">
											<a href="item_show.html">
												<div class="img"><img src="${wsOrderItem.thumb}" alt="${wsOrderItem.wsProduct.title}" class="cover"></div>
											</a>
										</th>
										<td>
											<div class="name ep3">${wsOrderItem.wsProduct.title}</div>
											<div class="type c9">${wsOrderItem.skuSpec}</div>
										</td>
										<td>${wsOrderItem.unitPrice }</td>
										<td>${wsOrderItem.quantity }</td>
<%-- 										<td>${wsOrderItem.postage }</td> --%>
										<td>${wsOrderItem.reallyPrice }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="shop-cart__info clearfix">
							<div class="pull-left text-left">
								<div class="info-line text-nowrap">购买时间：<span class="c6"><fmt:formatDate value="${wsOrder.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span></div>
								<div class="info-line text-nowrap">交易类型：<span class="c6">担保交易</span></div>
								<div class="info-line text-nowrap">交易号：<span class="c6">1001001830267490496</span></div>
							</div>
							<div class="pull-right text-right">
								<div class="form-group">
									<label for="coupon" class="control-label">优惠券使用：</label>
									<select id="coupon">
										<option value="-1" selected>- 请选择可使用的优惠券 -</option>
										<option value="1">【满￥20.0元减￥2.0】</option>
										<option value="2">【满￥30.0元减￥2.0】</option>
										<option value="3">【满￥25.0元减￥1.0】</option>
										<option value="4">【满￥10.0元减￥1.5】</option>
										<option value="5">【满￥15.0元减￥1.5】</option>
										<option value="6">【满￥20.0元减￥1.0】</option>
									</select>
								</div>
								<script>
									$('#coupon').bind('change', function() {
										console.log($(this).val());
									})
								</script>
								<div class="info-line">优惠活动：<span class="c6">无</span></div>
								<div class="info-line">运费：<span class="c6">¥${wsOrder.postage }</span></div>
								<div class="info-line"><span class="favour-value">已优惠 ¥2.0</span>合计：<b class="fz18 cr">¥${wsOrder.reallyPrice }</b></div>
								<div class="info-line fz12 c9">（可获 <span class="c6">20</span> 积分）</div>
							</div>
						</div>
						<div class="shop-title">确认订单</div>
						<div class="pay-mode__box">
							<div class="radio-line radio-box">
								<label class="radio-label ep">
								<input name="pay-mode" value="1" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								<span class="fz16">余额支付</span><span class="fz14">（可用余额：¥88.0）</span>
							</label>
								<div class="pay-value">支付<b class="fz16 cr">${wsOrder.reallyPrice }</b>元</div>
							</div>
							<div class="radio-line radio-box">
								<label class="radio-label ep">
								<input name="pay-mode" value="2" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								<img src="images/icons/alipay.png" alt="支付宝支付">
							</label>
								<div class="pay-value">支付<b class="fz16 cr">${wsOrder.reallyPrice }</b>元</div>
							</div>
							<div class="radio-line radio-box">
								<label class="radio-label ep">
								<input name="pay-mode" value="3" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								<img src="images/icons/paywechat.png" alt="微信支付">
							</label>
								<div class="pay-value">支付<b class="fz16 cr">${wsOrder.reallyPrice }</b>元</div>
							</div>
						</div>
						<div class="user-form-group shopcart-submit">
							<button type="submit" class="btn">继续支付</button>
						</div>
						<script>
							$(document).ready(function() {
								$(this).on('change', 'input', function() {
									$(this).parents('.radio-box').addClass('active').siblings().removeClass('active');
								})
							});
						</script>
					</form>
				</div>
			</section>
		</div>
	</body>

</html>