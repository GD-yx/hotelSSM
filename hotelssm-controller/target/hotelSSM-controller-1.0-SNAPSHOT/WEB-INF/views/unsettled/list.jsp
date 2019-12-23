<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/16
  Time: 15:20
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
                <li> <i class="icon icon-archive"></i>财务管理
                    <a href="/consume/index"><i class="icon icon-archive"></i>顾客消费记录</a>
                    <a href="#"><i class="icon icon-archive"></i>财务统计</a>
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
                <div>
                    <select id="selected" name=" ">
                        <option value="已结账" selected>已结账</option>
                        <option value="未结账" selected>未结账</option>
                    </select>
                    <a href="/unsettled/addroom"><button href="#" class="btn-info add">安排房间</button></a>
                </div>
            <div class="col-md-10 column" id="content">
                <table class="table table-bordered table-hover" style="width: 1000px" text-align="center">
                    <thead>
                    <tr>
                        <th>房间号</th>
                        <th>房间类型</th>
                        <th>姓名</th>
                        <th>入住时间</th>
                        <th>总费用</th>
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


<!-- 模态框（Modal）结账 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">

                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">


                    <div class="form-group">
                        <label for="id" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" name="id" v-model = "id"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roomid" class="col-sm-2 control-label">房间号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roomid" name="roomid" v-model = "roomid"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roomtype" class="col-sm-2 control-label">房间类型</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roomtype" name="roomtype" v-model = "roomtype"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">旅客姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name" v-model = "name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="checkdate" class="col-sm-2 control-label">入住日期</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="checkdate" name="checkdate" v-model = "checkdate"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="settledtime" class="col-sm-2 control-label">结账时间</label>
                        <div class="col-sm-10">
                            <input type="text" name="settledtime" placeholder="请选择日期" class="form-control date-picker" data-dateformat="" id="settledtime" />
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rprice" class="col-sm-2 control-label">住宿费</label>
                        <div class="col-sm-10">
                            <input type="rprice" class="form-control" id="rprice" name="rprice" v-model = "idcard"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cprice" class="col-sm-2 control-label">其他消费</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="cprice" name="cprice" v-model = "cprice"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pay" class="col-sm-2 control-label">结账方式</label>
                        <div class="col-sm-10">
                            <select id="pay" name="pay">
                                <option value="现金">现金</option>
                                <option value="微信">微信</option>
                                <option value="支付宝">支付宝</option>
                                <option value="信用卡">信用卡</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="consume" class="col-sm-2 control-label">结账金额</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="consume" name="consume" v-model = "consume"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                            </button>
                            <button type="button" id="save" class="btn btn-default">结账</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
</body>
<%--<script src="/static/bootstrap/js/commoditytype/list.js"></script>--%>

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
                url:"/unsettled/list",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize},
                success:function (pageInfo) {
                    var unsettleds = "";
                    $.each(pageInfo.list,function (index,unsettled) {
                        unsettleds+="<tr>";
                        //unsettleds+="<td>"+unsettled.id+"</td>";
                        unsettleds+="<td>"+unsettled.roomid+"</td>";
                        unsettleds+="<td>"+unsettled.roomtype+"</td>";
                        unsettleds+="<td>"+unsettled.name+"</td>";
                        unsettleds+="<td>"+unsettled.checkdate+"</td>";
                        unsettleds+="<td>"+unsettled.consume+"</td>";
                        unsettleds+="<td><a href='/unsettled/register?id="+unsettled.id+"'><button class='update btn btn-info' >登记</button></a>&nbsp;&nbsp;&nbsp;";
                        unsettleds+="<a href='/unsettled/consume?id="+unsettled.id+"'><button class='insert btn btn-primary'  >消费</button></a>&nbsp;&nbsp;&nbsp;";
                        unsettleds+="<button id="+unsettled.id+" name="+unsettled.name+" roomid="+unsettled.roomid+" " +
                            "roomtype="+unsettled.roomtype+" checkdate="+unsettled.checkdate+" consume="+unsettled.consume+" " +
                            "class='delete btn btn-danger' >结账</button></td>";
                        unsettleds+="</tr>";

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
                    $("#tbody").html(unsettleds);

                    //结账
                    $(".delete").on('click',function () {
                        $("#myModal").modal('show');
                        $("#save").data("op","delete");
                        //$("#id").prop("disabled","disabled");
                        $("#id").val($(this).attr("id"));
                        $("#roomid").val($(this).attr("roomid"));
                        $("#name").val($(this).attr("name"));
                        $("#roomtype").val($(this).attr("roomtype"));
                        $("#checkdate").val($(this).attr("checkdate"));
                       $("#settledtime").val();
                        $("#consume").val($(this).attr("consume"));
                        $("#rprice").val("");
                        $("#cprice").val("");
                    });

                    $("#save").click(function(){
                        var op = $("#save").data("op");
                        if(op != "delete"){
                            return;
                        }
                        $("#myModal").modal('hide');
                        var obj = {id:$("#id").val(),name:$("#name").val(),roomid:$("#roomid").val(),
                            checkdate:$("#checkdate").val(),consume:$("#consume").val(),roomtype:$("#roomtype").val()};
                        console.log(obj);
                        $.post("/unsettled/delete",obj,function(){
                            $("tbody").empty();
                            getAll(1,pageSize);
                        });
                    });

                    $(".insert").on('click',function () {
                        $.post("/unsettled/consume");
                    })

                }
            })
        }

        function getAll2(pageNum,pageSize){
            $.ajax({
                url:"/settled/list",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize},
                success:function (pageInfo) {
                    var settleds = "";
                    $.each(pageInfo.list,function (index,settled) {
                        settleds+="<tr>";
                        //settleds+="<td>"+settled.id+"</td>";
                        settleds+="<td>"+settled.roomid+"</td>";
                        settleds+="<td>"+settled.roomtype+"</td>";
                        settleds+="<td>"+settled.name+"</td>";
                        settleds+="<td>"+settled.checkdate+"</td>";
                        settleds+="<td>"+settled.consume+"</td>";
                        settleds+="<td><button  id="+settled.id+"  class='delete btn btn-danger' >删除</button>";
                        settleds+="</tr>";

                    })//settleds

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
                        getAll2($(this).data("value"),pageSize);
                    })
                    page=pageInfo;
                    $("#tbody").html(settleds);

                    //删除
                    $(".delete").on('click',function () {
                        if(confirm("确定删除？")){
                            $.post("/settled/delete",{id:$(this).attr("id")},function(){
                                $("tbody").empty();
                                getAll2(1,pageSize);
                            });
                        }
                    });

                }
            })
        }

        getWho();

       function getWho(){
           getAll(1,pageSize);
           var sel=document.getElementById("selected");
           sel.onchange=function(){
               var valu = sel.options[sel.selectedIndex].value;
               if(valu != "未结账"){
                   getAll2(1,pageSize);
               }
               else {
                   getAll(1,pageSize);
               }

           }

       }

    });



</script>
</html>

