<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div class="container">
    <h4 class="page-header">救助详情</h4>

    <c:if test="${not empty qz}">
        <div style="margin-left: 80px">
            <div class="banner col-sm-10" >
                <div id="myCarousel" class="col-sm-11 carousel slide">
                    <!-- 轮播（Carousel）项目 -->
                    <div class="carousel-inner">
                        <c:forEach step="1" var="item" items="${qz.urls}" varStatus="status">
                            <c:if test="${status.index == 0}">
                                <div class="item active">
                                    <img width="300" height="300" src="${pageContext.request.contextPath}/upload/qzmessage/${item}">
                                </div>
                            </c:if>
                            <c:if test="${status.index > 0}">
                                <div class="item ">
                                    <img width="300" height="300" src="${pageContext.request.contextPath}/upload/qzmessage/${item}">
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
            <div class="col-sm-8" style="margin-top: 40px">
                <p>救助信息：</p>
                <p style="font-size: 13px">
                    申请人姓名: <span style="color: #843534">会员${qz.user}</span>
                    <span style="margin-left: 50px">身份证号: <span style="color: #333"> ${qz.code}</span></span>
                </p>
                <p style="font-size: 13px">认证管理员: <span>${qz.admin}</span></p>
                <p style="font-size: 13px">救助原因: <span style="color: #333">${qz.contet}</span></p>
                    <%--<button class="btn-sm btn-info" style="margin-left: 400px">立即购买</button>--%>
                <a  href="#modal-container-49626" role="button" class="btn-sm btn-info" data-toggle="modal"style="margin-left: 400px">献爱心</a>
                <div class="col-md-12 column">
                    <div class="modal fade" id="modal-container-49626" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content" style="margin-top: 100px">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h4 class="modal-title" id="myModalLabel">
                                            ${goods.name}
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="col-md-12 column">
                                        <form role="form"  action="<%=request.getContextPath()%>/contribution/addContribution" method="post">
                                            <input type="hidden" value="${user.id}" name="jid">
                                            <input type="hidden" value="${qz.id}" name="qid">
                                            <input type="hidden" value="${qz.uid}" name="bjid">
                                            <div class="form-group">
                                                <label for="count">金币</label><input name="count" value="${goods.count}" max="${user.meny}" min="1" type="number"   class="form-control" id="count" />
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">密码</label><input type="password" name="pwd" class="form-control" id="exampleInputPassword1" required="required" />
                                            </div>
                                            <c:if test="${user.meny > 0}">
                                                <button type="submit" class="btn btn-default">确认捐赠</button>
                                            </c:if>
                                            <c:if test="${user.meny <= 0}">
                                                <p>金币不足,<a class="btn" href="/addMoney">请先充值</a></p>
                                            </c:if>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-warning alert-danger">${error}</div>
    </c:if>
</div>
</body>
</html>
