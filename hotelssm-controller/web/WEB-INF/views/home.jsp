<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <script src="/static/js/jquery-3.3.1.min.js"></script>

</head>
<body>
<section id="container" class="">
    <header class="header white-bg">
        <a href="#" class="logo">酒店 <span>管理</span></a>
    </header>

    <div id="sidebar" class="nav-collapse">
        <ul class="sidebar-menu">
            <li class="active">
                <a class="" href="/home">
                    <span>首页</span>
                </a>
            </li>
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
</section>
<section id="main-content">
    <section class="wrapper">
        <h1>我是首页</h1>
    </section>
</section>
<input type="hidden" id="userId" value="${user.id }">
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/common-scripts.js"></script>
<script type="text/javascript" src="/static/js/menu.js"></script>
</body>
</html>
