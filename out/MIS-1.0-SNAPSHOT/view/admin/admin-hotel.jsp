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
    <title>酒店统计</title>
</head>
<body>
<header>
    <div class="head-item">
        <a href="admin-order-list.action">订单列表</a>
    </div>
    <div class="head-item">
        <a href="admin-order.action">订单统计</a>
    </div>
    <div class="head-item">
        <a href="admin-turnover.action">销售额统计</a>
    </div>
    <div class="head-item">
        <a href="admin-hotel.action">酒店统计</a>
    </div>
    <div class="head-item">
        <a href="admin-user.action">客户统计</a>
    </div>
    <div class="head-item">
        <a href="alogout.action">注销</a>
    </div>
</header>

<div class="main-page">
    <div class="hotel-content">
        <div class="tip">
            酒店订单数排行
        </div>
        <div id="order" class="graph-back"></div>

        <div class="tip">
            酒店销售额排行
        </div>
        <div id="turnover" class="graph-back"></div>

        <div class="tip">
            各酒店总销售额占比
        </div>
        <div id="percent" class="graph-back"></div>
    </div>
</div>
</body>
</html>
