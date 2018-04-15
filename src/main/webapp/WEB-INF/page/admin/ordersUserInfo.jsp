<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
    <jsp:include page="../header.jsp"></jsp:include>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container">

    <h2 class="page-header text-left">订单列表</h2>
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
                window.location.href = "${pageContext.request.contextPath}/order/selectOrderByAdmin?current=1";
            });
        </script>
    </c:if>
    <div class="">
        <div class="col-sm-12">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>物品名称</th>
                    <th>物品价格</th>
                    <th>卖家姓名</th>
                    <th>买家姓名</th>
                    <th>收货地址</th>
                    <th>联系电话</th>
                    <th>创建时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.records}" var="good">
                    <tr>
                        <td>${good.goodsName}</td>
                        <td>${good.pice}<span class="text-danger">金币</span></td>
                        <td>${good.sname}</td>
                        <td>${good.bname}</td>
                        <td>${good.adress}</td>
                        <td>${good.ipone}</td>
                        <td>${good.creatTime}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <ul class="pagination">
        <c:if test="${page.pages > 1  && page.current > 1}">
            <li><a href="<%=request.getContextPath()%>/order/selectOrderByAdmin?current=${page.current - 1}">&laquo;</a></li>
        </c:if>

        <c:forEach var="i" begin="1" end="${page.pages}">
            <c:if test="${page.current == i}">
                <li class="active"><a href="<%=request.getContextPath()%>/order/selectOrderByAdmin?current=${i}">${i}</a></li>
            </c:if>
            <c:if test="${page.current != i}">
                <li class=""><a href="<%=request.getContextPath()%>/order/selectOrderByAdmin?current=${i}">${i}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${page.pages > 1 && page.current < page.pages}">
            <li><a href="<%=request.getContextPath()%>/order/selectOrderByAdmin?current=${page.current + 1}">&raquo;</a></li>
        </c:if>

    </ul>
</div>

</body>
</html>
