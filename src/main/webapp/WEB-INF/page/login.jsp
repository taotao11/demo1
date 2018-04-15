<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0039)https://v3.bootcss.com/examples/signin/ -->
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://v3.bootcss.com/favicon.ico">
    <title>Signin</title>
    <jsp:include page="header.jsp"></jsp:include>
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/css/signin.css" rel="stylesheet">

  </head>

  <body>

    <div class="container">
      <form class="form-signin" action="<%=request.getContextPath()%>/user/login" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
          <c:if test="${ not empty error}">
            <div class="alert alert-warning alert-dismissable">${error}</div>
          </c:if>
          <c:if test="${not empty message}">
              <div class="alert alert-success alert-dismissable">${message}</div>
          </c:if>
        <label for="inputEmail" class="sr-only">Account</label>
        <input type="text" name="zh" id="inputEmail" class="form-control" placeholder="Account" required="" autofocus="">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="pwd" id="inputPassword" class="form-control" placeholder="Password" required="">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
          <p class="text-right">没有账号请先<a href="<%=request.getContextPath()%>/register">注册</a></p>
      </form>

    </div> <!-- /container -->
  </body>
</html>