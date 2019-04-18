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
	.aaa {
		color: white;
		text-decoration: none;
	}
	
	.aaa:hover {
		color: #D0D0D0;
		text-decoration: none;
	}
</style>
</head>
	<body>
		<!-- 首页导航栏 -->
		<div class="top-nav bg3">
			<div class="nav-box inner">
				<div class="all-cat">
					<div class="title"><i class="iconfont icon-menu"> <a href="${ctxWeb}/product/getProdListByCat?prodOrderBy=createDate" class="aaa">全部分类</a></i></div>
					<div class="cat-list__box">
						<c:forEach items="${wsProdCategoryList}" var="category">
						<c:if test="${category.parent.id eq '0'}">
						<div class="cat-box">
							<div class="title">
								<i class="iconfont icon-skirt ce"></i> ${category.name}
							</div>
							<ul class="cat-list clearfix">
								<c:forEach items="${wsProdCategoryList}" var="twoCategory">
								<c:if test="${twoCategory.parent.id eq category.id}">
								<li class="new-li">
									<a href="${ctxWeb}/product/getProdListByCat?prodCategoryId=${twoCategory.id}&&prodOrderBy=createDate">${twoCategory.name}</a>
								</li>
								</c:if>
								</c:forEach>
							</ul>
						</div>
						</c:if>
						</c:forEach>
					</div>
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
				<div class="user-info__box">
					<div class="login-box">
						<div class="avt-port">
							<img src="${ctxStatic}/pcshop/images/favicon.ico" alt="欢迎来到汇达商城" class="cover b-r50">
						</div>
						<!-- 已登录 -->
						<c:if test="${not empty member}">
						<div class="name c6">Hi~ <span class="cr">18759808122</span></div>
						<div class="point c6">积分: 30</div>
						<div class="point c6">余额: 30 元</div>
						</c:if>
						<!-- 未登录 -->
						<c:if test="${empty member}">
						<div class="name c6">Hi~ 你好</div>
						<div class="point c6"><a href="">点此登录</a>，发现更多精彩</div>
						</c:if>
					</div>
					<div class="tags">
						<div class="tag"><i class="iconfont icon-real fz16"></i> 品牌正品</div>
						<div class="tag"><i class="iconfont icon-credit fz16"></i> 信誉认证</div>
						<div class="tag"><i class="iconfont icon-speed fz16"></i> 当天发货</div>
						<div class="tag"><i class="iconfont icon-tick fz16"></i> 人工质检</div>
					</div>
					<div align="center">
						<img src="${ctxStatic}/pcshop/images/ewm.jpg" alt="微信公众号二维码" style="width: 133px;height: 133px;" />
						<br />
						<span style="color: gray;">（扫描关注微信商城）</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 顶部轮播 -->
		<div class="swiper-container banner-box">
			<div class="swiper-wrapper">
				<c:forEach items="${adBannerList}" var="adBanner">
				<div class="swiper-slide">
					<a href="${adBanner.imgHref}"><img src="${adBanner.imgUrl}" class="cover"></a>
				</div>
				</c:forEach>
			</div>
			<div class="swiper-pagination"></div>
		</div>
		<!-- 首页楼层导航 -->
		<nav class="floor-nav visible-lg-block">
			<c:forEach items="${wsProdCategoryList}" var="category">
			<c:if test="${category.parent.id eq '0'}">
			<span class="scroll-nav">${category.name}</span>
			</c:if>
			</c:forEach>
		</nav>
		<!-- 楼层内容 -->
		<div class="content inner" style="margin-bottom: 40px;">
			<!-- 循环一级分类 -->
			<c:forEach items="${wsProdCategoryList}" var="category">
			<c:if test="${category.parent.id eq '0'}">
			<section class="scroll-floor floor-2">
				<div class="floor-title">
					<i class="iconfont icon-skirt fz16"></i> ${category.name}
					<div class="case-list fz0 pull-right">
						<!-- 循环二级分类 -->
						<c:forEach items="${wsProdCategoryList}" var="twoCategory">
						<c:if test="${twoCategory.parent.id eq category.id}">
							<a href="item_category.html">${twoCategory.name}</a>
						</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="con-box">
					<a class="left-img hot-img" href="">
						<img src="${category.imageUrl}" alt="" class="cover">
					</a>
					<div class="right-box">
						<c:forEach items="${wsProdCategoryList}" var="twoCategory">
							<c:if test="${twoCategory.parent.id eq category.id}">
								<c:forEach items="${wsProductList}" var="wsProduct">
									<c:if test="${wsProduct.prodCategoryId eq twoCategory.id}">
									<a href="${ctxWeb}/product/detail?id=${wsProduct.id}" class="floor-item">
										<div class="item-img hot-img">
											<img src="${wsProduct.prodImage}" alt="${wsProduct.title}" class="cover">
										</div>
										<div class="price clearfix">
											<span class="pull-left cr fz16">￥${wsProduct.minPrice}</span>
											<span class="pull-right c6">进货价</span>
										</div>
										<div class="name ep" title="${wsProduct.title}">${wsProduct.title}</div>
									</a>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</section>
			</c:if>
			</c:forEach>
		</div>
		<script>
			$(document).ready(function() {
				// 顶部banner轮播
				var banner_swiper = new Swiper('.banner-box', {
					autoplayDisableOnInteraction: false,
					pagination: '.banner-box .swiper-pagination',
					paginationClickable: true,
					autoplay: 5000,
				});
				// 新闻列表滚动
				var notice_swiper = new Swiper('.notice-box .swiper-container', {
					paginationClickable: true,
					mousewheelControl: true,
					direction: 'vertical',
					slidesPerView: 10,
					autoplay: 2e3,
				});
				// 楼层导航自动 active
				$.scrollFloor();
				// 页面下拉固定楼层导航
				$('.floor-nav').smartFloat();
				$('.to-top').toTop({
					position: false
				});
			});
		</script>
	</body>
</html>