<%--
  Created by IntelliJ IDEA.
  User: 南八
  Date: 2019/12/17
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>旅客消费</title>
    <script src="/static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script src="/static/bootstrap/js/vue.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<style>
    .modal-body table{
        width: 500px;
        height: 200px;
        text-align: center;
        border-right:1px solid ;border-bottom:1px solid
    }
    .modal-body table td,th{
        text-align: center;
        border-left:1px solid ;border-top:1px solid
    }
    .modal-body table td input{
        width: 100px;
    }
</style>
<body>

<div class="container" id="app">
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
                <div style="margin-top: 20px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>旅客消费</h1>
                    房间号：<label>${unsettled.roomid}</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    旅客姓名：<label>${unsettled.name}</label><br/><br/>
                    <button href="#" class="btn-info add">添加消费</button>
                    <button href="#" class="btn-info fh">返回</button>
                </div>
                <table class="table table-bordered table-hover" style="width: 1000px" text-align="center">
                    <thead>
                    <tr>
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


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 style="margin-left: 200px" class="modal-title" id="myModalLabel">添加消费</h4>

            </div>
            <div class="modal-body">
               <h4 ></h4>
                <form class="form-horizontal" role="form">
                    <%--<input type="text"  class="id" id="id" name="id" />--%>
                <table class="smalltable">

                    <thead>
                    <tr>
                        <th>商品名称</th>
                        <th>商品类别</th>
                        <th>计量单位</th>
                        <th>销售价格</th>
                        <th>数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="modeltabletbody">

                    </tbody>
                </table>
                </form>
                <a class="pageNumber2" id="first2"  href="#" >首页</a>
                <a class="pageNumber2" id="prev2" href="#">上一页</a>
                <a class="pageNumber2" id="next2"href="#">下一页</a>
                <a class="pageNumber2" id="last2" href="#">尾页</a>

                <ul id="navigatepageNums2">

                </ul>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        $(document).ajaxError(function(){
            alert("一个错误发生");
        });


        var page = {};
        var pageSize=4;
        var roomid = "${unsettled.roomid}";
        var name = "${unsettled.name}";
        var unsettledid = "${unsettled.id}";

        alert(roomid+"啦啦啦啦啦"+name+"adfa"+unsettledid);

        //按房间号查询该顾客所有的消费
        function getAll2(pageNum,pageSize,roomid){
            $.ajax({
                url:"/consume/getByRoomId",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize,"roomid":roomid},
                success:function (pageInfo) {
                    var consumes = "";
                    $.each(pageInfo.list,function (index,consume) {
                        consumes+="<tr>";
                        //consumes+="<td>"+consume.id+"</td>";
                        //consumes+="<td>"+consume.roomid+"</td>";
                        //consumes+="<td>"+consume.name+"</td>";
                        consumes+="<td>"+consume.cname+"</td>";
                        consumes+="<td>"+consume.cunit+"</td>";
                        consumes+="<td>"+consume.cprice+"</td>";
                        consumes+="<td>"+consume.number+"</td>";
                        consumes+="<td>"+consume.money+"</td>";
                        consumes+="<td>"+consume.consumedate+"</td>";
                        consumes+="<td><button  id="+consume.id+"  class='delete btn btn-danger' >删除</button>";
                        //consumes+="<a href='/unsettled/index2?id="+consume.id+"'><button id="+consume.id+" money1="+consume.money+"  class='money btn btn-danger' >money</button></a></td>";
                        consumes+="</tr>";

                    })//consumes

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
                                getAll2(1,pageSize,roomid);
                            });
                        }
                    })

                    //删除
                    $(".money").click(function () {
                        var money1 =  $(this).attr("money1");
                        alert(money1);
                    })


                }
            })

        }
        //getAll2(1,pageSize,roomid);



        //按顾客姓名查询该顾客所有的消费
        function getAllByName(pageNum,pageSize,name){
            $.ajax({
                url:"/consume/getByName",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize,"name":name},
                success:function (pageInfo) {
                    var consumes = "";
                    $.each(pageInfo.list,function (index,consume) {
                        consumes+="<tr>";
                        //consumes+="<td>"+consume.id+"</td>";
                        //consumes+="<td>"+consume.roomid+"</td>";
                        //consumes+="<td>"+consume.name+"</td>";
                        consumes+="<td>"+consume.cname+"</td>";
                        consumes+="<td>"+consume.cunit+"</td>";
                        consumes+="<td>"+consume.cprice+"</td>";
                        consumes+="<td>"+consume.number+"</td>";
                        consumes+="<td>"+consume.money+"</td>";
                        consumes+="<td>"+consume.consumedate+"</td>";
                        consumes+="<td><button  id="+consume.id+"  class='delete btn btn-danger' >删除</button>";
                        consumes+="</tr>";

                    })//consumes

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
                                getAll2(1,pageSize,name);
                            });
                        }
                    })
                }
            })

        }
        getAllByName(1,pageSize,name);






        //模态框里查询所有商品
        function getAll(pageNum,pageSize){
            $.ajax({
                url:"/commodity/list",
                type:"post",
                dataType:"json",
                data:{"pageNum":pageNum,"pageSize":pageSize},
                success:function (pageInfo) {
                    var commodities = "";
                    $.each(pageInfo.list,function (index,commodity) {
                        commodities+="<tr>";
                        commodities+="<td>"+commodity.cname+"</td>";
                        commodities+="<td>"+commodity.cotype+"</td>";
                        commodities+="<td>"+commodity.cunit+"</td>";
                        commodities+="<td>"+commodity.cprice+"</td>";
                        commodities+="<td><input type='text' name='number' class='number' id='number'/></td>";
                        commodities+="<td><button  roomid="+roomid+" name="+name+" " +
                        "cname="+commodity.cname+" cunit="+commodity.cunit+" cprice="+commodity.cprice+" class='yes btn btn-info' >确定</button></td>";
                        commodities+="</tr>";

                })//commodity

                    //分页
                    $("#navigatepageNums2").empty();
                    $.each(pageInfo.navigatepageNums,function (index,num) {
                        var pageNumbers=$("<li class='pageNumber2'>"+num+"</li>");
                        pageNumbers.appendTo("#navigatepageNums2");
                        pageNumbers.data("value",num);
                    })//number
                    $("#first2").data("value",1);
                    $("#prev2").data("value",pageInfo.prePage);
                    $("#next2").data("value",pageInfo.nextPage);
                    $("#last2").data("value",pageInfo.pages);

                    //页码
                    $(".pageNumber2").on("click",function () {
                        getAll($(this).data("value"),pageSize);
                    })
                    page=pageInfo;
                    $("#modeltabletbody").html(commodities);

                    //
                   $(".yes").click(function () {
                       //获得数量框里面的数字
                       var consumeroomid = $(this).attr("roomid");
                       var consumename = $(this).attr("name");
                       var consumecname = $(this).attr("cname");
                       var consumecunit = $(this).attr("cunit");
                       var consumecprice = $(this).attr("cprice");
                       var consumenumber = $(this).parent().parent().find(".number").val();
                       var money = consumecprice * consumenumber;
                       alert(unsettledid+"房间号："+consumeroomid+"  姓名："+consumename+"   商品名称："+consumecname+"   单位："+consumecunit+"   单价："+consumecprice+"   数量："+consumenumber+"   总计："+money);
                       $("#myModal").modal('hide');
                       var obj = {id:unsettledid,roomid:$(this).attr("roomid"),name:$(this).attr("name"),cname:$(this).attr("cname"),
                           cunit:$(this).attr("cunit"),cprice:$(this).attr("cprice"),number:$(this).parent().parent().find(".number").val(),
                           money:$(this).attr("cprice")*$(this).parent().parent().find(".number").val()};
                       console.log(obj);
                       $.post("/consume/insert",obj,function(){
                           $("#tbody").empty();
                           //getAll2(1,pageSize,roomid);
                           getAllByName(1,pageSize,name);
                           //window.location.href="/consume/getByName?name="+encodeURI(name);
                           //window.location.href="unsettled/consume.jsp?name="+name;
                       });
                   })

                }
            })

        }

        //添加
        $("#content").on("click",".add",function(){
            $("#myModal").modal('show');
            getAll(1,pageSize);
        });

       /* $("#content").on("click",".fh",function(){
            alert(money);
        });*/

    });

</script>
</body>
</html>
