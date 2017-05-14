<%--
  Created by IntelliJ IDEA.
  User: gilhyeon
  Date: 2017-05-09
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gilhyeon's Blog</title>
    <%@include file="/WEB-INF/jsp/common/pageHeader.jsp" %>
    <link rel="stylesheet" href="<c:url value='/js/simplemde/simplemde.min.css'/>">
    <script src="<c:url value='/js/simplemde/simplemde.min.js'/>"></script>
    <script language="JavaScript">
        var id = "${param.id}";
        $(document).ready(function () {
            var simplemde = new SimpleMDE({ element: $("#MyID")[0] });
        });

    </script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <%--<!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1">
                <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                    class="icon-bar"></span><span class="icon-bar"></span></button>
            <a class="navbar-brand" href="#">Gilhyeon</a>
        </div>--%>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="defaultNavbar1">
            <ul class="nav navbar-nav">
                <li><a href="<c:url value='/'/>">Home<span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="https://github.com/GilHyeon/SimpleBlog">Project on GitHub</a></li>
                <li><a href="#">build by Gilhyeon</a></li>
            </ul>
        </div>

        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<div class="container">
    <div class="container-fluid">
        <h1>블로그 등록</h1>
    </div>
    <hr/>
    <div class="container-fluid">
        <form name="default-form" id="default-form" action="<c:url value='/blog/form'/>" method="post">
            <input type="hidden" name="id"/>
            <div class="input-group">
                <span class="input-group-addon">제목</span>
                <input type="text" class="form-control" placeholder="제목을 입력하세요" aria-describedby="basic-addon1" name="title"/>
            </div>
            <textarea  class="form-control" name="content"></textarea>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
</div>
</body>
</html>

