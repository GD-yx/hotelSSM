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

    </div>
    <!-- 第二行 -->
    <div class="row clearfix">
        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <li class="sub-menu  conceal">
                    <a class="" href="#">
                        <span>商品管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class=" conceal">
                            <a href="/commodity/index">商品信息</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="/commoditytype/index">类型管理</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>房间管理</span> <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class=" conceal">
                            <a class="" href="/room/index">房间信息</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="/roomtype/index">类型管理</a>
                        </li>

                    </ul>
                </li>

                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>员工管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class="conceal">
                            <a class="" href="/employee/index">员工信息</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="#">权限管理</a>
                        </li>
                    </ul>
                </li>

                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>客户管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class="conceal">
                            <a class="" href="/unsettled/index">入住信息</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="/customer/index">客户信息</a>
                        </li>
                    </ul>
                </li>

                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>财务管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class="conceal">
                            <a class="" href="/consume/index">顾客消费记录</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="#">财务统计</a>
                        </li>
                    </ul>
                </li>

                <li class="sub-menu conceal">
                    <a href="javascript:;" class="">
                        <span>基础资料管理</span><span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class="conceal">
                            <a class="" href="/admin/user/list">用户管理</a>
                        </li>
                        <li class="conceal">
                            <a class="" href="/admin/role/list">角色管理</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
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
</html>
