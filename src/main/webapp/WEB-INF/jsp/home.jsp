<%--
  Created by IntelliJ IDEA.
  User: gilhyeon
  Date: 2017-05-09
  Time: 오전 12:39
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
    <title>Simple Blog</title>
    <%@include file="/WEB-INF/jsp/common/pageHeader.jsp" %>
    <link rel="stylesheet/less" href="<c:url value='/js/pagedown/demo.less'/>">
    <script src="<c:url value='/js/pagedown/less/less-1.2.2.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/pagedown/Markdown.Converter.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/pagedown/Markdown.Sanitizer.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/pagedown/Markdown.Editor.js'/>"></script>
    <script language="JavaScript">
        var converter1 = Markdown.getSanitizingConverter();
        $(document).ready(function () {
            loadBlog();
        });

        function loadBlog() {
            $.ajax({
                type: "GET",
                url: "<c:url value='/blog/findAll'/>",
                //data:params,
                success: function (result) {
                    console.log(result);
                    if(result.length >0) {
                        for (var i = 0; i < result.length; i++) {
                            $("#BlogArea").append(""
                                +"<div class='blog-post'>\n"
                                +"<h2 class='blog-post-title'>"+result[i].title+"</h2>\n"
                                +"<p class='blog-post-meta'>"+getBlogDate(new Date(result[i].createdDate)) +" by <a href='#'>Simple Blog</a></p>\n"
                                + converter1.makeHtml(result[i].content)
                                + "<hr>"
                            );
                        }
                    }else {
                        $("#BlogArea").append(""
                            +"<div class='blog-post'>\n"
                            +"<h2 class='blog-post-title'>블로그를 작성하세요</h2>\n"
                            +"<p class='blog-post-meta'>"+getBlogDate(new Date()) +" by <a href='#'>Simple Blog</a></p>\n"
                            + "<p>블로그를 작성하는 url은 <a href='" +"<c:url value='/blog/form'/>" + "'>/blog/form</a> 입니다.</p>"
                            + "<p>관련 url은 Controller를 참고하세요.</p>"
                            + "<hr>"
                        );
                    }

                },
                //beforeSend:showRequest,
                error: function (e) {
                    console.log(e.responseText);
                }
            });
        }
    </script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1">
                <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                    class="icon-bar"></span><span class="icon-bar"></span></button>
            <a class="navbar-brand" href="#">SimpleBlog</a>
        </div>
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

    <div class="blog-header">
        <h1 class="blog-title">Simple Blog.</h1>
        <p class="lead blog-description">The Simple Blog... Just write, Just View!!</p>
    </div>

    <div class="row">

        <div class="col-sm-8 blog-main">
            <div id="BlogArea">

            </div>

           <%-- <nav>
                <ul class="pager">
                    <li><a href="#">Previous</a></li>
                    <li><a href="#">Next</a></li>
                </ul>
            </nav>--%>

        </div><!-- /.blog-main -->
        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
            <div class="sidebar-module sidebar-module-inset">
                <h4>About</h4>
                <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            </div>
            <div class="sidebar-module">
                <h4>Archives</h4>
                <ol class="list-unstyled">
                    <li><a href="#">March 2014</a></li>
                    <li><a href="#">February 2014</a></li>
                    <li><a href="#">January 2014</a></li>
                    <li><a href="#">December 2013</a></li>
                    <li><a href="#">November 2013</a></li>
                    <li><a href="#">October 2013</a></li>
                    <li><a href="#">September 2013</a></li>
                    <li><a href="#">August 2013</a></li>
                    <li><a href="#">July 2013</a></li>
                    <li><a href="#">June 2013</a></li>
                    <li><a href="#">May 2013</a></li>
                    <li><a href="#">April 2013</a></li>
                </ol>
            </div>
            <div class="sidebar-module">
                <h4>Elsewhere</h4>
                <ol class="list-unstyled">
                    <li><a href="#">GitHub</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Facebook</a></li>
                </ol>
            </div>
        </div><!-- /.blog-sidebar -->
    </div><!-- /.row -->

</div><!-- /.container -->

<footer class="blog-footer">
    <p>Blog template built for <a href="http://getbootstrap.com">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
    <p>
        <a href="#">Back to top</a>
    </p>
</footer>

</body>
</html>
