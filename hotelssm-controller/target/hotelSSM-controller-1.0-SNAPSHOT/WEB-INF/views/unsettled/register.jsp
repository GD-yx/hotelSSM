<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/17
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>旅客登记</title>
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
        <div>
            <a href="/home">返回首页</a>
            <a href="#" class="fh">返回</a>
        </div>
    </div>
    <!-- 第二行 -->
    <div class="row clearfix">

        <div class="col-md-9 column">
            <div class="col-md-10 column" id="content">
                <form method="post" action="/unsettled/registration">
                    <input type="text" name="id" value="${unsetteld.id}" hidden="hidden"/><br/><br/>
                    房间号：
                    <input type="text" name="roomid"  value="${unsetteld.roomid}"/>&nbsp;&nbsp;
                    支付方式：
                    <select name="pay">
                        <option value="现金">现金</option>
                        <option value="微信">微信</option>
                        <option value="支付宝">支付宝</option>
                        <option value="信用卡">信用卡</option>
                    </select><br/><br/>
                    姓名：
                    <input type="text" name="name" value="${unsetteld.name}"/>&nbsp;&nbsp;
                    性别：
                    <select name="gender">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select><br/><br/>
                    联系方式：
                    <input type="text" name="phonenumber"/>&nbsp;&nbsp;
                    家庭地址：
                    <input type="text" name="address"/><br/><br/>
                    身份证：
                    <input type="text" name="idcard"/>&nbsp;&nbsp;
                    房费：
                    <input type="text" name="consume" value="${unsetteld.consume}"/><br/><br/>
                   <%-- 登记时间：
                    <input type="text" name="checkdate"/>&nbsp;&nbsp;--%>
                    <input type="text" name="roomtype" value="${unsetteld.roomtype}" hidden="hidden"/>
                    <input type="submit" value="保存"/>&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="取消"/>
                </form>
            </div>
        </div>

    </div>
    </div>
</body>
<script>
    $(function() {
        $(document).ajaxError(function () {
            alert("一个错误发生");
        });
        $(".fh").click(function () {
            //alert("返回");
            window.history.back(-1);
        })
    })
</script>
</html>
