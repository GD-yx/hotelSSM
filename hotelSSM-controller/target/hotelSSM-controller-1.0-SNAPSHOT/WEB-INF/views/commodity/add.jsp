<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/4
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品新增</title>
</head>
<body>
<form action="/commodity/insert" method="post">
    商品编号：<input type="text" name="cid"/><br/>
    商品名称：<input type="text" name="cname"/><br/>
    商品类型：
    <select name="coid">
        <c:forEach items="${commoditytypes.list}" var="c">
            <option value="${c.coid}" selected>${c.cotype}</option>
        </c:forEach>
    </select>
    计量单位：
    <select name="cunit">
        <option value="瓶" selected>瓶</option>
        <option value="包" selected>包</option>
        <option value="盒" selected>盒</option>
        <option value="根" selected>根</option>
        <option value="打" selected>打</option>
    </select>
    商品价格：<input type="text" name="cprice"/><br/>
    <input type="submit" value="添加"/><br/>
</form>
</body>
</html>
