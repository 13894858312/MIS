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
    <script type="text/javascript" src="../../js/main.js"></script>
</head>
<body onload="init()">
<header class="header">
    <%--<div class="head-item">--%>
        <%--<a href="hotel-order-list.action">订单列表</a>--%>
    <%--</div>--%>
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
        <div id="content">
            <div id="yearly" class="graph-back"></div>
            <div id="monthly" class="graph-back"></div>
            <div id="daily" class="graph-back"></div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    function getYearly() {
        var content;
        var temp =[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getHotelYearlyOrderNum.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                for(var i=0;i<content.length;i++){
                    temp.push([content[i]['s'], content[i]['l']]);
                }
            }
        });
        var option = {
            title : {
                text : '网站分年订单数统计折线图'
            },
            tooltip : {
                trigger: 'item',
                formatter : function (params) {
                    var date = new Date(params.value[0]);
                    data = date.getFullYear();
                    return data + '<br/>'
                        + params.value[1] + ', '
                        + params.value[2];
                }
            },
            dataZoom: {
                show: true,
                start : 0
            },
            legend : {
                data : ['订单数']
            },
            grid: {
                y2: 80
            },
            xAxis : [
                {
                    type : 'time',
                    splitNumber:10
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name: '订单数',
                    type: 'line',
                    showAllSymbol: true,
                    symbolSize: function (value){
                        return Math.round(value[2]/10) + 2;
                    },
                    data:temp
                }
            ]
        };
        var yearly = echarts.init(document.getElementById("yearly"));
        yearly.setOption(option);

    }
    function getMonthly() {
        var content;
        var temp=[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getHotelMonthlyOrderNum.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                for(var i=0;i<content.length;i++){
                    temp.push([content[i]['s'], content[i]['l']]);
                }

            }
        });
        var option = {
            title : {
                text : '网站本年分月订单数统计折线图'
            },
            tooltip : {
                trigger: 'item',
                formatter : function (params) {
                    var date = new Date(params.value[0]);
                    data = date.getFullYear() + '-'
                        + (date.getMonth() + 1) ;
                    return data + '<br/>'
                        + params.value[1] + ', '
                        + params.value[2];
                }
            },
            dataZoom: {
                show: true,
                start : 0
            },
            legend : {
                data : ['订单数']
            },
            grid: {
                y2: 80
            },
            xAxis : [
                {
                    type : 'time',
                    splitNumber:10
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name: '订单数',
                    type: 'line',
                    showAllSymbol: true,
                    symbolSize: function (value){
                        return Math.round(value[2]/10) + 2;
                    },
                    data:temp
                }
            ]
        };
        var monthly = echarts.init(document.getElementById("monthly"));
        monthly.setOption(option);
    }
    function getDaily() {
        var content;
        var temp=[];
        var daily = echarts.init(document.getElementById("daily"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getHotelDailyOrderNum.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                for(var i=0;i<content.length;i++){
                    temp.push([content[i]['s'], content[i]['l']]);
                }

            }
        });
        var option = {
            title : {
                text : '网站本月分日订单数统计折线图'
            },
            tooltip : {
                trigger: 'item',
                formatter : function (params) {
                    var date = new Date(params.value[0]);
                    data = date.getFullYear() + '-'
                        + (date.getMonth() + 1) + '-'
                        + date.getDate();
                    return data + '<br/>'
                        + params.value[1] + ', '
                        + params.value[2];
                }
            },
            dataZoom: {
                show: true,
                start : 0
            },
            legend : {
                data : ['订单数']
            },
            grid: {
                y2: 80
            },
            xAxis : [
                {
                    type : 'time',
                    splitNumber:10
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name: '订单数',
                    type: 'line',
                    showAllSymbol: true,
                    symbolSize: function (value){
                        return Math.round(value[2]/10) + 2;
                    },
                    data:temp
                }
            ]
        };
        daily.setOption(option);

    }
    function init() {
        getYearly();
        getMonthly();
        getDaily();
    }
</script>
</html>
