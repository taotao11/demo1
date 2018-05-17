<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户主页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/column.jsp"></jsp:include>

<div class="fly-home fly-panel" style="background-image: url();">
  <c:if test="${userI.url != null}">
    <img src="${pageContext.request.contextPath}/${userI.url}" alt="${userI.name}">
  </c:if>
  <c:if test="${userI.url == null}">
    <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="默认头像">
  </c:if>

  <i class="iconfont icon-renzheng" title="Fly社区认证"></i>
  <h1>
    ${userI.name}
    <i class="iconfont icon-nan"></i>
    <i class="layui-badge fly-badge-vip">VIP</i>
  </h1>

  <p style="padding: 10px 0; color: #5FB878;">认证信息：手拉手 会员</p>

  <p class="fly-home-info">
    <i class="iconfont icon-kiss" title="飞吻"></i><span style="color: #FF7200;">66666 飞吻</span>
    <i class="iconfont icon-shijian"></i><span>${userI.creatTime} 加入</span>
  </p>

  <p class="fly-home-sign">（
    <c:if test="${userI.title == null}">
      这人很懒，什么都没有留下....
    </c:if>
    <c:if test="${userI.title != null}">
      ${userI.title}
    </c:if>
    ）</p>
</div>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md6 fly-home-jie">
      <div class="fly-panel">
        <h3 class="fly-panel-title">${userI.name} 的帖子</h3>
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
                  </li>
                </c:forEach>
              </ul>
              <div id="page"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="layui-col-md6 fly-home-da">
      <div class="fly-panel">
        <h3 class="fly-panel-title">${userI.name} 参与的话题</h3>
        <ul class="home-jieda">
          <c:forEach items="${c}" var="cc">
            <li>
              <p>
                <span>${cc.comment.time}</span>
                在<a href="${pageContext.request.contextPath}/topic/${cc.topic.id}" target="_blank">${cc.topic.title}</a>中回答：
              </p>
              <div class="home-dacontent">
                ${cc.comment.content}
              </div>
            </li>
          </c:forEach>
        <c:if test="${c.size() == 0}">
          <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><span>没有回答任何问题</span></div>
        </c:if>
          <!--  -->
        </ul>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>



</body>
</html>