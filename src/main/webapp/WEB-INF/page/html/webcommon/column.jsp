<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="fly-panel fly-column">
  <div class="layui-container">
    <ul class="layui-clear">
      <c:if test="${admin != null}">
        <li><a href="${pageContext.request.contextPath}/admin/selectAll?current=1">管理员</a></li>
        <li><a href="${pageContext.request.contextPath}/user/selectAllUser/1">用户</a></li>
        <li><a href="${pageContext.request.contextPath}/web/addNotice">添加公告</a></li>
        <li><a href="${pageContext.request.contextPath}/notice/selectAll?current=1">公告</a></li>
        <li><a href="${pageContext.request.contextPath}/jList?current=0&&type=1">景点</a></li>
        <li><a href="${pageContext.request.contextPath}/aList?current=0&&type=1">活动<span class="layui-badge-dot"></span></a></li>
        <li><a href="${pageContext.request.contextPath}/tList?current=0&&type=1">话题</a></li>
      </c:if>
    </ul>
  </div>
</div>