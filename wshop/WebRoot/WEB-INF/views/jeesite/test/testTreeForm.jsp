<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>树结构管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")){
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
		<li><a href="${ctx}/test/testTree/">树结构列表</a></li>
		<li class="active"><a href="${ctx}/test/testTree/form?id=${testTree.id}&parent.id=${testTreeparent.id}">树结构<shiro:hasPermission name="test:testTree:edit">${not empty testTree.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="test:testTree:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="testTree" action="${ctx}/test/testTree/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>	
				<div class="box-body">		
				<div class="form-group">
					<label  class="col-sm-2 control-label">上级父级编号:</label>
					<div class="col-sm-4 controls">
						<sys:treeselect id="parent" name="parent.id" value="${testTree.parent.id}" labelName="parent.name" labelValue="${testTree.parent.name}"
							title="父级编号" url="/test/testTree/treeData" extId="${testTree.id}" cssClass="form-control" allowClear="true"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>名称：</label>
					<div class="col-sm-4 controls">
						<form:input path="name" htmlEscape="false" maxlength="100" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>排序：</label>
					<div class="col-sm-4 controls">
						<form:input path="sort" htmlEscape="false" maxlength="10" class="form-control required digits"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">备注信息：</label>
					<div class="col-sm-4 controls">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</div>
				</div>
				</div>
				<div class="box-footer">
					<label class="col-sm-3 control-label"></label>
					<shiro:hasPermission name="test:testTree:edit">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
			</div>
		</div>
      </div>
    </section>
</body>
</html>