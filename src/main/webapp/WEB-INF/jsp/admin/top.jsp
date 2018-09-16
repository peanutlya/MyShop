<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
	<script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/bs/js/holder.min.js"></script>
</head>
<body>
<div class="navbar navbar-default navbar-static-top navbar-inverse" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a href="#" class="navbar-brand">人力资源管理系统</a>
		</div>
		<p class="navbar-text navbar-right"><span>当前管理员:<font style="vertical-align:1px">${manage.m_name}</font></span></p>
	</div>
</div>
</body>
</html>
