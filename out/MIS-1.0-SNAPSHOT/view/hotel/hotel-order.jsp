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
    <title>订单统计</title>
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
    <div class="order-content">

        <div class="content">
            <div class="tip">
                订单状态
            </div>
            <div class="graph-back" id="percent"></div>
        </div>

        <div class="content">
            <div class="tip">
                订单数统计
            </div>
            <div id="con">
                <ul id="tags">
                    <li class="selectTag">
                        <a onClick="selectTag('tagContent0',this)" href="javascript:void(0)">分年显示</a>
                    </li>
                    <li class="selectTag">
                        <a onClick="selectTag('tagContent1',this)" href="javascript:void(0)">分月显示</a>
                    </li>
                    <li class="selectTag">
                        <a onClick="selectTag('tagContent2',this)" href="javascript:void(0)">分日显示</a>
                    </li>
                </ul>
            </div>
            <div id="tag-content">
                <div class="tagContent selectTag" id="tagContent0">
                    <div id="yearly" class="orderlist"></div>
                </div>
                <div class="tagContent" id="tagContent1">
                    <div id="monthly" class="orderlist"></div>
                </div>
                <div class="tagContent" id="tagContent2">
                    <div id="daily" class="orderlist"></div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
