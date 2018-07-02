<%--
  Created by IntelliJ IDEA.
  User: wangxue
  Date: 2018/6/30
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评价统计</title>
</head>
<body>
<header>
    <div class="head-item">
        <a href="hotel-order-list.action">订单列表</a>
    </div>
    <div class="head-item">
        <a href="hotel-order.action">订单统计</a>
    </div>
    <div class="head-item">
        <a href="hotel-turnover.action">销售额统计</a>
    </div>
    <div class="head-item">
        <a href="hotel-room.action">房间统计</a>
    </div>
    <div class="head-item">
        <a href="hotel-comment.action">评价统计</a>
    </div>
    <div class="head-item">
        <a href="hlogout.action">注销</a>
    </div>
</header>

<div class="main-page">
    <div class="comment-content">

        <div class="content">
            <div class="tip">
                月度评分均值变化
            </div>
            <div id="comment" class="graph-back"></div>
        </div>

    </div>
</div>
</body>
</html>
