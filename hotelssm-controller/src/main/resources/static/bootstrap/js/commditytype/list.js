var vm = new Vue({
    el:"#app",
    data:{
        message:"dd",
        pageInfo:[],
        page:1,
        coid:null,
        cotype:null
    },
    mounted:function() {
        $.post('/commoditytype/list',{pageNum:1},function (data) {
            vm.pageInfo = data.data;
        },"json");

    },
    methods:{

        searchName:function () {
            var type = $("#inputSearchExample3").val();
            $.post('/commoditytype/search',{cotype:type},function (data) {
                vm.pageInfo = data.data;
            },"json");
        },
        delete:function (coid) {
            if(confirm("是否删除?")){
                alert("删除了" + coid);
            }
        },
        add:function () {
            $("#myModal").data("op","insert");
            $("#myModalLabel").text("商品类型管理---添加类型")
            //vm.coid = null;
            vm.cotype = null;
            $("#myModal").modal('show');
        },
        update:function (data) {
            $("#myModal").data("op","update");
            vm.coid = data.coid;
            vm.cotype = data.cotype;
            $("#myModalLabel").text("商品类型管理---修改类型")
            $("#myModal").modal('show');
        },
        save:function () {
            var op = $("#myModal").data("op");
            if(op != "update"){
                var obj = {
                    cotype: vm.cotype,
                }
                $.ajax({
                    url:"/commoditytype/insert",
                    dataType:"json",
                    type:"post",
                    success:function (data) {
                        if(data.code = "200"){
                            alert(data.message);
                            $("#myModal").modal('hide');
                        }else {
                            alert(data.message);
                        }
                    }
                })
            }else {
                var obj = {
                    coid:vm.coid,
                    cotype:vm.cotype,
                }
                $.ajax({
                    url: "/commoditytype/update",
                    dataType: "json",
                    type: "post",
                    data: obj,
                    success:function (data) {
                        if (data.code = "200") {
                            alert(data.message)
                            $("#myModal").modal('hide');
                        } else {
                            alert(data.message)
                        }
                    }
                })
            }
        }
    },
    watch:{
        page:function () {
            $.get('/commoditytype/list',{pageNum:vm.page},function (data) {
                vm.pageInfo = data.data;
            },"json");
        }
    }


})