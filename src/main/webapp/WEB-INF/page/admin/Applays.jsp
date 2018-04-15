<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>救助申请管理</title>
    <jsp:include page="../header.jsp"></jsp:include>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container" style="width: 1600px">

    <h2 class="page-header text-left">救助申请列表</h2>
    <c:if test="${ not empty error}">
        <script>
            alert(${error});
        </script>

    </c:if>
    <c:if test="${not empty success}">
        <script>
            alert(${success});
        </script>
    </c:if>
    <c:if test="${empty page}">
        <%--请求数据--%>
        <script type="text/javascript">
            $(document).ready(function () {
                window.location.href = "${pageContext.request.contextPath}/qzmessage/selectAllQz?current=1";
            });
        </script>
    </c:if>
    <div class="">
        <div class="col-sm-12">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>会员姓名</th>
                    <th>身份证号</th>
                    <th>需求金额</th>
                    <th>描述内容</th>
                    <th>救助状态</th>
                    <th>处理人</th>
                    <th>处理信息</th>
                    <th>创建时间</th>
                    <th>结束时间</th>
                    <th>审批</th>
                    <th>详情</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.records}" var="good">
                    <form action="<%=request.getContextPath()%>/qzmessage/updateQzmessage" method="post" >
                        <input type="hidden" name="id" value="${good.id}">
                        <input type="hidden" name="uid" value="${good.uid}">
                        <input type="hidden" name="aid" value="${admin.id}">
                        <input type="hidden" name="qpice" value="${good.qpice}">
                        <tr>
                            <td>${good.user}</td>
                            <td>${good.code}</td>
                            <td>${good.qpice}<span class="text-danger">金币</span></td>
                            <td>
                                <p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
                                        ${good.contet}
                                </p>
                            </td>

                            <td>
                                <c:if test="${good.type > 0}">
                                    <c:if test="${good.type == 1}">
                                        <span>以通过打款</span>
                                    </c:if>
                                    <c:if test="${good.type == 2}">
                                        <span>未通过</span>
                                    </c:if>
                                </c:if>
                                <c:if test="${good.type == 0}">
                                    <select class="form-control" name="type" >
                                        <option value="0" selected>已创建</option>
                                        <option value="1">通过打款</option>
                                        <option value="2">不通过</option>
                                    </select>
                                </c:if>
                            </td>
                            <td>${good.admin}</td>
                            <td>
                                <c:if test="${good.type == 0}">
                                    <input class="form-control" name="message" placeholder="请输入原因" required>
                                </c:if>
                                <c:if test="${good.type > 0}">
                                    ${good.message}
                                </c:if>
                            </td>
                            <td>${good.creatTime}</td>
                            <td>${good.endTime}</td>
                            <td>
                                <c:if test="${good.type == 0}">
                                    <button class="btn btn-danger">审批</button>
                                </c:if>
                                <c:if test="${good.type > 0}">
                                    <button class="btn btn-default" disabled>审批</button>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${good.type == 1}">
                                    <a class="btn btn-default" href="${pageContext.request.contextPath}/qzmessage/selectApplayByQid?id=${good.id}">查看详情</a>
                                </c:if>
                            </td>
                        </tr>
                    </form>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <ul class="pagination">
        <c:if test="${page.pages > 1  && page.current > 1}">
            <li><a href="${pageContext.request.contextPath}/qzmessage/selectAllQz?current=${page.current - 1}">&laquo;</a></li>
        </c:if>

        <c:forEach var="i" begin="1" end="${page.pages}">
            <c:if test="${page.current == i}">
                <li class="active"><a href="${pageContext.request.contextPath}/qzmessage/selectAllQz?current=${i}">${i}</a></li>
            </c:if>
            <c:if test="${page.current != i}">
                <li class=""><a href="${pageContext.request.contextPath}/qzmessage/selectAllQz?current=${i}">${i}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${page.pages > 1 && page.current < page.pages}">
            <li><a href="${pageContext.request.contextPath}/qzmessage/selectAllQz?current=${page.current + 1}">&raquo;</a></li>
        </c:if>

    </ul>
</div>

</body>
</html>