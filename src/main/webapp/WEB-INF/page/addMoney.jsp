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
    <title>Register</title>
    <jsp:include page="header.jsp"></jsp:include>
    <link href="<%=request.getContextPath()%>/css/signin.css" rel="stylesheet">
</head>

<body>

<div class="container">

    <form class="form-signin" action="<%=request.getContextPath()%>/rechange/addRechange" method="post">
        <h2 class="form-signin-heading">充值中心--等比换算 1:1</h2>
        <c:if test="${ not empty error}">
            <div class="alert alert-warning alert-dismissable">${error}</div>
        </c:if>
        <c:if test="${ not empty success}">
            <div class="alert alert-success alert-dismissable">${success}</div>
        </c:if>

        <label for="inputmoney" class="sr-only">Account</label>
        <input type="number" id="inputmoney" name="money" class="form-control" placeholder="请输入金额" required="" autofocus="">
        <input type="hidden" value="${user.id}" name="uid">

        <label for="type" class="sr-only">Account</label>
        <select id="type" class="form-control" name="type">
            <option value="支付宝">支付宝</option>
            <option value="网银">网银</option>
            <option value="微信支付">微信支付</option>
            <option value="财付通">财付通</option>
            <option value="比特币">比特币</option>
        </select>
        <label for="inputPwd" class="sr-only">Account</label>
        <input type="password" id="inputPwd" name="pwd" class="form-control" placeholder="请输入密码" required="" autofocus="">
        <a  href="#modal-container-49626" role="button" data-toggle="modal"  class="btn-sm btn-info" style="">获得支付二维码</a>
        <button type="submit" class="btn btn-info" style="margin-left: 160px">确认支付</button>
    </form>
    <div class="col-md-12 column">
        <div class="modal fade" id="modal-container-49626" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="margin-top: 100px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel">
                            请扫描二维码
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12 column">
                            <img src="images/1523799695.png" width="200px" height="150px">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default"  data-dismiss="modal">去支付</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- /container -->




</body></html>