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
  <div class="layui-row layui-col-space15">
    <div class="fly-panel fly-panel-user" pad20>
      <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title">
          <li class="layui-this">管理员信息</li>
          <li >添加管理员</li>
        </ul>
        <div class="layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
          <div class="layui-tab-item layui-show">
            <div class="layui-form layui-form-pane">
              <form id="form1" method="post" action="${pageContext.request.contextPath}/admin/update">
                <div class="layui-form-item">
                  <label for="L_zh" class="layui-form-label">账号</label>
                  <div class="layui-input-inline">
                    <input type="text" id="L_zh" name="zh" value="${admin.zh}" required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                  <c:if test="${error != null}">
                    <div class="layui-form-mid layui-word-aux">${error}</div>
                  </c:if>
                  <c:if test="${message != null}">
                    <div class="layui-form-mid layui-word-aux">${message}</div>
                  </c:if>
                </div>
                <div class="layui-form-item">
                  <label for="L_name" class="layui-form-label">名称</label>
                  <div class="layui-input-inline">
                    <input type="text" id="L_name" name="name" value="${admin.name}" required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                  <c:if test="${error != null}">
                    <div class="layui-form-mid layui-word-aux">${error}</div>
                  </c:if>
                  <c:if test="${message != null}">
                    <div class="layui-form-mid layui-word-aux">${message}</div>
                  </c:if>
                </div>
                <div class="layui-form-item">
                  <label for="L_email" class="layui-form-label">邮箱</label>
                  <div class="layui-input-inline">
                    <input type="text" id="L_email" name="email" value="${admin.email}" required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                  <c:if test="${error != null}">
                    <div class="layui-form-mid layui-word-aux">${error}</div>
                  </c:if>
                  <c:if test="${message != null}">
                    <div class="layui-form-mid layui-word-aux">${message}</div>
                  </c:if>
                </div>
                <div class="layui-form-item">
                  <label for="L_pass" class="layui-form-label">密码</label>
                  <div class="layui-input-inline">
                    <input type="text" id="L_pass" name="pwd" value="${admin.pwd}" required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                </div>
                <div class="layui-form-item">
                  <label for="L_ipone" class="layui-form-label">手机</label>
                  <div class="layui-input-inline">
                    <input type="text" id="L_ipone" name="ipone" value="${admin.ipone}" required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                </div>
                <div class="layui-form-item">
                  <label for="L_address" class="layui-form-label">地址</label>
                  <div class="layui-input-inline">
                    <input type="text" id="L_address" name="adress" value="${admin.adress}" required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                </div>
                <div class="layui-form-item">
                  <label for="L_sex" class="layui-form-label">性别</label>
                  <div class="layui-input-inline">
                    <select  id="L_sex" name="sex" class="layui-input">
                        <option value="1" ${user.sex == 1 ? "selected='selected'": ""}>男</option>
                        <option value="0" ${user.sex == 0 ? "selected='selected'": ""}>女</option>
                    </select>
                  </div>
                </div>
                <div class="layui-form-item">
                  <button class="layui-btn" lay-filter="*" lay-submit>立即修改</button>
                </div>
              </form>
            </div>
          </div>
          <div class="layui-tab-item ">
            <div class="layui-form layui-form-pane">
              <form id="form" method="post" action="${pageContext.request.contextPath}/admin/addAmain">
                <div class="layui-form-item">
                  <label for="zh" class="layui-form-label">账号</label>
                  <div class="layui-input-inline">
                    <input type="text" id="zh" name="zh"  required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                  <c:if test="${error != null}">
                    <div class="layui-form-mid layui-word-aux">${error}</div>
                  </c:if>
                  <c:if test="${message != null}">
                    <div class="layui-form-mid layui-word-aux">${message}</div>
                  </c:if>
                </div>
                <div class="layui-form-item">
                  <label for="name" class="layui-form-label">名称</label>
                  <div class="layui-input-inline">
                    <input type="text" id="name" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                  <c:if test="${error != null}">
                    <div class="layui-form-mid layui-word-aux">${error}</div>
                  </c:if>
                  <c:if test="${message != null}">
                    <div class="layui-form-mid layui-word-aux">${message}</div>
                  </c:if>
                </div>
                <div class="layui-form-item">
                  <label for="email" class="layui-form-label">邮箱</label>
                  <div class="layui-input-inline">
                    <input type="text" id="email" name="email"  required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                  <c:if test="${error != null}">
                    <div class="layui-form-mid layui-word-aux">${error}</div>
                  </c:if>
                  <c:if test="${message != null}">
                    <div class="layui-form-mid layui-word-aux">${message}</div>
                  </c:if>
                </div>
                <div class="layui-form-item">
                  <label for="pass" class="layui-form-label">密码</label>
                  <div class="layui-input-inline">
                    <input type="text" id="pass" name="pwd"  required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                </div>
                <div class="layui-form-item">
                  <label for="ipone" class="layui-form-label">手机</label>
                  <div class="layui-input-inline">
                    <input type="text" id="ipone" name="ipone"  required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                </div>
                <div class="layui-form-item">
                  <label for="address" class="layui-form-label">地址</label>
                  <div class="layui-input-inline">
                    <input type="text" id="address" name="adress"  required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
                </div>
                <div class="layui-form-item">
                  <label for="sex" class="layui-form-label">性别</label>
                  <div class="layui-input-inline">
                    <select  id="sex" name="sex" class="layui-input">
                      <option value="1" >男</option>
                      <option value="0" >女</option>
                    </select>
                  </div>
                </div>
                <div class="layui-form-item">
                  <button class="layui-btn" lay-filter="*" lay-submit>立即添加</button>
                </div>
              </form>
            </div>
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