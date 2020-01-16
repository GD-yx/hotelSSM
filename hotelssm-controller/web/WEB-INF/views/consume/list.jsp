<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/19
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>顾客消费记录表</title>
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
            <h1></h1>
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
            <%--搜索--%>
            <%-- <div class="input-group" style="margin-bottom: 20px">
                 <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example"
                      id="searchboxExample">
                     <input id="inputSearchExample3" type="search" style="width: 200px;"
                            class="form-control search-input" placeholder="按名字搜索">
                     <label for="inputSearchExample3" class="input-control-icon-left search-icon"
                            style="top: 8px;"><i class="icon icon-search"></i></label>
                     <span class="input-group-btn">
                                     <button class="btn btn-primary" type="button" @click="searchName()">搜索</button>
                             </span>
                 </div>
             </div>--%>
            <%--显示--%>
            <div class="col-md-10 column" id="content">
                <table class="table table-bordered table-hover" style="width: 1000px" text-align="center">
                    <thead>
                    <tr>
                        <th>房间号</th>
                        <th>姓名</th>
                        <th>消费商品</th>
                        <th>计量单位</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>消费金额</th>
                        <th>消费时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">

                    </tbody>
                </table>
                <a class="pageNumber" id="first"  href="#" >首页</a>
                <a class="pageNumber" id="prev" href="#">上一页</a>
                <a class="pageNumber" id="next"href="#">下一页</a>
                <a class="pageNumber" id="last" href="#">尾页</a>

                <ul id="navigatepageNums">

                </ul>
            </div>
        </div>

    </div>
</div>
</body>
<script type="text/javascript">
    $(function(){
        $(document).ajaxError(function(){
            alert("一个错误发生");
        });


        var page = {};
        var pageSize=4;
        //查询所有
        function getAll(pageNum,pageSize){
            $.ajax({
                url:"/consume/list",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize},
                success:function (pageInfo) {
                    var consumes = "";
                    $.each(pageInfo.list,function (index,consume) {
                        consumes+="<tr>";
                        //consumes+="<td>"+consume.id+"</td>";
                        consumes+="<td>"+consume.roomid+"</td>";
                        consumes+="<td>"+consume.name+"</td>";
                        consumes+="<td>"+consume.cname+"</td>";
                        consumes+="<td>"+consume.cunit+"</td>";
                        consumes+="<td>"+consume.cprice+"</td>";
                        consumes+="<td>"+consume.number+"</td>";
                        consumes+="<td>"+consume.money+"</td>";
                        consumes+="<td>"+consume.consumedate+"</td>";
                        consumes+="<td><button id='"+consume.id+"' class='delete btn btn-info' >删除</button>";
                        consumes+="</tr>";

                    })//unsettleds

                    //分页
                    $("#navigatepageNums").empty();
                    $.each(pageInfo.navigatepageNums,function (index,num) {
                        var pageNumbers=$("<li class='pageNumber'>"+num+"</li>");
                        pageNumbers.appendTo("#navigatepageNums");
                        pageNumbers.data("value",num);
                    })//number
                    $("#first").data("value",1);
                    $("#prev").data("value",pageInfo.prePage);
                    $("#next").data("value",pageInfo.nextPage);
                    $("#last").data("value",pageInfo.pages);

                    //页码
                    $(".pageNumber").on("click",function () {
                        getAll($(this).data("value"),pageSize);
                    })
                    page=pageInfo;
                    $("#tbody").html(consumes);

                    //删除
                    $(".delete").on('click',function (e) {
                        e.preventDefault();
                        if(confirm("确定删除？")){
                            $.post("/consume/delete",{id:$(this).attr("id")},function(){
                                $("tbody").empty();
                                getAll(1,pageSize);
                            });
                        }
                    })

                }
            })
        }

        getAll(1,pageSize);

    });
</script>
</html>


