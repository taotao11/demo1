<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/column.jsp"></jsp:include>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8 content detail">
      <div class="fly-panel detail-box">
        <h1>${jindian.title}</h1>
        <div class="fly-detail-info">
          <!-- <span class="layui-badge">审核中</span> -->
          <span class="layui-badge layui-bg-green fly-detail-column">景点</span>
          
          <span class="layui-badge" style="background-color: #999;">未结</span>
          <!-- <span class="layui-badge" style="background-color: #5FB878;">已结</span> -->
          
          <span class="layui-badge layui-bg-black">置顶</span>
          <c:if test="${user.id != u.id}">

            <c:if test="${guan == null}">
              <span class="layui-badge layui-bg-red " id="guan">关注</span>
            </c:if>
            <c:if test="${guan != null}">
              <span class="layui-badge layui-bg-red " id="qx">已关注</span>
            </c:if>
          </c:if>

          <span class="fly-list-nums"> 
            <a href="#comment"><i class="iconfont" title="回答">&#xe60c;</i> ${c.size() == 0 ? 0: c.size()}</a>
          </span>
        </div>
        <div class="detail-about">
          <a class="fly-avatar" href="${pageContext.request.contextPath}/myIndex/${u.id}">
            <img src="${pageContext.request.contextPath}/${u.url}" alt="${u.name}">
          </a>
          <div class="fly-detail-user">
            <input type="hidden" id="bid" value="${u.id}">
            <a href="${pageContext.request.contextPath}/myIndex/${u.id}" class="fly-link">
              <cite>${u.name}</cite>
              <i class="iconfont icon-renzheng" title="认证信息：{{ xxxxx }}"></i>
              <i class="layui-badge fly-badge-vip">VIP</i>
            </a>
            <span>${jindian.beginTime}</span>
          </div>

        </div>
        <div class="detail-body photos">
          <p>
            该景点由 ${u.name} 提供
          </p>
          <p>推荐理由：</p>
<pre>
${jindian.reason}
</pre>

          封面<hr>
          <p>
            <img src="${pageContext.request.contextPath}/${jindian.url}" alt="">
          </p>
        </div>
      </div>

      <div class="fly-panel detail-box" id="flyReply">
        <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
          <legend>回帖</legend>
        </fieldset>

        <ul class="jieda" id="jieda">
          <c:forEach items="${c}" var="cc">
            <li data-id="111" class="jieda-daan">
              <a name="item-1111111111"></a>
              <div class="detail-about detail-about-reply">
                <a class="fly-avatar" href="${pageContext.request.contextPath}/myIndex/${cc.user.id}">
                  <img src="${pageContext.request.contextPath}/${cc.user.url}" alt=" ">
                </a>
                <div class="fly-detail-user">
                  <a href="" class="fly-link">
                    <cite>${cc.user.name}</cite>
                    <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                    <i class="layui-badge fly-badge-vip">VIP</i>
                  </a>
                </div>

                <div class="detail-hits">
                  <span>${cc.comment.time}</span>
                </div>

              </div>
              <div class="detail-body jieda-body photos">
                <p>${cc.comment.content}</p>
              </div>
              <div class="jieda-reply">
              <span class="jieda-zan zanok" type="zan">

              </span>
                <c:if test="${admin != null}">
                  <div class="jieda-admin">
                    <a href="${pageContext.request.contextPath}/comment/delete?id=${cc.comment.id}&&type=1" type="del">删除</a>
                  </div>
                </c:if>
              </div>
            </li>
          </c:forEach>

          <!-- 无数据时 -->
          <!-- <li class="fly-none">消灭零回复</li> -->
        </ul>
        
        <div class="layui-form layui-form-pane">

            <input type="hidden"id="uid" value="${user.id}" name="uid">
            <input type="hidden"id="path" value="${pageContext.request.contextPath}" name="uid">
            <input type="hidden" id="jid"name="jid" value="${jindian.id}">
            <div class="layui-form-item layui-form-text">
              <a name="comment"></a>
              <div class="layui-input-block">
                <textarea id="L_content" name="content"  required lay-verify="required" placeholder="请输入内容"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <button id="sub" class="layui-btn" lay-filter="*" lay-submit>提交回复</button>
            </div>

        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
    //主动加载jquery模块
    layui.use(['jquery', 'layer'], function(){
        var $ = layui.$ //重点处
            ,layer = layui.layer;
        $('#sub').click(function () {
            $.ajax({
                url:$('#path').val()+'/comment/add',
                type:'POST', //GET
                async:true,    //或false,是否异步
                data:{
                    'jid':$('#jid').val(),
                    'uid':$('#uid').val(),
                    'content':$("#L_content").val()
                },
                timeout:5000,    //超时时间
                dataType:'text',    //返回的数据格式：json/xml/html/script/jsonp/text
                success:function(data){
                    layer.msg('评论成功。。',{time:1000}, {icon: 1});

                },
                error:function(xhr,textStatus){
                    console.log('错误')
                    console.log(xhr)
                    console.log(textStatus)
                }
            });
        });
        //关注
        $('#guan').click(function () {
            $.ajax({
                url:$('#path').val()+'/follow/add',
                type:'POST', //GET
                async:true,    //或false,是否异步
                data:{
                    'bid':$('#bid').val(),
                    'gid':$('#uid').val(),
                },
                timeout:5000,    //超时时间
                dataType:'text',    //返回的数据格式：json/xml/html/script/jsonp/text
                success:function(data){
                    layer.msg('关注成功。。',{time:1000}, {icon: 1});
                    $("#guan").text("已关注");
                },
                error:function(xhr,textStatus){
                    console.log('错误')
                    console.log(xhr)
                    console.log(textStatus)
                }
            });
        });

    });
</script>
</body>
</html>