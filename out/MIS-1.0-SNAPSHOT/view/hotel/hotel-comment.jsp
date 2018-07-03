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
    <div class="comment-content">

        <div class="content">
            <div id="percent" class="graph-back"></div>
        </div>
        <div class="content">
            <div id="comment" class="graph-back"></div>
        </div>
        <div class="content">
            <div id="change" class="graph-back"></div>
        </div>

    </div>
</div>
</body>

<script type="text/javascript">
    function init() {
        getPercent();
        getComment();
        getChange();
    }

    function getPercent() {
        var content;
        $.ajax({
            cache: false,
            async: false,
            url: 'getToMonthComment.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
            }
        });
        var option = {
            title : {
                text: '本月客户评分数量',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient : 'vertical',
                x : 'left',
                data: ['1','2','3','4','5']
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
                    name:'房间类型',
                    type:'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:content[0], name:'1'},
                        {value:content[1], name:'2'},
                        {value:content[2], name:'3'},
                        {value:content[3], name:'4'},
                        {value:content[4], name:'5'}
                    ]
                }
            ]
        };
        var percent = echarts.init(document.getElementById("percent"));
        percent.setOption(option);
    }

    function getComment(){
        var content;
        var x=[];
        var y=[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getHotelComment.action',
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
                text:'本年度客户平均评分统计图'
            },
            tooltip:{
                trigger:'axis'
            },
            legend:{
                data:['月平均评分']
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
                name:'月平均评分',
                type:'line',
                data:y
            }]
        };
        var comment = echarts.init(document.getElementById("comment"));
        comment.setOption(option);
    }

    function getChange() {
        var content;
        var x=[];
        var y=[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getHotelCommentChange.action',
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
                text:'本年度各月平均评分变化率统计图（本月/上月平均评分）'
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
