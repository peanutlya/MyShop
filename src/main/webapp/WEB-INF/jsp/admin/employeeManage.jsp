<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/13
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
<script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bs/js/holder.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function () {
        var t=$("input[name='e_name']").val();
        $("input[name='e_name']").val("").focus().val(t);
        $('li:eq(2)').addClass("active");
    })

    function findPage(currentPage) {
        if(currentPage!=0){
            window.location.href="${pageContext.request.contextPath}/ManageServlet?op=employeeManage&currentPage="+currentPage+"&e_name=${condition.e_name}"+"&e_gender=${condition.e_gender}"+"&d_name=${condition.d_name}";
        }
    }

    function deleteEmployee(e_id) {
        layer.confirm("确认删除吗",function () {
            window.location.href="${pageContext.request.contextPath}/ManageServlet?op=deleteEmployee&e_id="+e_id;
        })
    }

</script>
<style>

</style>
<body>
    <div id="route">
        <ol class="breadcrumb">
            <li><a href="#">系统菜单</a></li>
            <li class="active">员工管理</li>
        </ol>
        <form action="${pageContext.request.contextPath}/ManageServlet?op=employeeManage" method="post" class="form-inline">
            <a class="btn btn-success" href="admin/addEmployee.jsp" style="margin-right:80px" >添加</a>

            <div class="form-group">
                <input type="text" name="e_name" placeholder="姓名" class="form-control" value="${condition.e_name}" autofocus="">
            </div>
            <div class="radio" style="margin-left:15px">
                <label for="">性别:</label>
                <input type="radio" name="e_gender" value="男" ${condition.e_gender=="男" ?'checked':''}>男
                <input type="radio" name="e_gender" value="女" ${condition.e_gender=="女" ?'checked':''}>女
                <input type="radio" name="e_gender" value="" ${condition.e_gender==null||condition.e_gender==""?"checked":""}>不限
            </div>

            <label for="" style="margin-left:15px">部门:</label>
            <select class="form-control" style="margin-left:0px" name="d_name">
                <option value="" }>不限</option>
                <c:forEach items="${departmentList}" var="department">
                    <option value="${department.d_name}" <c:if test="${condition.d_name==department.d_name}">selected='selected'</c:if>>${department.d_name}</option>
                </c:forEach>
            <input type="submit" value="搜索" class="btn btn-default pull-right">
        </form>
        <table class="table table-bordered table-striped table-hover">
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>身份证号</th>
                <th>电话</th>
                <th>所在部门</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageBean.pageList}" var="employee"  varStatus="vs">
                <tr>
                   <td>${employee.e_num}</td>
                    <td>${employee.e_name}</td>
                    <td>${employee.e_gender}</td>
                    <td>${employee.e_idcard}</td>
                    <td>${employee.e_tellnumber}</td>
                    <td>${employee.d_name}</td>
                    <td>
                        <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/ManageServlet?op=editEmployee&e_id=${employee.e_id}">编辑</a>
                        <a class="btn btn-danger btn-xs" href="javascript:deleteEmployee(${employee.e_id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h5>当前是第${pageBean.totalPage==0?0:pageBean.currentPage}页,共${pageBean.totalPage}页，总记录数为${pageBean.totalCount}条。</h5>
        <nav style="text-align: center">
            <ul class="pagination">
                <li><a href="javascript:findPage(1)"><span>首页</span></a></li>
                <c:if test="${pageBean.currentPage==1}">
                    <li class="disabled"><a href="javascript:void(0)"><span>上一页</span></a></li>
                </c:if>

                <c:if test="${pageBean.currentPage!=1}">
                    <li><a href="javascript:findPage(${pageBean.currentPage-1})"><span>上一页</span></a></li>
                </c:if>

                <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
                    <c:if test="${pageBean.currentPage==page}">
                        <li class="active"><a href="javascript:void(0)">${page}</a></li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=page}">
                        <li style="margin-right:5px"><a href="javascript:findPage(${page})">${page}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${pageBean.currentPage==pageBean.totalPage||pageBean.totalPage==0}">
                    <li class="disabled"><a href="javascript:void(0)"> <span>下一页</span>
                    </a></li>

                </c:if>

                <c:if test="${pageBean.currentPage!=pageBean.totalPage&&pageBean.totalPage!=0}">
                    <li><a href="javascript:findPage(${pageBean.currentPage+1})"> <span>下一页</span>
                    </a></li>
                </c:if>
                <li><a href="javascript:findPage(${pageBean.totalPage})"><span>尾页</span></a></li>
            </ul>
        </nav>
    </div>

</body>
</html>
