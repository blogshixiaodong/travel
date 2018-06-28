<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/6/24
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.css" />
    <style>
        .carousel {
            height: 360px;
            /*height: auto;*/
            background-color: #000000;
        }
        .carousel .item{
            /*height: auto;*/
            height: 360px;
            background-color: #000000;
        }
        .carousel img{
            height: 360px;
        }
        .row {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 导航栏部分 -->
        <div class="row">
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">FuZhou Travel</a>
                    </div>
                    <div>
                        <ul class="nav navbar-nav navbar-left">
                            <li><a href="#">iOS</a></li>
                            <li><a href="#">SVN</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    Java
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">jmeter</a></li>
                                    <li><a href="#">EJB</a></li>
                                    <li><a href="#">Jasper Report</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">分离的链接</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">另一个分离的链接</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#">登陆</a></li>
                            <li><a href="#">注册</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <!-- 轮播图显示 -->
        <div class="row">
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="statics/images/1.jpg" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="statics/images/2.jpg" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="statics/images/3.jpg" alt="Third slide">
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <!-- 文章中心部分 -->
        <div class="row">
            <!-- 左边新闻列表 -->
            <div class="col-md-8 cols-sm-12 cols-xs-12">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">这里是面板头部标题</div>
                        <div class="panel-body">这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分</div>
                        <div class="panel-footer">这里是面板尾部部分</div>
                    </div>
                </div>
            </div>

            <!-- 侧边其他信息显示 -->
            <div class="col-md-4 col-sm-12 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">这里是面板头部标题</div>
                    <div class="panel-body">这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分</div>
                    <div class="panel-footer">这里是面板尾部部分</div>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //激活下拉列表
        $(".dropdown-toggle").dropdown();
        //激活轮播图
        $('.carousel').carousel()
    </script>
</body>
</html>
