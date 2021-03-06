<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>手拉手后台</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="手拉手">
  <meta name="description" content="手拉手">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../webcommon/header.jsp"></jsp:include>
<jsp:include page="../webcommon/column.jsp"></jsp:include>
<div class="layui-container">
  <div class="fly-panel" pad20 style="padding-top: 5px;">
    <!--<div class="fly-none">没有权限</div>-->
    <div class="layui-form-pane">
      <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title">
          <li class="layui-this">话题修改<!-- 编辑帖子 --></li>
        </ul>
        <div class="layui-tab-content" style="padding: 20px 0;">
          <c:if test="${error != null}">
            <div class="layui-form-mid layui-word-aux">${error}</div>
          </c:if>
          <c:if test="${success != null}">
            <div class="layui-form-mid layui-word-aux">${success}</div>
          </c:if>
          <%--话题开始--%>
          <div class="layui-form layui-tab-item layui-show ">
            <form id="form2" action="${pageContext.request.contextPath}/topic/update" method="post">
              <input type="hidden" name="type" value="0">
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md9">
                  <label for="title1" class="layui-form-label">标题</label>
                  <div class="layui-input-block">
                    <input type="text" id="title1" name="title" value="${obj.title}" required lay-verify="required" autocomplete="off" class="layui-input">
                    <input type="hidden" name="id" value="${obj.id}">
                  </div>
                </div>
              </div>
              <div class="layui-form-item layui-form-text">
                <div class="layui-input-block">
                  <textarea name="reason" required lay-verify="required" placeholder="详细描述" class="layui-textarea fly-editor" style="height: 260px;">
                    ${obj.reason}
                  </textarea>
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" >立即修改</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<%--<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>--%>

</body>
</html>