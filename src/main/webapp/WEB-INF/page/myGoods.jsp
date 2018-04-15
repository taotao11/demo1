<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的物品</title>
    <jsp:include page="header.jsp"></jsp:include>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container" style="width: 1550px">

    <h2 class="page-header text-left">捐卖物品列表</h2>
    <c:if test="${empty page}">
        <%--请求数据--%>
        <script type="text/javascript">
            $(document).ready(function () {
                window.location.href = "${pageContext.request.contextPath}/goods/selectGoodsByUid?uid=${user.id}&&current=1";
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
                        <th>物品数量</th>
                        <th>物品状态</th>
                        <th>处理信息</th>
                        <th>创建时间</th>
                        <th>结束时间</th>
                        <th>详情</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${page.records}" var="good">
                            <tr>
                                <td>
                                     <p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
                                             ${good.name}
                                     </p>
                                </td>
                                <td>${good.pice}<span class="text-danger">金币</span></td>
                                <td>${good.count}</td>
                                <td>
                                     <c:if test="${good.type == 0}">
                                         <span>已创建</span>
                                     </c:if>
                                    <c:if test="${good.type == 1}">
                                        <span>未通过</span>
                                    </c:if>
                                    <c:if test="${good.type == 2}">
                                        <span>已通过</span>
                                    </c:if>
                                    <c:if test="${good.type == 3}">
                                        <span>已结束</span>
                                    </c:if>
                                </td>
                                <td>
                                    <p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
                                            ${good.message}
                                    </p>
                                </td>
                                <td>

                                <p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
                                        ${good.creatTime}
                                </p>
                                </td>
                                <td>${good.endTime}</td>
                                <td>
                                    <c:if test="${good.type == 2}">
                                        <a class="btn btn-default" href="<%=request.getContextPath()%>/goods/selectGoodsInfo?id=${good.id}">查看详情</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
    </div>
    <ul class="pagination">
        <c:if test="${page.pages > 1  && page.current > 1}">
            <li><a href="<%=request.getContextPath()%>/goods/selectGoodsByUid?uid=${user.id}&&current=${page.current - 1}">&laquo;</a></li>
        </c:if>

        <c:forEach var="i" begin="1" end="${page.pages}">
            <c:if test="${page.current == i}">
                <li class="active"><a href="<%=request.getContextPath()%>/goods/selectGoodsByUid?uid=${user.id}&&current=${i}">${i}</a></li>
            </c:if>
            <c:if test="${page.current != i}">
                <li class=""><a href="<%=request.getContextPath()%>/goods/selectGoodsByUid?uid=${user.id}&&current=${i}">${i}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${page.pages > 1 && page.current < page.pages}">
            <li><a href="<%=request.getContextPath()%>/goods/selectGoodsByUid?uid=${user.id}&&current=${page.current + 1}">&raquo;</a></li>
        </c:if>

    </ul>
</div>

</body>
</html>
