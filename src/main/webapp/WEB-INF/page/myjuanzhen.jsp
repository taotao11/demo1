<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的捐赠</title>
    <jsp:include page="header.jsp"></jsp:include>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container" >

    <h2 class="page-header text-left">捐赠列表</h2>
    <c:if test="${not empty success}">
        <div class="alert alert-warning alert-success">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-warning alert-danger">${error}</div>

    </c:if>
    <c:if test="${empty page}">
        <%--请求数据--%>
        <script type="text/javascript">
            $(document).ready(function () {
                window.location.href = "${pageContext.request.contextPath}/contribution/selectByUid?uid=${user.id}&&current=1";
            });
        </script>
    </c:if>
    <div class="">
        <div class="col-sm-12">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>求助信息id</th>
                    <th>求助者姓名</th>
                    <th>捐赠金币</th>
                    <th>创建时间</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${page.records}" var="good">
                        <tr>
                            <td>${good.qid}</td>
                            <td>${good.name}</td>
                            <td>${good.money}<span class="text-danger">金币</span></td>
                            <td>${good.creatTime}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <ul class="pagination">
        <c:if test="${page.pages > 1  && page.current > 1}">
            <li><a href="<%=request.getContextPath()%>/contribution/selectByUid?uid=${user.id}&&current=${page.current - 1}">&laquo;</a></li>
        </c:if>

        <c:forEach var="i" begin="1" end="${page.pages}">
            <c:if test="${page.current == i}">
                <li class="active"><a href="<%=request.getContextPath()%>/contribution/selectByUid?uid=${user.id}&&current=${i}">${i}</a></li>
            </c:if>
            <c:if test="${page.current != i}">
                <li class=""><a href="<%=request.getContextPath()%>/contribution/selectByUid?uid=${user.id}&&current=${i}">${i}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${page.pages > 1 && page.current < page.pages}">
            <li><a href="<%=request.getContextPath()%>/contribution/selectByUid?uid=${user.id}&&current=${page.current + 1}">&raquo;</a></li>
        </c:if>

    </ul>
</div>

</body>
</html>
