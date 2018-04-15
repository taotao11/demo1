<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0043)https://v3.bootcss.com/examples/dashboard/# -->
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://v3.bootcss.com/favicon.ico">
    <title>义捐--管理员后台管理</title>
    <jsp:include page="../header.jsp"></jsp:include>
  <link href="<%=request.getContextPath()%>/css/dashboard.css" rel="stylesheet" />

  </head>

  <body>
  <c:if test="${empty money}">
    <%--请求数据--%>
    <script type="text/javascript">
        $(document).ready(function () {
            window.location.href = "${pageContext.request.contextPath}/money/selectAdmin";
        });
    </script>
  </c:if>
    <!--导航开始-->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">义捐--Admin</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <c:if test="${not empty admin}">
              <ul class="nav navbar-nav navbar-right click-changes">
                <li><a href="#">金池金币: <span class="text-danger">${money.money}</span></a></li>
                <li url = "<%=request.getContextPath()%>/web/adminInfo"><a href="#">${admin.name}</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/layout">退出登录</a></li>
              </ul>
            </c:if>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar click-changes">
            <li class="active"  url = "/web/register"><a href="#" >添加管理员</a></li>
            <li  url = "<%=request.getContextPath()%>/web/adminsInfo"><a href="#" >所有管理员</a></li>
            <li url = "<%=request.getContextPath()%>/web/usersInfo"><a href="#" >会员管理</a></li>
            <li url = "<%=request.getContextPath()%>/web/goods"><a href="#" >义卖物品管理</a></li>
            <li url = "<%=request.getContextPath()%>/web/Apply"><a href="#" >申请救助管理</a></li>
            <li url = "<%=request.getContextPath()%>/web/moneyList"><a href="#" >会员充值表</a></li>
            <li url = "<%=request.getContextPath()%>/web/orderList"><a href="#" >会员订单表</a></li>
            <li url = "<%=request.getContextPath()%>/web/myjuanzhen"><a href="#" >会员捐赠表</a></li>
            <li url = "<%=request.getContextPath()%>/pubilcInfo"><a href="#" >金币信息公开</a></li>
            <li url = "<%=request.getContextPath()%>/pintaijuan"><a href="#" >平台捐赠公开</a></li>
          </ul>

        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <iframe id="external-frame" src= "<%=request.getContextPath()%>/web/adminInfo" >

          </iframe>

        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->

    <script>
      //iframe 高度 宽度自适应
        function setIframeHeight(iframe) {
            if (iframe) {
                var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
                if (iframeWin.document.body) {
                    iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
                    // iframe.width = iframeWin.document.documentElement.scrollWidth || iframeWin.document.body.scrollWidth;
                }
            }
        };

        window.onload = function () {
            setIframeHeight(document.getElementById('external-frame'));
            //点击切换iframe 框架 src
            $(".click-changes").find("li").click(function (e) {
                $(this).addClass("active").siblings().removeClass("active");
                $("#external-frame").attr("src",$(this).attr("url"));
                setIframeHeight(document.getElementById('external-frame'));

            });
        };
    </script>
  

</body></html>