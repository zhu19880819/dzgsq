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
		<div class="top-nav bg3">
			<div class="nav-box inner">
				<div class="all-cat">
					<div class="title"><i class="iconfont icon-menu"> <a href="item_category.html"class="aaa">全部分类</a></i></div>
					<style>
						.aaa {
							color: white;
							text-decoration: none;
						}
						
						.aaa:hover {
							color: #D0D0D0;
							text-decoration: none;
						}
					</style>
				</div>
				<ul class="nva-list">
					<a href="${pageContext.request.contextPath}/">
						<li class="active">首页</li>
					</a>
					<a href="${ctxWeb}/brand/list">
						<li>品牌</li>
					</a>
					<a href="${ctxWeb}/coupon/index">
						<li>优惠券</li>
					</a>
					<a href="${ctxWeb}/reward/index">
						<li>邀请奖励</li>
					</a>
					<a href="${ctxWeb}/cms/about">
						<li>关于我们</li>
					</a>
                    <a href="${ctxWeb}/cms/noticeList">
                        <li class="active">平台公告</li>
                    </a>
				</ul>
			</div>
		</div>
		<div class="content inner">
			<section class="invite-agent clearfix">
				<div class="agent-level">
					<h2 class="cr fz18">邀请奖励</h2>
					<!-- <p class="c6">欢迎您，亲爱的代销商，您当前的等级是【一级会员代销商】</p> -->
					<div class="agent-buy clearfix">
						<!-- <form action="" class="content" id="agent" style="border-right: 1px solid #b31e22">
						<b class="fz16 cr">您可以升级为以下会员：</b>
						<div class="radio"><label><i class="iconfont"></i><input name="agent" value="lv2" type="radio">二级会员代销商：500元</label></div>
						<div class="radio"><label><i class="iconfont"></i><input name="agent" value="lv3" type="radio">高级会员代销商：1000元</label></div>
						<button type="button" class="btn btn-block btn-primary">立即支付</button>
					</form> -->
						<!-- <form action="" class="content" id="agent" style="border-right: 1px solid #b31e22">
						<b class="fz16 cr">您已高级会员代销商！</b>
						<p><br></p>
						<b class="fz20 c6">感谢您对我们的信赖，<br><small>Wshop汇达商城竭诚为您服务~</small></b>
					</form> -->
						<div class="content">
							<h2>具体说明</h2>
							<p>1.支付宝网站(www.alipay.com) 是国内先进的网上支付平台。<br>支付宝收款接口：在线即可开通，零预付，免年费，单笔阶梯费率，无流量限制支付宝网站(www.alipay.com) <br>是国内先进的网上支付平台。<br>2.支付宝收款接口：在线即可开通，零预付，免年费，单笔阶梯费率，无流量限制</p>
						</div>
					</div>
				</div>
			</section>
			<section class="invite-agent clearfix">
				<div class="filter-value">
					<div class="filter-title">邀请奖励说明</div>
				</div>
				<div class="html-code">
					<p>1.开通代理需要填写申请代理的信息，并额定支付代理费用提交后台审核，审核通过后成为代理，代理和普通会员显示的商品的价格不同，结算的时候会展示比普通会员优惠的金额</p>
					<p>2.代理和普通会员的区别：普通会员可以购买2件商品。代理购买商品时无数量限制</p>
					<br /><br /><br />
				</div>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="add">
						<form action="" class="user-setting__form" role="form">
							<div class="form-group" >
								<div class="user-form-group tags-box">
									<a href="hd_spread.html"><button type="button" class="btn ">推广产品</button></a>
									<a href="hd_lookover.html"><button type="button" class="btn ">查看奖励</button></a>
								</div>
						    </div>
						</form>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>