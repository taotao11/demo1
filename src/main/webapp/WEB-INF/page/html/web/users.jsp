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
  <c:if test="${page == null}">
    <script  type="text/javascript">
        window.location.href = "${pageContext.request.contextPath}/user/selectAllUser/1";
    </script >
  </c:if>
  <div class="layui-row layui-col-space15">
    <div class="fly-panel fly-panel-user" pad20>
      <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title">
          <li class="layui-this">会员信息表</li>
        </ul>
        <div class="layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
          <div class="layui-tab-item layui-show">
            <table class="layui-table" lay-skin="line">
              <colgroup>
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <thead>
              <tr>
                <th>账号</th>
                <th>加入时间</th>
                <th>名称</th>
                <th>邮箱</th>
                <th>手机</th>
                <th>性别</th>
                <th>删除</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${page.records}" var="p">
                <tr>
                  <td>${p.zh}</td>
                  <td>${p.creatTime}</td>
                  <td>${p.name}</td>
                  <td>${p.email}</td>
                  <td>${p.ipone}</td>
                  <td>${p.sex == 1 ? "男" : "女"}</td>
                  <td><a href="${pageContext.request.contextPath}/user/deleteUser?id=${p.id}">删除</a></td>
                </tr>
              </c:forEach>

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<%--<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>--%>
<script>
    //JavaScript代码区域
    layui.use('form',function(){});<!--加载form模块-->
</script>
</body>
</html>