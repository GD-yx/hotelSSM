<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/3
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间新增</title>
</head>
<body>
<form action="/room/insert" method="post">
    <input type="text" name="roomid"/><br/>
    <c:forEach items="${roomtypes.list}" var="t">
        <select name="rtype">
            <option value="${t.rtid}" selected>${t.rtname}</option>
        </select>
    </c:forEach>

    <input type="text" name="status"/><br/>
    <input type="text" name="rprice"/><br/>
    <input type="text" name="remark"/><br/>
    <input type="submit" value="添加"/><br/>
</form>
</body>
</html>
