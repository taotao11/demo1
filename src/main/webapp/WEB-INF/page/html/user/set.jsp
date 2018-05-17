<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>帐号设置</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/column.jsp"></jsp:include>

<div class="layui-container fly-marginTop fly-user-main">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
      <a href="${pageContext.request.contextPath}/myIndex/${user.id}">
        <i class="layui-icon">&#xe609;</i>
        我的主页
      </a>
    </li>
    <li class="layui-nav-item">
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
    <li class="layui-nav-item layui-this">
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
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li class="layui-this" lay-id="info">我的资料</li>
        <li lay-id="avatar">头像</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div class="layui-form layui-form-pane layui-tab-item layui-show">
          <form method="post" action="${pageContext.request.contextPath}/user/updateUser">
            <input type="hidden" name="id" value="${user.id}">
            <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">邮箱</label>
              <div class="layui-input-inline">
                <input type="text" id="L_email" name="email" required lay-verify="email" autocomplete="off" value="" class="layui-input">
              </div>
              <c:if test="${error != null}">
                <div class="layui-form-mid layui-word-aux">${error}</div>
              </c:if>
              <c:if test="${message != null}">
                <div class="layui-form-mid layui-word-aux">${message}</div>
              </c:if>
            </div>
            <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">昵称</label>
              <div class="layui-input-inline">
                <input type="text" id="L_username" name="name" required lay-verify="required" autocomplete="off" value="" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item layui-form-text">
              <label for="L_sign" class="layui-form-label">签名</label>
              <div class="layui-input-block">
                <textarea placeholder="随便写些什么刷下存在感" id="L_sign"  name="title" autocomplete="off" class="layui-textarea" style="height: 80px;"></textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
            </div>
          </form>
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <div class="layui-form-item">
              <div class="avatar-add">
                <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
                <img src="${pageContext.request.contextPath}/${user.url}">
                <span class="loading"></span>
                  <form action="${pageContext.request.contextPath}/user/addImg" method="post" enctype="multipart/form-data">
                      <input type="hidden" name="id" value="${user.id}">
                      <div class="layui-form-item">
                          <label for="L_file" class="layui-form-label">选择文件</label>
                          <div class="layui-input-inline">
                              <input id="L_file" type="file" name="file" class="layui-input">
                          </div>
                          <c:if test="${error != null}">
                              <div class="layui-form-mid layui-word-aux">${error}</div>
                          </c:if>
                          <c:if test="${message != null}">
                              <div class="layui-form-mid layui-word-aux">${message}</div>
                          </c:if>
                      </div>
                      <div class="layui-form-item">
                          <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
                      </div>

                  </form>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
    layui.use(['layer', 'form','upload','element'], function(){
        var layer = layui.layer
            ,form = layui.form;
        var upload = layui.upload;
        var element = layui.element;
    });
</script>
</body>
</html>