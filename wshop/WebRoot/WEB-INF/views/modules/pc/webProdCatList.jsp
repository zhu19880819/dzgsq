<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="pc_shop" />
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
	<div class="content inner">
		<section class="filter-section clearfix">
			<ol class="breadcrumb">
				<li><a href="index.html">首页</a></li>
				<li class="active">商品分类筛选</li>
			</ol>
			<div class="filter-box">
				<div class="all-filter">
					<div class="filter-value">
						<div class="filter-title">
							选择商品分类 <i class="iconfont icon-down"></i>
						</div>
						<!-- 已选选项 -->
						<div class="ul_filter">
							<span class="pull-left"> 已选分类：${wsProdCategory.name} <a href="javascript:;"
								class="close">&times;</a>
							</span>
						</div>
					</div>
				</div>
				<div class="filter-prop-item">
					<span class="filter-prop-title">一级分类：</span>
					<ul class="clearfix">
						<li class="new-lis"><a href="">全部</a></li>
						<c:forEach items="${wsProdCategoryList}" var="category">
						<c:if test="${category.parent.id eq '0'}">
						<li class="new-li"><a href="">${category.name}</a></li>
						</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="filter-prop-item">
					<span class="filter-prop-title">二级分类：</span>
					<ul class="clearfix">
						<li class="new-lis"><a href="">全部</a></li>
						<c:forEach items="${wsProdCategoryList}" var="category">
						<c:if test="${category.parent.id eq topProdCategory.id}">
						<li class="new-li"><a href="">${category.name}</a></li>
						</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="sort-box bgf5">
				<div class="sort-text">排序：</div>
				<a href="">
					<div class="sort-text">
						销量 <i class="iconfont icon-sortDown"></i>
					</div>
				</a> <a href="">
					<div class="sort-text">
						评价 <i class="iconfont icon-sortUp"></i>
					</div>
				</a> <a href="">
					<div class="sort-text">
						价格 <i class="iconfont"></i>
					</div>
				</a>
				<div class="sort-total pull-right">共1688个商品</div>
			</div>
		</section>
		<section class="item-show__div clearfix">
			<div class="pull-left">
				<div class="item-list__area clearfix">
				<c:forEach items="${wsProductList}" var="wsProduct">
					<div class="item-card">
						<a href="${ctxWeb}/product/detail?id=${wsProduct.id}" class="photo"> 
							<img src="${wsProduct.prodImage}" alt="${wsProduct.title}" class="cover">
							<div class="name">${wsProduct.title}</div>
						</a>
						<div class="middle">
							<div class="price">
								<small>￥</small>${wsProduct.minPrice}
							</div>
							<div class="sale">
								<a href="">加入购物车</a>
							</div>
						</div>
						<div class="buttom">
							<div>
								销量 <b>${wsProduct.selNum}</b>
							</div>
							<div>
								浏览量<b>${wsProduct.clickNum}</b>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- 分页 -->
				<div class="page text-right clearfix">
					<a class="disabled">上一页</a> 
					<a class="select">1</a> 
					<a href="">2</a>
					<a href="">3</a> 
					<a href="">4</a> 
					<a href="">5</a> 
					<a class="" href="">下一页</a> 
					<a class="disabled">1/5页</a>
					<form action="" class="page-order"> 
						到第<input type="text" name="page"> 页 
						<input class="sub" type="submit" value="确定">
					</form>
				</div>
			</div>
			<div class="pull-right">

				<div class="desc-segments__content">
					<div class="lace-title">
						<span class="c6">爆款推荐</span>
					</div>
					<div class="picked-box">
						<a href="" class="picked-item"><img src="images/nz21.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
						<a href="" class="picked-item"><img src="images/nz22.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
						<a href="" class="picked-item"><img src="images/nz23.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
						<a href="" class="picked-item"><img src="images/nz25.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
						<a href="" class="picked-item"><img src="images/nz24.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
						<a href="" class="picked-item"><img src="images/nz26.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
						<a href="" class="picked-item"><img src="images/nz27.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
						<a href="" class="picked-item"><img src="images/nz28.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
						<a href="" class="picked-item"><img src="images/nz29.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
						<a href="" class="picked-item"><img src="images/nz30.jpg"
							alt="" class="cover"><span class="look_price">¥134.99</span></a>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>