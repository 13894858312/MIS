<%--
  Created by IntelliJ IDEA.
  User: wangxue
  Date: 2018/6/30
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>订单列表</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../css/index.css">
    <script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../js/echarts.js"></script>
</head>
<body>
<header class="header">
    <div class="head-item">
        <a href="user-order-list.action">订单列表</a>
    </div>
    <div class="head-item">
        <a href="user-order.action">订单统计</a>
    </div>
    <div class="head-item">
        <a href="user-turnover.action">消费额统计</a>
    </div>
    <div class="head-item">
        <a href="ulogout.action">注销</a>
    </div>
</header>

<div class="main-page">
    <div class="turnover-content">
        <div class="content">
            <div class="tip">
                消费额统计
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
    <div class="content">
        <div class="tip">
            地区消费额统计
        </div>
        <div id="area" class="graph-back"></div>
    </div>

    <div class="content">
        <div class="tip">
            单笔订单消费金额区间统计
        </div>
        <div id="money" class="graph-back"></div>
    </div>

</div>
</body>
</html>
