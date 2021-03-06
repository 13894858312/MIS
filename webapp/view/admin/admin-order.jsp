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
    <script type="text/javascript" src="../../js/china.js"></script>
</head>
<body onload="init()">
<header class="header">
    <%--<div class="head-item">--%>
        <%--<a href="admin-order-list.action">订单列表</a>--%>
    <%--</div>--%>
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
        var x=[];
        var y=[];
        var yearly = echarts.init(document.getElementById("yearly"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminOrderYearly.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                content.sort(up);
                for(var i=0;i<content.length;i++){
                    x.push(content[i]['s']);
                    y.push(content[i]['l']);
                }
            }
        });
        var option = {
            title : {
                text: '网站分年订单数统计'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['订单数']
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
                        formatter: '{value}'
                    }
                }
            ],
            series : [
                {
                    name:'订单数',
                    type:'line',
                    data:y,
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
                }
            ]
        };

        yearly.setOption(option);

    }
    function getMonthly() {
        var content;
        var x=[];
        var y=[];
        var monthly = echarts.init(document.getElementById("monthly"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminOrderMonthly.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                content.sort(up);
                for(var i=0;i<content.length;i++){
                    x.push(content[i]['s']);
                    y.push(content[i]['l']);
                }

            }
        });
        var option = {
            title : {
                text: '本年度网站分月订单数统计'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['订单数']
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
                        formatter: '{value}'
                    }
                }
            ],
            series : [
                {
                    name:'订单数',
                    type:'line',
                    data:y,
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
                }
            ]
        };
        monthly.setOption(option);
    }
    function getDaily() {
        var content;
        var x=[];
        var y=[];
        var daily = echarts.init(document.getElementById("daily"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminOrderDaily.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                content.sort(up);
                for(var i=0;i<content.length;i++){
                    x.push(content[i]['s']);
                    y.push(content[i]['l']);
                }

            }
        });
        var option = {
            title : {
                text: '本月网站分日订单数统计'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['订单数']
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
                        formatter: '{value}'
                    }
                }
            ],
            series : [
                {
                    name:'订单数',
                    type:'line',
                    data:y,
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
            url: 'getAdminAreaOrder.action',
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
                text: '全国订单数分布'
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
                max: 10,
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
                    name: '全国订单数分布',
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

    function up(a,b) {
        if(a['s'].length-b['s'].length!=0){
            return a['s'].length-b['s'].length;
        }
        return a['s']>b['s'];
    }

</script>
</html>
