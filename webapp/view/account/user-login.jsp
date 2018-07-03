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
    <title>用户登录</title>
    <link rel="stylesheet" href="../../css/index.css">
</head>
<body>
<div>
    <div class="login-box">
        <Form action="ulogin.action" method="post" class="login-form">
            <input class="textfield" type="text" id="user-uid" name="uid" maxlength="30" placeholder="帐号" />
            <br/>
            <input class="textfield" type="password" id="user-pwd" name="pwd" maxlength="30" placeholder="密码">
            <br/>
            <input type="hidden" id="user-type" name="type" value=0>
            <input type="submit" id="user-submit" class="submit" value="登陆"/>
        </Form>
        <div><a href="user-register.action">注册</a> </div>
        <div><a href="admin-login.action">管理员入口</a> </div>
        <div><a href="hotel-login.action">酒店入口</a> </div>
        <script type="text/javascript">
            var msg = "${requestScope.tipMessage}";
            if(msg != "") {
                alert(msg);
            }
        </script>
    </div>
</div>
</body>
</html>
