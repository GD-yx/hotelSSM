<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/17
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>住宿管理</title>
    <script src="/static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script src="/static/bootstrap/js/vue.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div class="container" id="app">
    <!-- 第一行 -->
    <div class="row clearfix">
        <div class="col-md-4 column">
            <h1>后台管理</h1>
        </div>
        <div class="col-md-8 column">
            <h1 class="pull-right username">当前用户：${username}</h1>
        </div>

    </div>
    <!-- 第二行 -->
    <div class="row clearfix">
        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <li> <i class="icon icon-archive"></i>商品
                    <a href="/commodity/index"><i class="icon icon-archive"></i>商品管理</a>
                    <a href="/commoditytype/index"><i class="icon icon-archive"></i>类型管理</a>
                </li>
                <li> <i class="icon icon-archive"></i>房间
                    <a href="/room/index"><i class="icon icon-archive"></i>房间管理</a>
                    <a href="/roomtype/index"><i class="icon icon-archive"></i>类型管理</a>
                </li>
                <li> <i class="icon icon-archive"></i>员工
                    <a href="/employee/index"><i class="icon icon-archive"></i>员工管理</a>
                    <a href="#"><i class="icon icon-archive"></i>权限管理</a>
                </li>
                <li> <i class="icon icon-archive"></i>客户
                    <a href="/unsettled/index"><i class="icon icon-archive"></i>入住信息</a>
                    <a href="/customer/index"><i class="icon icon-archive"></i>客户信息</a>
                </li>
            </ul>
        </div>
        <div class="col-md-9 column" style="border:2px solid white;margin-top: 5px;margin-top: 10px;width: 750px;height:700px">
            <div class="col-md-10 column" id="content">
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<h1>安排房间</h1>
                <form method="post" action="/unsettled/insertroom">
                    房间号：&nbsp;
                    <input type="text" class="roomid" name="roomid"/>&nbsp;&nbsp;
                    房间类型：
                    <input type="text" class="roomtype" name="roomtype"/><br/><br/>

                    <input type="button" name="name" hidden="hidden"/>
                    房价：&nbsp;&nbsp;&nbsp;
                    <input type="text" class="consume" name="consume"/>&nbsp;&nbsp;
                    登记时间：
                    <input type="text" name="checkdate"/><br/><br/>
                    住店天数：
                    <input type="text" name="day"/>&nbsp;&nbsp;
                    支付方式：
                    <select name="pay">
                        <option value="现金">现金</option>
                        <option value="微信">微信</option>
                        <option value="支付宝">支付宝</option>
                        <option value="信用卡">信用卡</option>
                    </select><br/><br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保存"/>&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取消"/>
                </form>
            </div>

            <div class="col-md-10 column" id="roomshow" style="width: 600px;height:350px;border:2px solid blanchedalmond" >
                <c:forEach items="${rooms}" var="r">
                    <div class="divroom" id="divroom" style="float: left;width: 100px; height: 90px;
                border: 2px solid beige;text-align: center;
                margin-left: 5px;margin-top: 5px" >
                        <li style="list-style: none">${r.roomid}</li>
                        <li style="list-style: none">${r.rtname}</li>
                        <li style="list-style: none">${r.status}</li>
                        <li style="list-style: none">${r.rprice}</li>
                    </div>
                </c:forEach>
            </div>
        </div>



    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $(".divroom").click(function () {
            var status = $(this).find("li").eq(2).text();
            if(status == "空房"){
                $(".roomid").val($(this).find("li").eq(0).text());
                $(".roomtype").val($(this).find("li").eq(1).text());
                $(".consume").val($(this).find("li").eq(3).text());
            }
            else {
                alert("不是空房不能安排哦!");
                $(".roomid").val("");
                $(".roomtype").val("");
                $(".consume").val("");
            }

        })

    })
</script>
</html>