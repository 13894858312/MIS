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
    <div class="room-content">

        <div class="content">
            <div id="percent" class="graph-back"></div>
        </div>
        <div class="content">
            <div id="order" class="graph-back"></div>
        </div>
        <div class="content">
            <div id="turnover" class="graph-back"></div>
        </div>
        <div class="content">
            <div id="reserved" class="graph-back"></div>
        </div>

    </div>

</div>
</body>

<script>
    function init() {
        getPercent();
        getOrder();
        getTurnover();
        getReserved()
    }
    
    function getPercent() {
            var content;
            var x=[];
            var temp =[];
            $.ajax({
                cache: false,
                async: false,
                url: 'getRoom.action',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    content = JSON.parse(data);
                    for(var i=0;i<content.length;i++){
                        x.push(content[i]['s']);
                        var t ={};
                        t.name=content[i]['s'];
                        t.value=content[i]['l'];
                        temp.push(t);
                    }
                }
            });
            var option = {
                title : {
                    text: '酒店现有客房数量',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient : 'vertical',
                    x : 'left',
                    data:x
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {
                            show: true,
                            type: ['pie', 'funnel'],
                            option: {
                                funnel: {
                                    x: '25%',
                                    width: '50%',
                                    funnelAlign: 'left',
                                    max: 1548
                                }
                            }
                        },
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                series : [
                    {
                        name:'客房类型',
                        type:'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:temp
                    }
                ]
            };
            var percent = echarts.init(document.getElementById("percent"));
            percent.setOption(option);
    }

    function getOrder() {
        var content;
        var x=[];
        var temp =[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getRoomOrder.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                for(var i=0;i<content.length;i++){
                    x.push(content[i]['s']);
                    var t ={};
                    t.name=content[i]['s'];
                    t.value=content[i]['l'];
                    temp.push(t);
                }
            }
        });
        var option = {
            title : {
                text: '各类型客房订单数占比',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient : 'vertical',
                x : 'left',
                data:x
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel'],
                        option: {
                            funnel: {
                                x: '25%',
                                width: '50%',
                                funnelAlign: 'left',
                                max: 1548
                            }
                        }
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            series : [
                {
                    name:'客房类型',
                    type:'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:temp
                }
            ]
        };
        var order=echarts.init(document.getElementById("order"));
        order.setOption(option);

    }

    function getTurnover() {
        var content;
        var x=[];
        var temp =[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getRoomTurnover.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                for(var i=0;i<content.length;i++){
                    x.push(content[i]['s']);
                    var t ={};
                    t.name=content[i]['s'];
                    t.value=content[i]['l'];
                    temp.push(t);
                }
            }
        });
        var option = {
            title : {
                text: '各类客房销售额占比',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient : 'vertical',
                x : 'left',
                data:x
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel'],
                        option: {
                            funnel: {
                                x: '25%',
                                width: '50%',
                                funnelAlign: 'left',
                                max: 1548
                            }
                        }
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            series : [
                {
                    name:'客房类型',
                    type:'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:temp
                }
            ]
        };
        var turnover = echarts.init(document.getElementById("turnover"));
        turnover.setOption(option);
    }

    function getReserved() {
        var reserved = echarts.init( document.getElementById("reserved"));
        var content;
        var x=[];
        var y=[];
        var content1;
        var x1=[];
        var y1=[];
        var lv=[];

        $.ajax({
            cache: false,
            async: false,
            url: 'getRoom.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                for(var i=0;i<content.length;i++){
                    x.push(content[i]['s']);
                    y.push(content[i]['l']);
                }
            }
        });
        $.ajax({
            cache: false,
            async: false,
            url: 'getReservedRoom.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content1 = JSON.parse(data);
                for(var i=0;i<content1.length;i++){
                    x1.push(content1[i]['s']);
                    y1.push(content1[i]['l']);
                    lv.push(content1[i]['l']/content[i]['l']);
                }
            }
        });
        var option = {
            title : {
                text: '今日酒店房间入住情况统计'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['客房数','预定数', '入住率']
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
                        formatter: '{value} 间'
                    }
                },
                {
                    type : 'value',
                    name : '入住率',
                    axisLabel : {
                        formatter: '{value}'
                    }
                }
            ],
            series : [
                {
                    name:'客房数',
                    type:'line',
                    data:y
                },
                {
                    name:'预定数',
                    type:'line',
                    data:y1,
                    markLine : {
                        data : [
                            {type : 'average', name : '平均值'}
                        ]
                    }
                },
                {
                    name:'入住率',
                    type:'line',
                    data: lv,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ]
        };

        reserved.setOption(option);
    }
</script>
</html>
