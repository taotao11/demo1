<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <jsp:include page="header.jsp"></jsp:include>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container">

    <h2 class="page-header text-left">义卖说的金币公开信息</h2>
    <c:if test="${empty page}">
        <%--请求数据--%>
        <script type="text/javascript">
            $(document).ready(function () {
                window.location.href = "${pageContext.request.contextPath}/order/selectOrderByPubilc?current=1";
            });
        </script>
    </c:if>
    <div class="">
        <div class="col-sm-12">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单id</th>
                    <th>物品价格</th>
                    <th>捐赠会员</th>
                    <th>购买会员</th>
                    <th>创建时间</th>
                    <th>金池金币</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.records}" var="good">
                    <tr>
                        <td>${good.id}</td>
                        <td>${good.pice}<span class="text-danger">金币</span></td>
                        <td>${good.sname}</td>
                        <td>${good.bname}</td>
                        <td>${good.creatTime}</td>
                        <td>+${good.pice}<span class="text-danger">金币</span></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <ul class="pagination">
        <c:if test="${page.pages > 1  && page.current > 1}">
            <li><a href="<%=request.getContextPath()%>/order/selectOrderByPubilc?current=${page.current - 1}">&laquo;</a></li>
        </c:if>

        <c:forEach var="i" begin="1" end="${page.pages}">
            <c:if test="${page.current == i}">
                <li class="active"><a href="<%=request.getContextPath()%>/order/selectOrderByPubilc?current=${i}">${i}</a></li>
            </c:if>
            <c:if test="${page.current != i}">
                <li class=""><a href="<%=request.getContextPath()%>/order/selectOrderByPubilc?current=${i}">${i}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${page.pages > 1 && page.current < page.pages}">
            <li><a href="<%=request.getContextPath()%>/order/selectOrderByPubilc?current=${page.current + 1}">&raquo;</a></li>
        </c:if>

    </ul>
</div>

</body>
</html>
