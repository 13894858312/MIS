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
    <title>用户统计</title>
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
        <%--<a href="user-order-list.action">订单列表</a>--%>
    <%--</div>--%>
    <%--<div class="head-item">--%>
        <%--<a href="user-order.action">订单-消费额统计</a>--%>
    <%--</div>--%>
    <%--<div class="head-item">--%>
        <%--<a href="user-turnover.action">消费额统计</a>--%>
    <%--</div>--%>
    <div class="head-item">
        <a href="ulogout.action">注销</a>
    </div>
</header>

<div class="main-page">
    <div class="content">
        <div id="all" class="graph-back"></div>
    </div>

    <div class="content">
        <div id="state" class="graph-back"></div>
    </div>

    <div class="content">
        <div id="area" class="graph-back"></div>
    </div>
    <div class="content">
        <div id="section" class="graph-back"></div>
    </div>
</div>
</body>


<script type="text/javascript">
    function init() {
        getAll();
        getState();
        getArea();
        getSection();
    }

    function getAll() {
        var o;
        var t;
        var x =[];
        var y1=[];
        var y2=[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getUserOrder.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                o = JSON.parse(data);
                for(var i=0;i<o.length;i++){
                    x.push(o[i]['s']);
                    y1.push(o[i]['l']);
                }
            }
        });
        $.ajax({
            cache: false,
            async: false,
            url: 'getUserTurnover.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                t = JSON.parse(data);
                for(var i=0;i<o.length;i++){
                    y2.push(t[i]['l']);
                }
            }
        });
        var option = {
            title : {
                text: '本年订单数及消费额统计'
            },
            tooltip : {
                trigger: 'axis'
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            legend: {
                data:['订单数','消费额']
            },
            xAxis : [
                {
                    type : 'category',
                    data : x
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    name : '订单数',
                    axisLabel : {
                        formatter: '{value} 笔'
                    }
                },
                {
                    type : 'value',
                    name : '消费额',
                    axisLabel : {
                        formatter: '{value} 元'
                    }
                }
            ],
            series : [

                {
                    name:'订单数',
                    type:'line',
                    data:y1
                },
                {
                    name:'消费额',
                    type:'bar',
                    yAxisIndex: 1,
                    data:y2
                }
            ]
        };

        var all= echarts.init(document.getElementById("all"));
        all.setOption(option);
    }

    function getState() {
        var content;
        $.ajax({
            cache: false,
            async: false,
            url: 'getUserState.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
            }
        });
        var option = {
            title : {
                text: '各订单状态占比',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient : 'vertical',
                x : 'left',
                data:['已完成','未完成','已取消','已评价']
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
                    name:'订单状态',
                    type:'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:content[0], name:'已完成'},
                        {value:content[1], name:'未完成'},
                        {value:content[2], name:'已取消'},
                        {value:content[3], name:'已评价'}
                    ]
                }
            ]
        };
        var state = echarts.init(document.getElementById("state"));
        state.setOption(option);
    }

    function getArea(){
        var content;
        var temp=[];
        var area = echarts.init(document.getElementById("area"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getUserArea.action',
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
                text: '订单分布'
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
                max: 5,
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
                    name: '订单分布',
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

    function up(a,b) {
        return a['s'] - b['s'];
    }
    function getSection() {
        var content;
        var x=[];
        var y=[];
        var section = echarts.init(document.getElementById("section"));
        $.ajax({
            cache: false,
            async: false,
            url: 'getUserSection.action',
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
            title: {
                x: 'center',
                text: '单笔订单销售额区间统计'
            },
            tooltip: {
                trigger: 'item'
            },
            toolbox: {
                show: true,
                feature: {
                    dataView: {show: true, readOnly: false},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            grid: {
                borderWidth: 0,
                y: 80,
                y2: 60
            },
            xAxis: [
                {
                    type: 'category',
                    show: false,
                    data: x
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    show: false
                }
            ],
            series: [
                {
                    name: '单笔订单销售额区间统计',
                    type: 'bar',
                    itemStyle: {
                        normal: {
                            color: function(params) {
                                // build a color map as your need.
                                var colorList = [
                                    '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                    '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                    '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                ];
                                return colorList[params.dataIndex]
                            },
                            label: {
                                show: true,
                                position: 'top',
                                formatter: '{b}\n{c}'
                            }
                        }
                    },
                    data: y
                }
            ]
        };
        section.setOption(option);
    }
</script>
</html>
