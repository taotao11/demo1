<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
    <div class="container">
        <h2 class="page-header text-left">会员个人信息</h2>
        <form action="<%=request.getContextPath()%>/user/updateUser" method="post" class="click-change-form form-horizontal" role="form" style="width: 550px;margin-left: 100px">
            <c:if test="${ not empty error}">
                <div class="col-sm-12 alert alert-warning alert-dismissable">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="col-sm-12 alert alert-success alert-dismissable">${success}</div>
            </c:if>
            <input  name="id" type="hidden" value="${user.id}">
            <div class="form-group">
                <label for="zh" class="col-sm-2 control-label">账号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="zh" name="zh" value="${user.zh}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">名字</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" name="name" value="${user.name}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="pwd" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="pwd" name="pwd" value="${user.pwd}" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="sex" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10">
                    <input type="sex" class="form-control" id="sex" name="sex" value="${user.sex}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱地址</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="email" name="email" value="${user.email}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="ipone" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="ipone" name="ipone" value="${user.ipone}" disabled>
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="click-change-btn btn btn-default text-right">修改</button>
                </div>
            </div>
        </form>
    </div>
    <script>
        var isUpdate = 0;
        $(".click-change-btn").click(function(e){
            $(this).val("提交");
            $(".click-change-form").find("input").attr("disabled",false);
            if(isUpdate == 0){
                e.preventDefault();
            }
            isUpdate++;
        });
    </script>
</body>
</html>
