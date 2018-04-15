<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../header.jsp"></jsp:include>
</head>
<body>

<div class="container" style="width: 1200px">

    <h2 class="page-header text-left">管理员列表</h2>
    <c:if test="${empty page}">
        <%--请求数据--%>
        <script type="text/javascript">
            $(document).ready(function () {
                window.location.href = "${pageContext.request.contextPath}/admin/selectAll?current=1";
            });
        </script>
    </c:if>

    <div class="">
        <c:if test="${not empty success}">
            <div class="alert alert-warning alert-success">${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-warning alert-danger">${error}</div>

        </c:if>
        <div class="col-sm-12">
            <table class="table table-striped text-center">
                <thead>
                <tr class="text-center">
                    <th>账号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>电话</th>
                    <th>地址</th>
                    <th>创建时间</th>
                    <th>修改时间</th>
                    <th>删除</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.records}" var="good">
                    <tr>
                        <td>${good.zh}</td>
                        <td>${good.name}</td>
                        <td>
                            <c:if test="${good.sex == 0}"><span>男</span></c:if>
                            <c:if test="${good.sex == 1}"><span>女</span></c:if>
                        </td>
                        <td>${good.email}</td>
                        <td>${good.ipone}</td>
                        <td>${good.adress}</td>
                        <td>${good.creatTime}</td>
                        <td>${good.updateTime}</td>
                        <td><a class="btn btn-default" href="<%=request.getContextPath()%>/admin/deleteAdmin?id=${good.id}">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <ul class="pagination">
        <c:if test="${page.pages > 1  && page.current > 1}">
            <li><a href="<%=request.getContextPath()%>/admin/selectAll?current=${page.current - 1}">&laquo;</a></li>
        </c:if>

        <c:forEach var="i" begin="1" end="${page.pages}">
            <c:if test="${page.current == i}">
                <li class="active"><a href="<%=request.getContextPath()%>/admin/selectAll?current=${i}">${i}</a></li>
            </c:if>
            <c:if test="${page.current != i}">
                <li class=""><a href="<%=request.getContextPath()%>/admin/selectAll?current=${i}">${i}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${page.pages > 1 && page.current < page.pages}">
            <li><a href="<%=request.getContextPath()%>/admin/selectAll?current=${page.current + 1}">&raquo;</a></li>
        </c:if>

    </ul>
</div>
</body>
</html>
