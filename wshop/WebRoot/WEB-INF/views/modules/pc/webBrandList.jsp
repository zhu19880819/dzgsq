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
			<section class="panel__div clearfix">
				<div class="filter-value">
					<div class="filter-title">品牌推荐</div>
				</div>
				<div class="video-list_div">
					<c:forEach items="${bandList}" var="band">
						<a href="${ctxWeb}/product/getProdListByBrand?brandId=${brand.id}">
						<div class="video-box">
							<div class="img">
								<img src="${band.logo}" alt="" style="width:260px;height:250px; class=" cover ">
							</div>
							<div class="buttom ">
								<div class="title ep ">${band.cnname}</div>
								<div class="price ">了解详情</div>
							</div>
						</div>
						</a>
					</c:forEach>
				</div>
			</section>
		</div>
	</body>
</html>