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
    <title>销售额统计</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../css/index.css">
    <script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../js/echarts.js"></script>
    <script type="text/javascript" src="../../js/main.js"></script>
    <script type="text/javascript" src="../../js/china.js"></script>
</head>
<body onload="init()">
<header class="header">
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
    <div class="order-content">
        <div id="content">
            <div id="yearly" class="graph-back"></div>
            <div id="monthly" class="graph-back"></div>
            <div id="daily" class="graph-back"></div>
        </div>
        <div id="area" class="graph-back"></div>
    </div>
</div>
</body>

<script type="text/javascript">
    function getYearly() {
        var content;
        var temp =[];
        var yearly = echarts.init(document.getElementById("yearly"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminTurnoverYearly.action',
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
                text : '网站分年销售额统计折线图'
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
                data : ['销售额']
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
                    name: '销售额',
                    type: 'line',
                    showAllSymbol: true,
                    symbolSize: function (value){
                        return Math.round(value[2]/10) + 2;
                    },
                    data:temp
                }
            ]
        };
        yearly.setOption(option);

    }
    function getMonthly() {
        var content;
        var temp=[];
        var monthly = echarts.init(document.getElementById("monthly"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminTurnoverMonthly.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                for(var i=0;i<content.length;i++){
                    temp.push([content[i]['s'], content[i]['l']]);
                }

            }
        });var option = {
            title : {
                text : '网站本年分月销售额统计折线图'
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
                data : ['销售额']
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
                    name: '销售额',
                    type: 'line',
                    showAllSymbol: true,
                    symbolSize: function (value){
                        return Math.round(value[2]/10) + 2;
                    },
                    data:temp
                }
            ]
        };
        monthly.setOption(option);
    }
    function getDaily() {
        var content;
        var temp=[];
        var daily = echarts.init(document.getElementById("daily"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminTurnoverDaily.action',
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
                text : '网站本月分日销售额统计折线图'
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
                data : ['销售额']
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
                    name: '销售额',
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
    function getAreaOrder() {
        var content;
        var temp=[];
        var area = echarts.init(document.getElementById("area"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminAreaTurnover.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                for(var i=0;i<content.length;i++){
                    var t = {};
                    t.name=content[i]['s'];
                    t.value=content[i]['l'];
                    temp.push(t);
                }
            }
        });

        var option = {
            title : {
                text: '全国销售额分布'
            },
            tooltip : {
                trigger: 'item'
            },
            legend: {
                x:'right',
                selectedMode:false,
                data:[]
            },
            dataRange: {
                orient: 'horizontal',
                min: 0,
                max: 500,
                text:['高','低'],           // 文本，默认为数值文本
                splitNumber:0
            },
            toolbox: {
                show : true,
                orient: 'vertical',
                x:'right',
                y:'center',
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false}
                }
            },
            series : [
                {
                    name: '全国销售额分布',
                    type: 'map',
                    mapType: 'china',
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                    data:temp
                }
            ],
            animation: false
        };

        area.setOption(option);
    }
    function init() {
        getYearly();
        getMonthly();
        getDaily();
        getAreaOrder();
    }
</script>
</html>
