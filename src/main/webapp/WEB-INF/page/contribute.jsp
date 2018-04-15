<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body style="width: 1000px">
<c:if test="${empty page}">
    <%--请求数据--%>
    <script type="text/javascript">
        $(document).ready(function () {
            window.location.href = "${pageContext.request.contextPath}/qzmessage/qzshow?current=1";
        });
    </script>
</c:if>
<div class="container">
    <h3 class="page-header">救助大厅</h3>
    <div class="row placeholders">
        <%--轮播导航--%>
        <div id="myCarousel" class="col-sm-11 carousel slide">
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner" style="height: 350px">
                <c:forEach step="1" var="item" items="${page.records}" varStatus="status">
                    <c:if test="${status.index == 0}">
                        <div class="item active">
                            <a href="${pageContext.request.contextPath}/qzmessage/selectApplayByQid?id=${item.id}">
                                <img height="350px" src="${pageContext.request.contextPath}/upload/qzmessage/${item.urls.get(0)}">
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${status.index > 0}">
                        <div class="item ">
                            <a href="${pageContext.request.contextPath}/qzmessage/selectApplayByQid?id=${item.id}">
                                <img height="350px"  src="${pageContext.request.contextPath}/upload/qzmessage/${item.urls.get(0)}">
                            </a>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div class="row placeholders" style="margin-top: 40px">
        <c:forEach step="1" var="item" items="${page.records}" varStatus="status">
            <div class="col-xs-6 col-sm-4 placeholder">
                <img src="${pageContext.request.contextPath}/upload/qzmessage/${item.urls.get(0)}" class="img-responsive" alt="Generic placeholder thumbnail">
                <span >会员:  ${item.user}</span>
                <a href="${pageContext.request.contextPath}/qzmessage/selectApplayByQid?id=${item.id}" class="btn btn-sm " style="margin-left: 50%">查看更多...</a>
            </div>
        </c:forEach>
    </div>
    <ul class="pagination">
        <c:if test="${page.pages > 1  && page.current > 1}">
            <li><a href="qzmessage/qzshow?current=${page.current - 1}">&laquo;</a></li>
        </c:if>

        <c:forEach var="i" begin="1" end="${page.pages}">
            <c:if test="${page.current == i}">
                <li class="active"><a href="qzmessage/qzshow?current=${i}">${i}</a></li>
            </c:if>
            <c:if test="${page.current != i}">
                <li class=""><a href="qzmessage/qzshow?current=${i}">${i}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${page.pages > 1 && page.current < page.pages}">
            <li><a href="qzmessage/qzshow?current=${page.current + 1}">&raquo;</a></li>
        </c:if>

    </ul>
</div>
</body>
</html>