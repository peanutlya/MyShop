<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/25
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
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

<div id="left">
	<ul class="nav nav-pills nav-stacked myul">
		<li><a href="${pageContext.request.contextPath}/admin/index">系统菜单</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/category/list">分类管理</a></li>
		<li><a href="${pageContext.request.contextPath}/ManageServlet?op=employeeManage">员工管理</a></li>
		<li id="test"><a href="${pageContext.request.contextPath}/ManageServlet?op=exit">安全退出</a></li>
	</ul>
</div>



</body>
</html>
