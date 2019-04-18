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
							<dd>个人资料</dd>
						</a>
						<a href="hd_treasurer.html">
							<dd>资金管理</dd>
						</a>
						<a href="hd_integral.html">
							<dd class="active">积分平台</dd>
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
						<a href="hd_pwd_modify.html">
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
						<div class="title">账户信息-积分平台</div>
						<ul class="nav user-nav__title" role="tablist">
							<li role="presentation" class="nav-item active">
								<a href="#list" aria-controls="list" role="tab" data-toggle="tab">我的积分</a>
							</li>
							<li role="presentation" class="nav-item ">
								<a href="#detail" aria-controls="detail" role="tab" data-toggle="tab">积分明细</a>
							</li>
						</ul>
						<div class="integral-box clearfix bgf5">
							<div class="integral-total">
								<div class="fz16">可用的积分</div>
								<b class="num">${wsMember.score}</b>
							</div>
							<div class="integral-desc">
								<b class="cr fz16">积分使用规则：</b><br>
								<span class="c3">1、如何获得积分？</span>
								<ul>
									<li>1) 积分可以通过在购买商品获得，积分会在确认收货的时候增加。</li>
									<li>2) 通过签到获得：每次签到可获得 3 积分</li>
								</ul>
								<span class="c3">2、如何使用积分？</span>
								<ul>
									<li>可使用积分兑换商品</li>
								</ul>
							</div>
						</div>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="list">
								<p class="fz18 cr">商品兑换</p>
								<ul class="nav user-nav__title" role="tablist">
									<li role="presentation" class="nav-item active">
										<a href="#all" aria-controls="all" role="tab" data-toggle="tab">全部</a>
									</li>
									<li role="presentation" class="nav-item ">
										<a href="#usable" aria-controls="usable" role="tab" data-toggle="tab">可兑换</a>
									</li>
								</ul>
								<div class="table-thead">
									<div class="tdf3">商品信息</div>
									<div class="tdf2">市场价</div>
									<div class="tdf2">所需积分</div>
									<div class="tdf1">操作</div>
								</div>
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane fade in active" id="all">
										<div class="integral-item__list">
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz1.jpg" alt="" class="cover"></div>
														<div class="name ep2"> 铜扣记条纹T恤女短袖宽松显瘦2018夏季新款 学院百搭打底上衣女</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥269.90</span></div>
												<div class="tdf2"><span class="cr">500</span></div>
												<div class="tdf1">
													<a class="but" href="#" role="button">兑换</a>
												</div>
											</div>
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz2.jpg" alt="" class="cover"></div>
														<div class="name ep2">铜扣记蕾丝连衣裙中长款雪纺碎花2018夏季新款荷叶袖仙女裙沙滩裙</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥1269.90</span></div>
												<div class="tdf2"><span class="cr">2000</span></div>
												<div class="tdf1">
													<a class="but disabled" href="#" role="button">积分不够</a>
												</div>
											</div>
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz3.jpg" alt="" class="cover"></div>
														<div class="name ep2">LIN2018夏新款pphome18文艺仙女裙子褶皱奶油超仙温柔裙连衣裙女</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥1269.90</span></div>
												<div class="tdf2"><span class="cr">700</span></div>
												<div class="tdf1">
													<a class="but" href="#" role="button">兑换</a>
												</div>
											</div>
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz4.jpg" alt="" class="cover"></div>
														<div class="name ep2">梅子熟了复古温柔风吊带裙中长款雪纺仙女连衣裙2018夏新款初恋裙</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥1269.90</span></div>
												<div class="tdf2"><span class="cr">700</span></div>
												<div class="tdf1">
													<a class="but" href="#" role="button">兑换</a>
												</div>
											</div>
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz5.jpg" alt="" class="cover"></div>
														<div class="name ep2">2018夏季新款港味复古chic裙子白色中长款连衣裙女仙女褶皱奶油裙</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥1269.90</span></div>
												<div class="tdf2"><span class="cr">700</span></div>
												<div class="tdf1">
													<a class="but" href="#" role="button">兑换</a>
												</div>
											</div>
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz6.jpg" alt="" class="cover"></div>
														<div class="name ep2"> 子晴双肩带设计吊带背心女夏季新款原宿chic短款内搭显瘦打底上衣</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥1269.90</span></div>
												<div class="tdf2"><span class="cr">700</span></div>
												<div class="tdf1">
													<a class="but" href="#" role="button">兑换</a>
												</div>
											</div>
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz7.jpg" alt="" class="cover"></div>
														<div class="name ep2"> RoseLingLing削肩时髦24支曲珠冰凉透气百搭实穿夏内搭打底背心女</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥1269.90</span></div>
												<div class="tdf2"><span class="cr">700</span></div>
												<div class="tdf1">
													<a class="but" href="#" role="button">兑换</a>
												</div>
											</div>
										</div>
										<div class="page text-right clearfix">
											<a class="disabled">上一页</a>
											<a class="select">1</a>
											<a href="">2</a>
											<a href="">3</a>
											<a class="" href="">下一页</a>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane fade" id="usable">
										<div class="integral-item__list">
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz8.jpg" alt="" class="cover"></div>
														<div class="name ep2"> 韩范ins百搭短袖t恤女2018早春款新款白色半袖中长款打底chic上衣</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥269.90</span></div>
												<div class="tdf2"><span class="cr">500</span></div>
												<div class="tdf1">
													<a class="but" href="#" role="button">兑换</a>
												</div>
											</div>
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz9.jpg" alt="" class="cover"></div>
														<div class="name ep2">夏季防晒服男韩版潮流超薄透气防紫外线青少年帅气外套情侣防晒衣</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥1269.90</span></div>
												<div class="tdf2"><span class="cr">2000</span></div>
												<div class="tdf1">
													<a class="but disabled" href="#" role="button">积分不够</a>
												</div>
											</div>
											<div class="integral-item">
												<div class="tdf3">
													<a class="integral-item__info" href="">
														<div class="img"><img src="images/nz10.jpg" alt="" class="cover"></div>
														<div class="name ep2"> 防晒衣服男夏季连帽透气韩版修身青少年夹克薄款帅气男士外套潮流英雄煮</div>
														<div class="type">颜色分类：深棕色 尺码：均码</div>
													</a>
												</div>
												<div class="tdf2"><span class="c9">¥1269.90</span></div>
												<div class="tdf2"><span class="cr">700</span></div>
												<div class="tdf1">
													<a class="but" href="#" role="button">兑换</a>
												</div>
											</div>
										</div>
										<div class="page text-right clearfix">
											<a class="disabled">上一页</a>
											<a class="select">1</a>
											<a href="">2</a>
											<a href="">3</a>
											<a class="" href="">下一页</a>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="detail">
								<div class="table-thead">
									<div class="tdf3">来源/用途</div>
									<div class="tdf2">积分变化</div>
									<div class="tdf2">日期</div>
									<div class="tdf1">备注</div>
								</div>
								<div class="integral-item__list">
									<div class="integral-item">
										<div class="tdf3">
											<a class="integral-item__info" href="">
												<div class="img"><img src="images/temp/M-001.jpg" alt="" class="cover"></div>
												<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
												<div class="type">颜色分类：深棕色 尺码：均码</div>
											</a>
										</div>
										<div class="tdf2">
											<b class="fz24 cg">+200</b>
										</div>
										<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
										<div class="tdf1">
											<span class="c6">交易获得</span>
										</div>
									</div>
									<div class="integral-item">
										<div class="tdf3">
											<a class="integral-item__info" href="">
												<div class="img"><img src="images/temp/M-002.jpg" alt="" class="cover"></div>
												<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
												<div class="type">颜色分类：深棕色 尺码：均码</div>
											</a>
										</div>
										<div class="tdf2">
											<b class="fz24 cr">-1500</b>
										</div>
										<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
										<div class="tdf1">
											<span class="c6">兑换消耗</span>
										</div>
									</div>
									<div class="integral-item">
										<div class="tdf3">
											<a class="integral-item__info" href="">
												<div class="img"><img src="images/temp/M-003.jpg" alt="" class="cover"></div>
												<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
												<div class="type">颜色分类：深棕色 尺码：均码</div>
											</a>
										</div>
										<div class="tdf2">
											<b class="fz24 cg">+300</b>
										</div>
										<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
										<div class="tdf1">
											<span class="c6">交易获得</span>
										</div>
									</div>
									<div class="integral-item">
										<div class="tdf3">
											<a class="integral-item__info" href="">
												<div class="img"><img src="images/temp/M-004.jpg" alt="" class="cover"></div>
												<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
												<div class="type">颜色分类：深棕色 尺码：均码</div>
											</a>
										</div>
										<div class="tdf2">
											<b class="fz24 cg">+250</b>
										</div>
										<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
										<div class="tdf1">
											<span class="c6">交易获得</span>
										</div>
									</div>
									<div class="integral-item">
										<div class="tdf3">
											<a class="integral-item__info" href="">
												<div class="img"><img src="images/temp/M-005.jpg" alt="" class="cover"></div>
												<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
												<div class="type">颜色分类：深棕色 尺码：均码</div>
											</a>
										</div>
										<div class="tdf2">
											<b class="fz24 cg">+450</b>
										</div>
										<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
										<div class="tdf1">
											<span class="c6">交易获得</span>
										</div>
									</div>
									<div class="integral-item">
										<div class="tdf3">
											<a class="integral-item__info" href="">
												<div class="img"><img src="images/temp/M-006.jpg" alt="" class="cover"></div>
												<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
												<div class="type">颜色分类：深棕色 尺码：均码</div>
											</a>
										</div>
										<div class="tdf2">
											<b class="fz24 cr">-1000</b>
										</div>
										<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
										<div class="tdf1">
											<span class="c6">兑换消耗</span>
										</div>
									</div>
									<div class="integral-item">
										<div class="tdf3">
											<a class="integral-item__info" href="">
												<div class="img"><img src="images/temp/M-007.jpg" alt="" class="cover"></div>
												<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
												<div class="type">颜色分类：深棕色 尺码：均码</div>
											</a>
										</div>
										<div class="tdf2">
											<b class="fz24 cr">-12450</b>
										</div>
										<div class="tdf2"><span class="c6">2017年4月12日 15:13:14</span></div>
										<div class="tdf1">
											<span class="c6">兑换消耗</span>
										</div>
									</div>
								</div>
								<div class="page text-right clearfix">
									<a class="disabled">上一页</a>
									<a class="select">1</a>
									<a href="">2</a>
									<a href="">3</a>
									<a class="" href="">下一页</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>	
	</body>
</html>