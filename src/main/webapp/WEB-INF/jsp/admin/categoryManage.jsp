<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/15
  Time: 21:22
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
    $(function () {
        var t=$("input[name='name']").val();
        $("input[name='name']").val("").focus().val(t);
        $('li:eq(1)').addClass("active");
    })

    function addCategory(d_num) {
        var index=layer.open({
            title: false,
            type: 2,
            content:"${pageContext.request.contextPath}/admin/addCategory",
            closeBtn: false,
            shadeClose: true,
            area: ['500px', '570px'],
        })

    }

    function editCategory(cid) {
        var index=layer.open({
            title: false,
            type: 2,
            content:"${pageContext.request.contextPath}/admin/category/edit?cid="+cid,
            closeBtn: false,
            shadeClose: true,
            area: ['500px', '560px'],

        })

    }

    function findPage(pageNum) {
        if(pageNum!=0){
            $(".currentPage").val(pageNum);
            $('.myform').submit();
        }
    }
</script>
<body>
<div id="route">
    <ol class="breadcrumb">
        <li><a href="#">系统菜单</a></li>
        <li class="active">分类管理</li>
    </ol>
    <form action="${pageContext.request.contextPath}/admin/category/list" method="post" class="form-inline myform">
        <a class="btn btn-success" href="javascript:addCategory()" style="margin-right:30px" >添加</a>

        <div class="form-group">
            <input type="text" name="name" placeholder="种类名称" class="form-control" value="${condition.name[0]}" autofocus="">
            <input type="hidden" class="currentPage" name="pageNum">
        </div>

        <label for="" style="margin-left:150px">类别:</label>
        <select class="form-control" style="margin-left:0px;vertical-align:middle" name="d_name">
            <option value="">所有</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>
            <%--<option value="${department.d_name}" <c:if test="${condition.d_name==department.d_name}">selected='selected'</c:if>>${department.d_name}</option>--%>
            <input type="submit" value="搜索" class="btn btn-default pull-right">
    </form>
    <table class="table table-bordered table-striped table-hover">
        <tr>
            <th>种类名称</th>
            <th>种类描述</th>
            <th>种类级别</th>
            <th>所属品类</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="category"  varStatus="vs">
            <tr>
                <td>${category.name}</td>
                <td>${category.cDesc}</td>
                <td>${category.level}</td>
                <td>${category.belong}</td>
                <td>
                    <a class="btn btn-info btn-xs" href="javascript:editCategory(${category.id})">编辑</a>
                    <a class="btn btn-danger btn-xs" href="javascript:deleteEmployee(${employee.e_id})">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <h5>当前是第${pageInfo.pages==0?0:pageInfo.pageNum}页,共${pageInfo.pages}页，总记录数为${pageInfo.total}条。</h5>
    <nav style="text-align:center">
        <ul class="pagination">
            <li><a href="javascript:findPage(1)"><span>首页</span></a></li>
            <c:if test="${pageInfo.pageNum==1}">
                <li class="disabled"><a href="javascript:void(0)"><span>上一页</span></a></li>
            </c:if>

            <c:if test="${pageInfo.pageNum!=1}">
                <li><a href="javascript:findPage(${pageInfo.pageNum-1})"><span>上一页</span></a></li>
            </c:if>

            <c:forEach begin="1" end="${pageInfo.pages}" var="page">
                <c:if test="${pageInfo.pageNum==page}">
                    <li class="active"><a href="javascript:void(0)">${page}</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum!=page}">
                    <li style="margin-right:5px"><a href="javascript:findPage(${page})">${page}</a></li>
                </c:if>
            </c:forEach>

            <c:if test="${pageInfo.pageNum==pageInfo.pages||pageInfo.pages==0}">
                <li class="disabled"><a href="javascript:void(0)"> <span>下一页</span>
                </a></li>

            </c:if>

            <c:if test="${pageInfo.pageNum!=pageInfo.pages&&pageInfo.pages!=0}">
                <li><a href="javascript:findPage(${pageInfo.pageNum+1})"> <span>下一页</span>
                </a></li>
            </c:if>
            <li><a href="javascript:findPage(${pageInfo.pages})"><span>尾页</span></a></li>
        </ul>
    </nav>
</div>

</body>
</html>
