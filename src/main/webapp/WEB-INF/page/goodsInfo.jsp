<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
    <div class="container">
        <h4 class="page-header">物品详情</h4>

        <c:if test="${not empty goods}">
            <div style="margin-left: 80px">
                <div class="banner col-sm-10" >
                    <div id="myCarousel" class="col-sm-11 carousel slide">
                        <!-- 轮播（Carousel）项目 -->
                        <div class="carousel-inner">
                            <c:forEach step="1" var="item" items="${imgUrl}" varStatus="status">
                                <c:if test="${status.index == 0}">
                                    <div class="item active">
                                        <img  height="350px" src="${pageContext.request.contextPath}/upload/goods/${item}">
                                    </div>
                                </c:if>
                                <c:if test="${status.index > 0}">
                                    <div class="item ">
                                        <img  height="350px" src="${pageContext.request.contextPath}/upload/goods/${item}">
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
                    <p>物品信息：</p>
                    <p style="font-size: 13px">
                        物品来源: <span style="color: #843534">会员${goods.user}</span>
                        <span style="margin-left: 50px">名称: <span style="color: #333"> ${goods.name}</span></span>
                    </p>
                    <p style="font-size: 13px">
                        数量: <span style="color: #333">${goods.count}件</span>
                        <span style="margin-left: 100px">价格: <span style="color: #333">${goods.pice}金币</span></span>
                    </p>
                    <p style="font-size: 13px">推荐理由: <span style="color: #333">${goods.content}</span></p>
                        <%--<button class="btn-sm btn-info" style="margin-left: 400px">立即购买</button>--%>
                    <a  href="#modal-container-49626" role="button" class="btn-sm btn-info" data-toggle="modal"style="margin-left: 400px">立即购买</a>
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
                                            <form role="form"  action="<%=request.getContextPath()%>/order/addOrderByUser" method="post">
                                                <input type="hidden" value="${user.id}" name="uid">
                                                <input type="hidden" value="${goods.id}" name="gid">
                                                <div class="form-group">
                                                    <label for="pice">物品价格</label><input name="pice" value="${goods.pice}金币" type="text" disabled  class="form-control" id="pice" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="count">物品数量</label><input name="count" value="${goods.count}" type="number" disabled  class="form-control" id="count" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="address">收货地址</label><input name="address" type="text" class="form-control" id="address" required="required"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="ipone">联系电话</label><input name="ipone" type="number" class="form-control" id="ipone" required="required" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputPassword1">密码</label><input type="password" name="pwd" class="form-control" id="exampleInputPassword1" required="required" />
                                                </div>
                                                <c:if test="${user.meny >= goods.pice}">
                                                    <button type="submit" class="btn btn-default">确认付款</button>
                                                </c:if>
                                                <c:if test="${user.meny < goods.pice}">
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
