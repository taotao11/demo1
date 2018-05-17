<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>添加</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../webcommon/header.jsp"></jsp:include>
<jsp:include page="../webcommon/column.jsp"></jsp:include>
<div class="layui-container fly-marginTop">
  <div class="fly-panel" pad20 style="padding-top: 5px;">
    <!--<div class="fly-none">没有权限</div>-->
    <div class="layui-form-pane">
      <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title">
          <li class="layui-this">公告添加<!-- 编辑帖子 --></li>
        </ul>
        <div class="layui-tab-content" style="padding: 20px 0;">
          <c:if test="${error != null}">
            <div class="layui-form-mid layui-word-aux">${error}</div>
          </c:if>
          <c:if test="${success != null}">
            <div class="layui-form-mid layui-word-aux">${success}</div>
          </c:if>
          <div class="layui-form layui-tab-item layui-show ">
              <form id="form2" action="${pageContext.request.contextPath}/notice/add" method="post">
                <div class="layui-row layui-col-space15 layui-form-item">
                  <div class="layui-col-md9">
                    <label for="title1" class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                      <input type="text" id="title1" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
                      <input type="hidden" name="uid" value="${user.id}">
                    </div>
                  </div>
                </div>
                <div class="layui-form-item layui-form-text">
                  <div class="layui-input-block">
                    <textarea name="reason" required lay-verify="required" placeholder="详细描述" class="layui-textarea fly-editor" style="height: 260px;"></textarea>
                  </div>
                </div>
                <div class="layui-form-item">
                  <button class="layui-btn" >立即发布</button>
                </div>
              </form>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
    layui.use(['layer', 'form','upload','element','laydate'], function(){
        var layer = layui.layer
            ,form = layui.form;
        var upload = layui.upload;
        var element = layui.element;
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#beginTime' //指定元素
            ,type:'datetime'
        });
    });
</script>
</body>
</html>