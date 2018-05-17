<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户中心</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/column.jsp"></jsp:include>
<c:if test="${jindians == null}">
  <script  type="text/javascript">
      window.self.location = "${pageContext.request.contextPath}/userIndex?id=${user.id}";
  </script >
</c:if>
<div class="layui-container fly-marginTop fly-user-main">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
      <a href="${pageContext.request.contextPath}/myIndex/${user.id}">
        <i class="layui-icon">&#xe609;</i>
        我的主页
      </a>
    </li>
    <li class="layui-nav-item layui-this">
      <a href="${pageContext.request.contextPath}/userIndex?id=${user.id}">
        <i class="layui-icon">&#xe612;</i>
        用户中心
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="${pageContext.request.contextPath}/follow/selectAll?id=${user.id}">
        <i class="layui-icon">&#xe612;</i>
        我的关注
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="${pageContext.request.contextPath}/set">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li>
  </ul>

  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  
  <div class="fly-panel fly-panel-user" pad20>
    <!--
    <div class="fly-msg" style="margin-top: 15px;">
      您的邮箱尚未验证，这比较影响您的帐号安全，<a href="activate.html">立即去激活？</a>
    </div>
    -->
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li data-type="mine-jie" lay-id="index" class="layui-this">景点（<span>${jindians.size()}</span>）</li>
        <li data-type="collection" data-url="/collection/find/" lay-id="collection">活动（<span>${activities.size()}</span>）</li>
        <li data-type="collection" data-url="/collection/find/" lay-id="collection">话题（<span>${topics.size()}</span>）</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <ul class="mine-view jie-row">
            <c:forEach items="${jindians}" var="jindian">
              <li>
                <a class="jie-title" href="${pageContext.request.contextPath}/detail/${jindian.id}" target="_blank">${jindian.title}</a>
                <i>${jindian.beginTime}</i>
                <%--<em>10回复</em>--%>
                <em>
                      <a href="${pageContext.request.contextPath}/jindian/set?id=${jindian.id}&type=1">修改</a>
                      <a href="${pageContext.request.contextPath}/jindian/delete?id=${jindian.id}&type=1">删除</a>
                </em>
              </li>
            </c:forEach>
          </ul>
          <div id="LAY_page"></div>
        </div>
        <div class="layui-tab-item">
          <ul class="mine-view jie-row">
            <c:forEach items="${activities}" var="activity">
              <li>
                <a class="jie-title" href="${pageContext.request.contextPath}/activity/${activity.id}" target="_blank">${activity.title}</a>
                <i>${activity.beginTime}</i>
                <%--<em>10回复</em>--%>

                <em>
                  <a class="" href="${pageContext.request.contextPath}/activity/set?id=${activity.id}&type=1">修改</a>
                  <a href="${pageContext.request.contextPath}/activity/delete?id=${activity.id}&type=1">删除</a>
                </em>

              </li>
            </c:forEach>
          </ul>
          <div id="LAY_page1"></div>
        </div>
        <div class="layui-tab-item ">
          <ul class="mine-view jie-row">
            <c:forEach items="${topics}" var="topic">
              <li>
                <a class="jie-title" href="${pageContext.request.contextPath}/topic/${topic.id}" target="_blank">${topic.title}</a>
                <i>${topic.creatTime}</i>
                <%--<em>10回复</em>--%>
                <em>
                    <a href="${pageContext.request.contextPath}/topic/set?id=${topic.id}&type=1">修改</a>
                    <a href="${pageContext.request.contextPath}/topic/delete?id=${topic.id}&type=1">删除</a>
                </em>
              </li>
            </c:forEach>
          </ul>
          <div id="page"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>