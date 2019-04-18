<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/pc/include/taglib.jsp"%>
<%--<%@ include file="/WEB-INF/views/include/taglib.jsp"%--%>>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="pc_shop"/>
    <title>平台公告</title>
</head>

<body>
    <!-- 内页导航栏 -->
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
        <section class="panel__div panel-message__div clearfix">
            <div class="filter-value">
                <div class="filter-title">平台公告</div>
            </div>
            <div class="pull-left">
                <div class="msg-list">
                    <c:forEach items="${page.list}" var="articleList" varStatus="status">
                        <c:choose>
                            <c:when test="${articleList.id eq artilce.id}">
                                <a class="ep active" href="${ctxWeb}/cms/noticeList?id=${articleList.id}">【${articleList.category.name}】${articleList.title}</a>
                            </c:when>
                            <c:otherwise>
                                <a class="ep" href="${ctxWeb}/cms/noticeList?id=${articleList.id}">【${articleList.category.name}】${articleList.title}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
               	<div class="page text-right clearfix">
					<c:if test="${page.pageNo != page.first}">
						<a href="javascript:onclick=page(${page.prev},${page.pageSize})"> 上一页</a>
					</c:if>
					<c:if test="${page.pageNo == page.first}">
						<a href="#"  class="disabled">上一页</a>
					</c:if>
					<c:if test="${page.begin > page.first}">
						...
					</c:if>
					<c:forEach var="x" begin="${page.begin}" end="${page.end}" step="1" > 
						<a href="javascript:onclick=page(${x},${page.pageSize})">${x}</a>
					</c:forEach> 
					<c:if test="${page.begin > page.first}">
						...
					</c:if>
					<c:if test="${page.pageNo == page.last}">
						<a href="#"> 下一页</a>
					</c:if>
					<c:if test="${page.pageNo != page.last}">
						<a href="javascript:onclick=page(${page.next},${page.pageSize})">下一页</a>
					</c:if>
				</div>
            </div>
            <div class="message-box pull-right">
                <div class="head-div clearfix posr">
                    <div class="title">【${article.category.name}】${article.title}</div>
                    <div class="time pull-right">发布时间：<fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                </div>
                <div class="html-code">
                    ${article.articleData.content}
                </div>
            </div>
        </section>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {

        });
		function page(n,s){
			location="${ctxWeb}/cms/noticeList?pageNo="+n+"&pageSize="+s;
		}
    </script>

</body>
</html>


