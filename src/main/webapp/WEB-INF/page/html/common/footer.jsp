<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="fly-footer">
  <p><a href="" target="_blank">手拉手</a> 2018 &copy; <a href="" target="_blank">sls.com 出品</a></p>
  <p>
    <a href="#">携程</a>
    <a href="#">爱彼邻</a>
    <a href="#">高德地图</a>
  </p>
</div>

<script src="../res/layui/layui.js"></script>
<script>
layui.cache.page = '';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '../res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "3.0.0"
  ,base: '../res/mods/'  //这里实际使用时，建议改成绝对路径
}).extend({
  fly: 'index'
}).use('fly');
</script>