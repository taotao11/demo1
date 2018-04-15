<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
    <div class="container">
        <h2 class="page-header text-left">管理员个人信息</h2>
        <form action="<%=request.getContextPath()%>/admin/update" method="post" class="click-change-form form-horizontal" role="form" style="width: 550px;margin-left: 100px">
            <c:if test="${ not empty error}">
                <div class="col-sm-12 alert alert-warning alert-dismissable">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="col-sm-12 alert alert-success alert-dismissable">${success}</div>
            </c:if>
            <input  name="id" type="hidden" value="${admin.id}">
            <div class="form-group">
                <label for="zh" class="col-sm-2 control-label">账号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="zh" name="zh" value="${admin.zh}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">名字</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" name="name" value="${admin.name}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="pwd" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="pwd" name="pwd" value="${admin.pwd}" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="sex" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10">
                    <input type="hidden" name="sex" value="1">
                    <c:if test="${admin.sex == 0}">
                        <input type="sex" class="form-control" id="sex"  value="男" disabled>
                    </c:if>
                    <c:if test="${admin.sex == 1}">
                        <input type="sex" class="form-control" id="sex"  value="女" disabled>
                    </c:if>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱地址</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="email" name="email" value="${admin.email}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="ipone" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="ipone" name="ipone" value="${admin.ipone}" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="adress" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="adress" name="adress" value="${admin.adress}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="creatTime" class="col-sm-2 control-label">创建时间</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="creatTime" name="creatTime" value="${admin.creatTime}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="updateTime" class="col-sm-2 control-label">修改时间</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="updateTime" name="updateTime" value="${admin.updateTime}" disabled>
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
            $("#sex").attr("disabled",true);
            $("#updateTime").attr("disabled",true);
            $("#creatTime").attr("disabled",true);

            if(isUpdate == 0){
                e.preventDefault();
            }
            isUpdate++;
        });
    </script>
</body>
</html>
