<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <script type="text/javascript" src="static/js/jquery-1.11.1-min.js"></script>
    <link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- addModal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName" placeholder="员工姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" id="email" class="form-control" placeholder="员工邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="男" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="empSaveBtn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- updateModal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="update_empName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" id="update_email" class="form-control" placeholder="员工邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="男"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="empUpdateBtn">更新</button>
            </div>
        </div>
    </div>
</div>



<%--搭建显示页面--%>
<div class="container">
    <%--    标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="col-md-2 btn btn-primary" id="empAddBtn">新增</button>
            <button class="col-md-2 btn btn-danger" id="empDeleteBtn">删除</button>
        </div>
    </div>
    <%--    显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="del_choices">
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="empBody">
                </tbody>
            </table>
        </div>
    </div>
    <%--    分页信息--%>
    <div class="row">
        <%--        分页文字信息--%>
        <div class="col-md-6" id="pageInfo">
        </div>
        <%--        分页条信息--%>
        <div class="col-md-6" id="pageNav">

        </div>
    </div>
</div>
</body>
</html>

<script type="text/javascript">

    var totalPages,currentPage;

    $(function (){
        //载入页面跳到第一页
        toPage(1);
    })

    function toPage(pn){
        $("#del_choices").prop("checked",false);
        $.ajax({
            url : "emps",
            data : {
                "pn" : pn
            },
            type : "get",
            success : function(data){
                //解析显示员工数据
                getEmpBody(data);
                //解析显示分页信息
                getPageInfo(data);
                //解析显示分页条
                getPageNav(data);
            }
        })
    }

    function getEmpBody(data){
        //首先将原来的数据清空
        $("#empBody").empty();
        var emps = data.extend.pageInfo.list;
        $.each(emps,function(i,n){
            var $empCheckBox = $("<td></td>").append($("<input type='checkbox' class='del_choice'>"));
            var $empId = $("<td></td>").append(n.empId);
            var $empName = $("<td></td>").append(n.empName);
            var $gender = $("<td></td>").append(n.gender);
            var $email = $("<td></td>").append(n.email);
            var $deptName = $("<td></td>").append(n.department.deptName);
            var $editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                            .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                            .append(" 编辑");
            //可以自定义属性
            $editBtn.attr("edit_id",n.empId);
            var $deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append(" 删除");
            $deleteBtn.attr("delete_id",n.empId);
            var $btn = $("<td></td>").append($editBtn).append($deleteBtn);
            $("<tr></tr>").append($empCheckBox).append($empId).append($empName).append($gender)
                          .append($email).append($deptName).append($btn).appendTo($("#empBody"));
        })
    }

    function getPageInfo(data){
        $("#pageInfo").empty();
        var pageInfo = data.extend.pageInfo;
        $("#pageInfo").append("当前 "+pageInfo.pageNum+"页,总 "+pageInfo.pages+"页,总 "+pageInfo.total+"记录");
        totalPages = pageInfo.pages;
        currentPage = pageInfo.pageNum;
    }

    function getPageNav(data){
        $("#pageNav").empty();
        var pageInfo = data.extend.pageInfo;
        var $nav = $("<nav></nav>");
        var $ul = $("<ul></ul>").addClass("pagination");
        var $firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var $prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(pageInfo.hasPreviousPage === false){
            $firstPageLi.addClass("disabled");
            $prePageLi.addClass("disabled");
        } else{
            $firstPageLi.click(function(){toPage(1)});
            $prePageLi.click(function(){toPage(pageInfo.pageNum - 1)});
        }

        $ul.append($firstPageLi).append($prePageLi);
        $.each(pageInfo.navigatepageNums,function(i,n){
            var $liNum = $("<li></li>").append($("<a></a>").append(n));
            if(pageInfo.pageNum == n){
                $liNum.addClass("active");
            }
            $liNum.click(function(){toPage(n)})
            $ul.append($liNum);
        })
        var $postPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var $lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if(pageInfo.hasNextPage === false){
            $lastPageLi.addClass("disabled");
            $postPageLi.addClass("disabled");
        } else{
            $lastPageLi.click(function(){toPage(pageInfo.pages)});
            $postPageLi.click(function(){toPage(pageInfo.pageNum + 1)});
        }
        $ul.append($postPageLi).append($lastPageLi);
        $nav.append($ul).appendTo($("#pageNav"));
    }

    function initForm($var){
        $var[0].reset();
        $var.find("*").removeClass("has-error has-success");
        $var.find(".help-block").text("");
    }

    function getDepts($var){
        $var.empty();
        $.ajax({
            url : "depts",
            type : "get",
            dataType : "json",
            success : function(data){
                //{"code":200,"msg":"处理成功!","extend":{"depts":[{"deptId":101,"deptName":"市场部"},{"deptId":102,"deptName":"文娱部"},{"deptId":103,"deptName":"销售部"}]}}
                var depts = data.extend.depts;
                $.each(depts,function(i,n){
                    var $selectVar = $("<option></option>").append(n.deptName).attr("value",n.deptId);
                    $selectVar.appendTo($var);
                })
            }
        })
    }

    $("#empAddBtn").click(function(){

        initForm($("#empAddModal form")); //还原表单

        getDepts($("#empAddModal select"));

        $("#empAddModal").modal({
            backdrop : 'static'
        })
    })

    //提示验证信息
    function validateSaveMsg($var,status,msg){
        if(status == "error"){
            $var.parent().addClass("has-error");
            $var.parent().removeClass("has-success");
        }else{
            $var.parent().addClass("has-success");
            $var.parent().removeClass("has-error");
        }
        $var.next("span").text(msg);
    }

    //离开用户名输入框即判断是否正确
    $("#empName").blur(function(){
        var empName = $("#empName").val();
        var nameReg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if(!nameReg.test(empName)){
            validateSaveMsg($("#empName"),"error","英文数字组合(6-16位)或者中文(2-5位)");
        }else{
            //前台判断正确之后,去后台判断用户名是否唯一
            $.ajax({
                url : "checkEmpName",
                type : "post",
                data : {
                    "empName" : empName
                },
                dataType : "json",
                success : function(data){
                    if(data.code == 500){
                        validateSaveMsg($("#empName"),"error",data.extend.msg);
                    }
                    else{
                        validateSaveMsg($("#empName"),"success","");
                    }
                }
            })
        }
    })
    //离开邮箱输入框即判断是否正确
    $("#email").blur(function(){
        var email = $("#email").val();
        var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!emailReg.test(email)){
            validateSaveMsg($("#email"),"error","邮箱格式错误");
        }else{
            validateSaveMsg($("#email"),"success","");
        }
    })
    $("#update_email").blur(function(){
        var email = $("#update_email").val();
        var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!emailReg.test(email)){
            validateSaveMsg($("#update_email"),"error","邮箱格式错误");
        }else{
            validateSaveMsg($("#update_email"),"success","");
        }
    })

    $("#empSaveBtn").click(function(){
        var $inputName = $("#empName");
        var $inputEmail = $("#email");
        $inputName.blur();
        $inputEmail.blur();

        if($inputName.next("span").text() != "" || $inputEmail.next("span").text() != ""){
            return false;
        }

        $.ajax({
            url : "emp",
            type : "post",
            data : $("#empAddModal form").serialize(),
            dataType : "json",
            success : function(data){
                if(data.code === 200){
                    $("#empAddModal").modal('hide');
                    toPage(totalPages + 1); //去最后一页
                } else{
                    //{"code":500,"msg":"处理失败!","extend":{"errors":{"empName":"英文数字组合(6-16位)或者中文(2-5位)","email":"邮箱格式错误"}}}
                    if(undefined != data.extend.errors.empName){
                        validateSaveMsg($("#empName"),"error",data.extend.errors.empName);
                    }
                    if(undefined != data.extend.errors.email){
                        validateSaveMsg($("#email"),"error",data.extend.errors.email);
                    }
                }
                // $inputEmail.next("span").text("");
                // $inputName.next("span").text("");
                // $inputEmail.parent().removeClass("has-error has-success");
                // $inputName.parent().removeClass("has-error has-success");
                //$("#empAddModal form")[0].reset();
            }
        })
    })

    function getEmp(id){
        $.ajax({
            url : "emp/" + id,
            type : "get",
            dataType : "json",
            success : function(data){
                var emp = data.extend.emp;
                $("#update_empName").text(emp.empName);
                $("#update_email").val(emp.email);
                //设定radio和checkbox可以用val,记得加[]
                $("#empUpdateModal input[name=gender]").val([emp.gender]);
                $("#empUpdateModal select").val([emp.dId]);
            }
        })
    }

    //为动态生成的元素绑定事件
    $("#empBody").on("click",".edit_btn",function(){
        //清空上次的信息
        initForm($("#empUpdateModal form"));
        //获取部门信息
        getDepts($("#empUpdateModal select"));
        //获取员工信息
        var empId = $(this).attr("edit_id");
        getEmp(empId);
        $("#empUpdateBtn").attr("edit_id",empId);

        $("#empUpdateModal").modal({
            backdrop : 'static'
        })
    })

    $("#empBody").on("click",".delete_btn",function(){
        //parents("..")取得一个包含着所有匹配元素的祖先元素的元素集合（不包含根元素）。可以通过一个可选的表达式进行筛选。
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if(confirm("确定删除【"+empName+"】吗?")){
            $.ajax({
                url : "emp/" + $(this).attr("delete_id"),
                type : "DELETE",
                dataType : "json",
                success : function(data){
                    if(data.code == 200){
                        toPage(currentPage);
                    }else{
                        alert(data.msg);
                    }
                }
            })
        }
    })

    $("#empUpdateBtn").click(function(){
        if($("#update_email").next("span").text() != ""){
            return false;
        }
        $.ajax({
            url : "emp/" + $(this).attr("edit_id"),
            type : "PUT",
            data : $("#empUpdateModal form").serialize(),  //后端采用@PutMapping的方式
            dataType : "json",
            success : function(data){
                if(data.code == 200){
                    $("#empUpdateModal").modal("hide");
                    toPage(currentPage);
                }else{
                    alert(data.msg);
                }
            }
        })
    })

    //复选框勾选判断
    $("#del_choices").click(function(){
        $(".del_choice").prop("checked",this.checked);
    })
    $("#empBody").on("click",$(".del_choice"),function(){
        $("#del_choices").prop("checked",$(".del_choice:checked").length === $(".del_choice").length);
    })

    $("#empDeleteBtn").click(function(){
        var empNames = "";
        var empIds = "";
        $.each($(".del_choice:checked"),function(){
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            empIds += $(this).parents("tr").find("td:eq(1)").text() + "-";
        })
        if("" == empNames){
            return false;
        }
        empNames = empNames.substring(0,empNames.length - 1);
        empIds = empIds.substring(0,empIds.length - 1);
        if(confirm("确认删除【"+empNames+"】吗?")){
            $.ajax({
                url : "emp/" + empIds,
                type : "DELETE",
                dataType : "json",
                success : function(data){
                    if(data.code == 200){
                        toPage(currentPage);
                    }else{
                        alert(data.msg);
                    }
                }
            })
        }
    })

</script>
