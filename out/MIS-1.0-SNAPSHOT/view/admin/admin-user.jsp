<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>客户统计</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../css/index.css">
    <script type="text/javascript" src="../../js/jquery-3.2.1.min.js"></script>
    <%--<script type="text/javascript" src="../../js/admin.js"></script>--%>
</head>
<body onload="init()">
<header>
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
    <div class="user-content">
        <div class="content">
            <div id="total" class="tip">
                现有注册用户数：？ 平均每位客户带来营业额：？元。
            </div>
            <div id="to-month" class="tip">
                本月注册会员数：，占会员总数%
            </div>
            <div id="active" class="tip">
                本月活跃用户数：
            </div>
            <div class="tip">客户注册数统计</div>
            <div id="register-content" class="graph-back"></div>
            <div class="tip">活跃用户数统计</div>
            <div id="active-content" class="graph-back"></div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function setTips() {
        var content;
        $.ajax({
            cache: false,
            async: false,
            url: 'getAdminUserTips.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);
                document.getElementById("total").innerHTML="现有注册用户数："+content[0]+"  。 平均每位客户带来营业额："+ content[1]+" 元。";
                document.getElementById("to-month").innerHTML="本月注册会员数："+content[2]+" 。 占会员总数： "+content[3] +"% 。";
                document.getElementById("active").innerHTML="本月活跃会员数："+ content[4]+" 。";
            }
        });
    }
    function setRegisterContent() {
        var register = document.getElementById("register-content");
        var content;
        var x=[];
        $.ajax({
            cache: false,
            async: false,
            url: 'getRegisterGraph.action',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                content = JSON.parse(data);

            }
        });
        //指定图表的配置项和数据
        var option = {
            title:{
                text:'每月注册客户数量变化统计图'
            },
            //提示框组件
            tooltip:{
                //坐标轴触发，主要用于柱状图，折线图等
                trigger:'axis'
            },
            //图例
            legend:{
                data:['月注册客户数']
            },
            //横轴
            xAxis:{
                show:false,
                type: 'category',
                data: content['s']
            },
            //纵轴
            yAxis:{},
            //系列列表。每个系列通过type决定自己的图表类型
            series:[{
                name:'注册数',
                //折线图
                type:'line',
                data:content['l']
            }]
        };
        register.setOption(option);
    }
    function setActiveContent() {
        var active = document.getElementById("active-content");
    }
    function init() {
        setTips();
        setRegisterContent();
        setActiveContent();
    }
</script>
</body>
</html>
