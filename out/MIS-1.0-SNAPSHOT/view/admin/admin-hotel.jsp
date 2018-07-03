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
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../css/index.css">
    <script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../js/echarts.js"></script>
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
    <div class="hotel-content">
        <div class = "content">
            <div id="order" class="graph-back"></div>
        </div>
        <div class="content">
            <div id="turnover" class="graph-back"></div>
        </div>
        <div class="content">
            <div id="percent" class="graph-back"></div>
        </div>

    </div>
</div>
</body>


<script type="text/javascript">
    function init() {
        drawOrder();
        drawPercent();
        drawTurnover();
    }
    function drawOrder() {
        var content;
        var x=[];
        var y=[];
        var order = echarts.init(document.getElementById("order"));
        $.ajax({
        cache: false,
        async: false,
        url: 'getAdminTopOrder.action',
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
                text: '当月酒店订单数排行'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['月酒店订单数']
            },
            calculable : true,
            xAxis : [
                {
                    type : 'value'
                }
            ],
            yAxis :
                {
                    type : 'category',
                    data : x
                }
            ,
            series :
                {
                    name:'订单数',
                    type:'bar',
                    data:y
                }

        };
        order.setOption(option);
    }
    function drawTurnover() {
        var content;
        var x=[];
        var y=[];
        var turnover = echarts.init(document.getElementById("turnover"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminTopTurnover.action',
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
                text: '当月酒店销售额排行'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['月酒店销售额']
            },
            calculable : true,
            xAxis : [
                {
                    type : 'value'
                }
            ],
            yAxis :
                {
                    type : 'category',
                    data : x
                }
            ,
            series :
                {
                    name:'销售额',
                    type:'bar',
                    data: y
                }

        };
        turnover.setOption(option);
    }
    var content1;
    function up(a,b) {
        return a['l'] - b['l'];
    }
    function drawPercent() {
        var x=[];
        var y=[];
        var temp=[];
        var percent = echarts.init(document.getElementById("percent"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminTurnoverPercent.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content1 = JSON.parse(data);
                for(var i=0;i<content1.length;i++){
                    x.push(content1[i]['s']);
                    y.push(content1[i]['l']);
                    var j = {};
                    j.name=content1[i]['s'];
                    j.value=content1[i]['l'];
                    temp.push(j);
                }

            }
        });

        var option = {
            title : {
                text: '酒店销售额占网站总销售额比',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                x : 'center',
                y : 'bottom',
                data:x
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel']
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            series :
                {
                    name:'酒店销售额',
                    type:'pie',
                    radius : [20, 110],
                    center : ['25%', 200],
                    roseType : 'radius',
                    width: '40%',       // for funnel
                    max: 40,            // for funnel
                    itemStyle : {
                        normal : {
                            label : {
                                show : false
                            },
                            labelLine : {
                                show : false
                            }
                        },
                        emphasis : {
                            label : {
                                show : true
                            },
                            labelLine : {
                                show : true
                            }
                        }
                    },
                    data:temp
                }

        };
        percent.setOption(option);
    }

</script>
</html>
