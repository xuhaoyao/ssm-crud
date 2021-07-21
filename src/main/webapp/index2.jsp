<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
<script type="text/javascript" src="static/js/jquery-1.11.1-min.js"></script>
<link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
<script src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:forward page="emps"></jsp:forward>
</body>
</html>
