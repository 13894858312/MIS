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
    <div class="turnover-content">
        <div class="content">
            <div id="yearly" class="graph-back"></div>
            <div id="monthly" class="graph-back"></div>
            <div id="daily" class="graph-back"></div>
        </div>
        <div class="content">
            <div id="change" class="graph-back"></div>
        </div>
        <div class="content">
            <div id="same" class="graph-back"></div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    function init() {
        getYearly();
        getMonthly();
        getDaily();
        getChange();
        getSame();
    }

    function getYearly() {
        var content;
        var temp =[];
        var yearly = echarts.init(document.getElementById("yearly"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getHotelYearlyTurnover.action',
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
            url: 'getHotelMonthlyTurnover.action',
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
            url: 'getHotelDailyTurnover.action',
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
                    data:temp
                }
            ]
        };
        daily.setOption(option);
    }

    function getSame() {
        var content1;
        var content2;
        var x=[];
        var y1=[];
        var y2=[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getSameTermTurnover.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content1 = JSON.parse(data);
                for(var i=0;i<content1.length;i++){
                    x.push(content1[i]['s']);
                    y1.push(content1[i]['l']);
                }
            }
        });
        $.ajax({
            cache: false,
            async: false,
            url: 'getHotelMonthlyTurnover.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content2 = JSON.parse(data);
                for(var i=0;i<content2.length;i++){
                    y2.push(content2[i]['l']);
                }
            }
        });
        var option = {
            title : {
                text: '今年销售额去年同期销售额对比'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['今年','去年同期']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : x
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value} 元'
                    }
                }
            ],
            series : [
                {
                    name:'今年',
                    type:'line',
                    data: y2,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                },
                {
                    name:'去年同期',
                    type:'line',
                    data: y1,
                    markLine : {
                        data : [
                            {type : 'average', name : '平均值'}
                        ]
                    }
                }
            ]
        };

        var same = echarts.init(document.getElementById("same"));
        same.setOption(option);
    }
    function getChange() {
        var content;
        var x=[];
        var y=[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getHotelTurnoverChange.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                for(var i=0;i<content.length;i++){
                    x.push(content[i]['s']);
                    y.push(content[i]['d']);
                }
            }
        });
        var option = {
            title:{
                text:'本年度各月销售额变化率统计图（本月/上月销售额）'
            },
            tooltip:{
                trigger:'axis'
            },
            legend:{
                data:['变化率']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            xAxis:{
                show:false,
                type: 'category',
                data: x
            },
            yAxis:{},
            series:[{
                name:'变化率',
                type:'line',
                data:y
            }]
        };
        var change = echarts.init(document.getElementById("change"));
        change.setOption(option);
    }

</script>
</html>
