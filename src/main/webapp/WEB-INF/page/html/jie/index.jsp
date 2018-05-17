<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>景点</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/column.jsp"></jsp:include>
<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md9 layui-col-md-offset1">
      <div class="fly-panel" style="margin-bottom: 0;">

        <ul class="fly-list">
          <c:forEach items="${c}" var="x">
            <li>
              <a href="${pageContext.request.contextPath}/myIndex/${x.user.id}" class="fly-avatar">
                <img src="${pageContext.request.contextPath}/${x.user.url}" alt="">
              </a>
              <h2>
                <a class="layui-badge">景点</a>
                <a href="${pageContext.request.contextPath}/detail/${x.jindian.id}">${x.jindian.title}</a>
              </h2>
              <div class="fly-list-info">
                <a href="${pageContext.request.contextPath}/myIndex/${x.user.id}" link>
                  <cite>${x.user.name}</cite>
                </a>
                <span>${x.jindian.beginTime}</span>
                <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i></span>
                <span class="layui-badge fly-badge-accept layui-hide-xs">gg</span>
                <span class="fly-list-nums">

              </span>
              </div>
            </li>
          </c:forEach>
        </ul>

        <!-- <div class="fly-none">没有相关数据</div> -->

        <div style="text-align: center">
          <div class="laypage-main">
            <c:if test="${page.current != 1}">
              <a href="${pageContext.request.contextPath}/jList?current=${ page.current - 1 }&&type=0" class="laypage-last" title="尾页">上一页</a>
            </c:if>

            <span class="laypage-curr">${page.current}</span>

            <c:if test="${page.current < page.pages}">
              <a href="${pageContext.request.contextPath}/jList?current=${ page.current + 1 }&&type=0" class="laypage-last" title="尾页">下一页</a>
            </c:if>
        </div>

      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>