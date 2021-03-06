<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>活动配置管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/config/wsActivity/">活动配置列表</a></li>
		<shiro:hasPermission name="config:wsActivity:edit"><li><a href="${ctx}/config/wsActivity/form">活动配置添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<form:form id="searchForm" modelAttribute="wsActivity" action="${ctx}/config/wsActivity/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="box-body">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">活动标题：</label>
								<div class="col-sm-8">
									<form:input path="title" htmlEscape="false" maxlength="100" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">活动类型：</label>
								<div class="col-sm-8">
									<form:select path="activityType" class="form-control">
										<form:option value="" label=""/>
										<form:options items="${fns:getDictList('activity_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-md-offset-5"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></div>
					</div>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
						<tr>
							<th class="text-center">编号</th>
							<th class="text-center">活动标题</th>
							<th class="text-center">活动类型</th>
							<th class="text-center">优先级</th>
							<shiro:hasPermission name="config:wsActivity:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					<c:forEach items="${page.list}" var="wsActivity">
						<tr>
							<td class="text-center"><a href="${ctx}/config/wsActivity/form?id=${wsActivity.id}">
								${wsActivity.code}
							</a></td>
							<td class="text-center">
								${wsActivity.title}
							</td>
							<td class="text-center">
								${fns:getDictLabel(wsActivity.activityType, 'activity_type', '')}
							</td>
							<td class="text-center">
								${wsActivity.priority}
							</td>
							<shiro:hasPermission name="config:wsActivity:edit"><td>
			    				<a href="${ctx}/config/wsActivity/form?id=${wsActivity.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
								<a href="${ctx}/config/wsActivity/delete?id=${wsActivity.id}" onclick="return confirmx('确认要删除该活动配置吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
							</td></shiro:hasPermission>
						</tr>
					</c:forEach>
				</table>
					${page}					 
				</div>
			</div>
		</div>
	</section>
</body>
</html>