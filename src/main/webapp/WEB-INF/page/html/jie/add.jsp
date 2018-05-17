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
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/column.jsp"></jsp:include>
<div class="layui-container fly-marginTop">
  <div class="fly-panel" pad20 style="padding-top: 5px;">
    <!--<div class="fly-none">没有权限</div>-->
    <div class="layui-form-pane">
      <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title">
          <li class="layui-this">景点添加<!-- 编辑帖子 --></li>
          <li>活动添加</li>
          <li>话题添加</li>
        </ul>
        <div class="layui-tab-content" style="padding: 20px 0;">
          <c:if test="${error != null}">
            <div class="layui-form-mid layui-word-aux">${error}</div>
          </c:if>
          <c:if test="${success != null}">
            <div class="layui-form-mid layui-word-aux">${success}</div>
          </c:if>
          <%--景点开始--%>
          <div class="layui-form layui-tab-item layui-show">
            <form id="form0" action="${pageContext.request.contextPath}/jindian/addJD" method="post" enctype="multipart/form-data">
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md9">
                  <label for="L_title" class="layui-form-label">标题</label>
                  <div class="layui-input-block">
                    <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
                    <input type="hidden" name="uid" value="${user.id}">
                  </div>
                </div>
              </div>
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md4">
                  <label for="L_address" class="layui-form-label">地点</label>
                  <div class="layui-input-block">
                    <input type="text" id="L_address" name="address" placeholder="请输入地点" required lay-verify="required"
                           autocomplete="off" class="layui-input">
                  </div>
                </div>
              </div>
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md4">
                  <label for="L_file" class="layui-form-label">选择文件</label>
                  <div class="layui-input-block">
                    <input type="file" id="L_file" name="file"  class="layui-input">
                  </div>
                </div>
              </div>
              <div class="layui-form-item layui-form-text">
                <div class="layui-input-block">
                  <textarea id="L_reason" name="reason" required lay-verify="required" placeholder="详细描述" class="layui-textarea fly-editor" style="height: 260px;"></textarea>
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" >立即发布</button>
              </div>
            </form>
          </div>
            <%--活动开始--%>
          <div class="layui-form layui-tab-item ">
            <form id="form1" action="${pageContext.request.contextPath}/activity/addA" method="post" enctype="multipart/form-data">
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md9">
                  <label for="title" class="layui-form-label">标题</label>
                  <div class="layui-input-block">
                    <input type="text" id="title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
                    <input type="hidden" name="uid" value="${user.id}">
                    <input type="hidden" name="stuts" value="创建">
                  </div>
                </div>
              </div>
              <div class="layui-row layui-col-space15 layui-form-item">
              <div class="layui-col-md4">
                <label for="address" class="layui-form-label">地点</label>
                <div class="layui-input-block">
                  <input type="text" id="address" name="address" placeholder="请输入地点" required lay-verify="required"
                         autocomplete="off" class="layui-input">
                </div>
              </div>

            </div>
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md4">
                  <label for="beginTime" class="layui-form-label">开始时间</label>
                  <div class="layui-input-block">
                    <input type="text" id="beginTime" name="time" required lay-verify="required"
                           autocomplete="off" class="layui-input">
                  </div>
                </div>
              </div>
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md4">
                  <label for="dataLen" class="layui-form-label">活动时长</label>
                  <div class="layui-input-block">
                    <input type="number" id="dataLen" name="dataLen" placeholder="单位天" required lay-verify="required"
                           autocomplete="off" class="layui-input">
                  </div>
                </div>
              </div>
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md4">
                  <label for="pLen" class="layui-form-label">活动人数</label>
                  <div class="layui-input-block">
                    <input type="number" id="pLen" name="pLen" placeholder="" required lay-verify="required"
                           autocomplete="off" class="layui-input">
                  </div>
                </div>
              </div>
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md4">
                  <label for="file" class="layui-form-label">选择文件</label>
                  <div class="layui-input-block">
                    <input type="file" id="file" name="file"  class="layui-input">
                  </div>
                </div>
              </div>
              <div class="layui-form-item layui-form-text">
                <div class="layui-input-block">
                  <textarea id="reason" name="reason" required lay-verify="required" placeholder="详细描述" class="layui-textarea fly-editor" style="height: 260px;"></textarea>
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" >立即发布</button>
              </div>
            </form>
          </div>
            <%--话题开始--%>
          <div class="layui-form layui-tab-item ">
              <form id="form2" action="${pageContext.request.contextPath}/topic/add" method="post">
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