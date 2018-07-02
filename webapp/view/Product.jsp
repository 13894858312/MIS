<%--
  Created by IntelliJ IDEA.
  User: wangxue
  Date: 2018/6/28
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--<title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--</body>--%>
<%--</html>--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增商品界面</title>
</head>
<body>
<h1>新增商品</h1>
<s:actionmessage/>
<s:form action="product_save" method="post" namespace="/" theme="simple">
    <table width="600px">
        <tr>
            <th>商品名称</th>
            <td><s:textfield name="pname"/></td>
            <td><font color="red"><s:fielderror fieldName="pname"/></font></td>
        </tr>
        <tr>
            <th>商品价格</th>
            <td><s:textfield name="price"/></td>
            <td><font color="red"><s:fielderror fieldName="price"/></font></td>
        </tr>
        <tr>
            <th colspan="2">
                <input type="submit" value="保存"/>
            </th>
            <th> </th>
        </tr>
    </table>
</s:form>
</body>
</html>