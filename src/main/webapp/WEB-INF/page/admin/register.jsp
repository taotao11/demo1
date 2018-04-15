<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://v3.bootcss.com/favicon.ico">
    <title>添加管理员</title>
    <jsp:include page="../header.jsp"></jsp:include>
    <link href="<%=request.getContextPath()%>/css/signin.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">

      <form class="form-signin" action="<%=request.getContextPath()%>/admin/addAmain" method="post">
          <h2 class="form-signin-heading">添加管理员</h2>
          <c:if test="${ not empty error}">
              <div class="alert alert-warning alert-dismissable">${error}</div>
          </c:if>
          <label for="inputzh" class="sr-only">Account</label>
          <input type="text" id="inputzh" name="zh" class="form-control" placeholder="请输入账号" required="" autofocus="">


          <label for="inputName" class="sr-only">Account</label>
          <input type="text" id="inputName" name="name" class="form-control" placeholder="请输入昵称" required="" autofocus="">
          <label for="inputSex" class="sr-only">Account</label>
          <select id="inputSex"  class="form-control"  name="sex">
              <option value="0">男</option>
              <option value="1">女</option>
          </select>

          <label for="inputEmail" class="sr-only">Account</label>
          <input type="email" id="inputEmail" name="email" class="form-control" placeholder="请输入邮箱地址" required="" autofocus="">

          <label for="inputIpone" class="sr-only">Account</label>
          <input type="text" id="inputIpone" name="ipone" class="form-control" placeholder="请输入手机号" required="" autofocus="">

          <label for="inputadress" class="sr-only">Account</label>
          <input type="text" id="inputadress" name="adress" class="form-control" placeholder="请输入联系地址" required="" autofocus="">

          <label for="inputPwd" class="sr-only">Account</label>
          <input type="password" id="inputPwd" name="pwd" class="form-control" placeholder="请输入密码" required="" autofocus="">


          <button class="btn btn-lg btn-primary btn-block" type="submit">register in</button>
      </form>

    </div> <!-- /container -->


  

</body></html>