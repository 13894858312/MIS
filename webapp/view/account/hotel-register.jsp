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
    <title>酒店注册</title>
    <link rel="stylesheet" href="../../css/index.css">
    <script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="main-page">
    <div class="login-box">

        <Form action="hregister.action" method="post" class="login-form">
            账号：<input type="text" id="hotel-hid" name="hid" maxlength="30" placeholder="酒店帐号" />
            <br/>
            密码：<input type="password" id="hotel-pwd" name="pwd" maxlength="30" placeholder="酒店密码">
            <br/>
            名称：<input type="text" id="hotel-hname" name="hname" maxlength="30" placeholder="酒店名称">
            <br/>
            <input type="submit" id="hotel_submit" class="submit" value="注册"/>
        </Form>
        <script type="text/javascript">
            var msg = "${requestScope.tipMessage}";
            if(msg != "") {
                alert(msg);
            }
        </script>
        <div><a href="hotel-login.action">返回</a> </div>
    </div>
</div>
</body>
</html>
