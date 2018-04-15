<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>救助申请</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div class="container">
    <h2 class="page-header text-left">救助申请</h2>
    <form action="/qzmessage/addMessage" method="post" enctype="multipart/form-data" class=" form-horizontal" role="form" style="width: 550px;margin-left: 100px">
        <c:if test="${ not empty error}">
            <div class="col-sm-12 alert alert-warning alert-dismissable">${error}</div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="col-sm-12 alert alert-success alert-dismissable">${success}</div>
        </c:if>
        <input type="hidden" name="uid" value="${user.id}">
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">身份证</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="code" name="code" required="" >
            </div>
        </div>
        <div class="form-group">
            <label for="qpice" class="col-sm-2 control-label">救助金额</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="qpice" name="qpice" required=""  >
            </div>
        </div>
        <div class="form-group">
            <label for="contet" class="col-sm-2 control-label">详细描述</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="contet" name="contet" required="" >
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
                <button type="submit" class="btn btn-default text-right">申请求助</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
