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
</head>
<body>
<header>
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
    <div class="order-content">
        <div class="tip">
            订单列表
        </div>
        <div id="con">
            <ul id="tags">
                <li class="selectTag">
                    <a onClick="selectTag('tagContent0',this)" href="javascript:void(0)">全部订单</a>
                </li>
                <li class="selectTag">
                    <a onClick="selectTag('tagContent1',this)" href="javascript:void(0)">已完成</a>
                </li>
                <li class="selectTag">
                    <a onClick="selectTag('tagContent2',this)" href="javascript:void(0)">未完成</a>
                </li>
                <li class="selectTag">
                    <a onclick=" selectTag('tagContent3', this)" href="javascript:void(0)">已取消</a>
                </li>
                <li class="selectTag">
                    <a onclick=" selectTag('tagContent4', this)" href="javascript:void(0)">已评价</a>
                </li>
            </ul>
        </div>
        <div id="tag-content">
            <div class="tagContent selectTag" id="tagContent0">
                <div id="all-count" class="subtip"></div>
                <div id="all-orders" class="orderlist"></div>
            </div>
            <div class="tagContent" id="tagContent1">
                <div id="yep-count" class="subtip"></div>
                <div id="yep-orders" class="orderlist"></div>
            </div>
            <div class="tagContent" id="tagContent2">
                <div id="not-count" class="subtip"></div>
                <div id="not-orders" class="orderlist"></div>
            </div>
            <div class="tagContent" id="tagContent3">
                <div id="cancel-count" class="subtip"></div>
                <div id="cancel-orders" class="orderlist"></div>
            </div>
            <div class="tagContent" id="tagContent4">
                <div id="pjed-count" class="subtip"></div>
                <div id="pjed-orders" class="orderlist"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
