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
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../css/index.css">
    <script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../js/echarts.js"></script>
</head>
<body>
<header class="header">
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
    <div class="room-content">

        <div class="content">
            <div class="tip">
                客房列表
            </div>
            <div id="list" class="graph-back"></div>
        </div>

        <div class="content">
            <div class="tip">
                客房订单数占比
            </div>
            <div id="ordernum" class="graph-back"></div>
        </div>

        <div class="content">
            <div class="tip">
                客房销售额占比
            </div>
            <div id="turnover" class="graph-back"></div>
        </div>

    </div>
</div>
</body>
</html>
