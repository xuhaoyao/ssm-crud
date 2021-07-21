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
            <button class="btn-primary">新增</button>
            <button class="btn-danger">删除</button>
        </div>
    </div>
<%--    显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="e">
                    <tr>
                        <th>${e.empId}</th>
                        <th>${e.empName}</th>
                        <th>${e.gender}</th>
                        <th>${e.email}</th>
                        <th>${e.department.deptName}</th>
                        <th>
                            <button  class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil"></span> 编辑
                            </button>
                            <button  class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
<%--                    <tr>
                        <th>1</th>
                        <th>xhy</th>
                        <th>男</th>
                        <th>232@qq.com</th>
                        <th>xxx</th>
                        <th>
                            <button  class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil"></span> 编辑
                            </button>
                            <button  class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </button>
                        </th>
                    </tr>--%>
                </tbody>
            </table>
        </div>
    </div>
<%--    分页信息--%>
    <div class="row">
<%--        分页文字信息--%>
        <div class="col-md-6">
            当前 ${pageInfo.pageNum}页,总 ${pageInfo.pages}页,总 ${pageInfo.total}记录
        </div>
<%--        分页条信息--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${!pageInfo.isFirstPage}">
                        <li><a href="emps?pn=1">首页</a></li>
                    </c:if>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="emps?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageNum == pageInfo.pageNum}">
                            <li class="active"><a href="emps?pn=${pageNum}">${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageNum != pageInfo.pageNum}">
                            <li><a href="emps?pn=${pageNum}">${pageNum}</a></li>
                        </c:if>
                    </c:forEach>
<%--                    <li><a href="#">1</a></li>--%>
<%--                    <li><a href="#">2</a></li>--%>
<%--                    <li><a href="#">3</a></li>--%>
<%--                    <li><a href="#">4</a></li>--%>
<%--                    <li><a href="#">5</a></li>--%>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="emps?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.isLastPage}">
                        <li><a href="emps?pn=${pageInfo.pages}">末页</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
