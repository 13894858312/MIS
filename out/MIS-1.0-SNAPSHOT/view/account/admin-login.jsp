<%--
  Created by IntelliJ IDEA.
  User: wangxue
  Date: 2017/6/6
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理员登陆</title>
    <link rel="stylesheet" href="../../css/index.css">
    <script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="main-page">
    <div class="login-box">

        <Form action="alogin.action" method="post" class="login-form">
            账号：<input type="text" id="admin-uid" name="uid" maxlength="30" placeholder="管理员帐号" />
            <br/>
            密码：<input type="password" id="admin-pwd" name="pwd" maxlength="30" placeholder="管理员密码">
            <br/>
            <input type="hidden" id="admin-type" name="type" value=1>
            <input type="submit" id="admin-login_submit" class="submit" value="登陆"/>
        </Form>
        <script type="text/javascript">
            var msg = "${requestScope.tipMessage}";
            if(msg != "") {
                alert(msg);
            }
        </script>
        <div><a href="user-login.action">用户入口</a> </div>
        <div><a href="hotel-login.action">酒店入口</a> </div>
    </div>
</div>
</body>
</html>
