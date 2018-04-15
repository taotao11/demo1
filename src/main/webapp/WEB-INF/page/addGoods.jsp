<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加义卖物品</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div class="container">
    <h2 class="page-header text-left">义卖物品添加</h2>
    <form action="<%=request.getContextPath()%>/goods/addGoods" method="post" enctype="multipart/form-data" class=" form-horizontal" role="form" style="width: 550px;margin-left: 100px">
        <c:if test="${ not empty error}">
            <div class="col-sm-12 alert alert-warning alert-dismissable">${error}</div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="col-sm-12 alert alert-success alert-dismissable">${success}</div>
        </c:if>
        <input type="hidden" name="uid" value="${user.id}">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">物品名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name"  >
            </div>
        </div>
        <div class="form-group">
            <label for="pice" class="col-sm-2 control-label">价格</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="pice" name="pice" >
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">详细描述</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="content" name="content">
            </div>
        </div>

        <div class="form-group">
            <label for="count" class="col-sm-2 control-label">数量</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="count" name="count">
            </div>
        </div>

        <div class="form-group">
            <label for="inputfile" class="col-sm-2 control-label">选择文件</label>
            <div class="col-sm-10">
                <input type="file" class="form-control" id="inputfile" name="files" multiple/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default text-right">添加</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
