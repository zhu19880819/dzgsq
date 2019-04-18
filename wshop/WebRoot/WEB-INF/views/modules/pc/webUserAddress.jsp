<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<%@include file="/WEB-INF/views/modules/pc/include/head.jsp"%>
<%--<%@include file="/WEB-INF/views/include/head.jsp" %>--%>
<!DOCTYPE html>
<html>

<head>
    <title>收货地址</title>
</head>
<body>
		<!-- 顶部标题 -->
		<div class="bgf5 clearfix">
			<div class="top-user">
				<div class="inner">
					<a class="logo" href="index.html"><img src="${ctxStatic}/pcshop/images/icons/logo.jpg" alt="Wshop汇达商城" class="cover"></a>
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
						<div class="title">账户信息-收货地址</div>
						<form action="${ctxWeb}/address/save" class="user-addr__form form-horizontal">
                            <input type="hidden" name="id" value="${ws.id}"/>
							<p class="fz18 cr">新增收货地址<span class="c6" style="margin-left: 20px">电话号码、手机号码选填一项，其余均为必填项</span></p>
							<div class="form-group">
								<label for="consignee" class="col-sm-2 control-label">收货人姓名：</label>
								<div class="col-sm-6">
									<input class="form-control" value="${ws.consignee}" id="consignee" name="consignee" placeholder="请输入姓名" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label">收货地址：</label>
								<div class="col-sm-10">
									<div class="addr-linkage">
                                        <!--省份选择-->
                                        <select id="prov" onchange="showCity(this)">
                                            <option>=请选择省份=</option>
                                        </select>
                                        <!--城市选择-->
                                        <select id="citys" onchange="showCountry(this)">
                                            <option>=请选择城市=</option>
                                        </select>
                                        <!--县区选择-->
                                        <select id="country" onchange="selecCountry(this)">
                                            <option>=请选择县区=</option>
                                        </select>
                                        <input type="hidden" value="${ws.city}" id="city" name="city">
									</div>
									<input class="form-control" value="${ws.address}" id="address" name="address" placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码等信息" maxlength="30" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label for="tel" class="col-sm-2 control-label">手机号码：</label>
								<div class="col-sm-6">
									<input class="form-control" value="${ws.tel}" id="tel" name="tel" placeholder="请输入手机号码" type="text" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-6">
									<div class="checkbox">
										<label><input type="checkbox" value="1" ${ws.isDefault eq '1' ? 'checked' : ''} id="isDefault" name="isDefault" /><i></i> 设为默认收货地址</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-6">
									<%--<button type="submit" class="but">保存</button>--%>
                                    <input type="submit" class="but"></input>
								</div>
							</div>
						</form>
						<p class="fz18 cr">已保存的有效地址</p>

						<div class="table-thead addr-thead">
							<div class="tdf1">收货人</div>
							<div class="tdf2">所在地</div>
							<div class="tdf3">
								<div class="tdt-a_l">详细地址</div>
							</div>
							<div class="tdf1">电话/手机</div>
							<div class="tdf1">操作</div>
							<div class="tdf1"></div>
						</div>
						<div class="addr-list">
                            <c:forEach items="${wsAddressList}" var="wsAddress" varStatus="status">
                                <div class="addr-item">
                                    <div class="tdf1">${wsAddress.consignee}</div>
                                    <div class="tdf2 tdt-a_l">${wsAddress.city}</div>
                                    <div class="tdf3 tdt-a_l">${wsAddress.address}</div>
                                    <div class="tdf1">${wsAddress.tel}</div>
                                    <div class="tdf1 order">
                                        <a href="${ctxWeb}/address/list?id=${wsAddress.id}">修改</a>
                                        <a href="${ctxWeb}/address/delete?id=${wsAddress.id}" onclick="return confirmx('确认要删除吗？', this.href)">删除</a>
                                    </div>
                                    <div class="tdf1">
                                        <c:choose>
                                            <c:when test="${wsAddress.isDefault eq '1'}">
                                                <a href="" class="default active">默认地址</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="" class="default">设为默认</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
						</div>
					</div>
				</div>
			</section>
		</div>
	</body>

<script type="text/javascript" src="${ctxStatic}/pcshop/js/city.js"></script>
<script type="text/javascript" src="${ctxStatic}/pcshop/js/method01.js"></script>


</html>