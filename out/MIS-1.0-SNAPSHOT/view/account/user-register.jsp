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
    <title>用户注册</title>
    <link rel="stylesheet" href="../../css/index.css">
    <style type="text/css">
        @import "../../css/index.css";
    </style>
    <script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="main-page">
    <div class="login-box">
        <Form action="uregister.action" method="post" class="login-form">
            账号：<input type="text" id="user-uid" name="uid" maxlength="30" placeholder="帐号" />
            <br/>
            密码：<input type="password" id="user-pwd" name="pwd" maxlength="30" placeholder="密码">
            <br/>
            <input type="hidden" id="user-type" name="type" value=0>
            <input type="submit" id="user-submit" class="submit" value="注册"/>
        </Form>
        <script type="text/javascript">
            var msg = "${requestScope.tipMessage}";
            if(msg != "") {
                alert(msg);
            }
        </script>
        <div><a href="user-login.action">返回</a> </div>
    </div>
</div>
</body>
</html>
