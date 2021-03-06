<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>评论回复管理管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/prod/wsConsulation/">评论回复管理列表</a></li>
		<li class="active"><a href="${ctx}/prod/wsConsulation/form?id=${wsConsulation.id}">评论回复管理<shiro:hasPermission name="prod:wsConsulation:edit">${not empty wsConsulation.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="prod:wsConsulation:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="wsConsulation" action="${ctx}/prod/wsConsulation/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>	
				<div class="box-body">	
				<div class="form-group">
					<label  class="col-sm-2 control-label">评论产品：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="productTitle" htmlEscape="false" maxlength="64" class="form-control " readonly="true"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">评论会员：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="nickname" htmlEscape="false" maxlength="64" class="form-control " readonly="true"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">内容：
					</label>
					<div class="col-sm-4 controls">
						<form:textarea path="consulationContent" htmlEscape="false" rows="4" maxlength="1500" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">商品评分：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="prodConsulationLevel" htmlEscape="false" rows="4" maxlength="1500" class="form-control digits required"/>
					</div>
				</div>
				</div>
				<div class="box-footer">
					<label class="col-sm-3 control-label"></label>
					<shiro:hasPermission name="prod:wsConsulation:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
        </div>
	</div>
     </div>
   </section>
</body>
</html>