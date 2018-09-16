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
<script>
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    if(index){
        parent.layer.close(index);
        window.parent.location.reload();
    }
</script>

<body>
<%@include file="top.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <%@include file="left.jsp"%>
        </div>
        <div class="col-md-8">
            <jsp:include page="${mainPage==null?'welcome.jsp':mainPage}"></jsp:include>
        </div>
    </div>
</div>
<%@include file="bottom.jsp"%>


</body>

</html>



</div>