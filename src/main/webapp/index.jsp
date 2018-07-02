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
    <title>FuZhou Travel</title>
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="module/css/common.css" />
    <link rel="stylesheet" href="module/css/index.css" />
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
                            <li><a href="introduce.jsp">福州介绍</a></li>
                            <li><a href="scenery.jsp">福州景点</a></li>
                            <li><a href="#">旅游线路</a></li>
                            <li><a href="touristnote.jsp">旅游游记</a></li>
                            <li><a href="#">旅游新闻</a></li>
                            <li><a href="hotel.jsp">周边酒店</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    留言
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">我要留言</a></li>
                                    <li><a href="#">留言查看</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    <div>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    登陆
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">游客登陆</a></li>
                                    <li><a href="#">管理员登陆</a></li>
                                </ul>
                            </li>
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
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            旅游资讯
                            <front style="float: right">
                                <a href="#">
                                    <span class="badge">→</span>
                                </a>
                            </front>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>编号</th>
                                        <th>标题</th>
                                        <th>时间</th>
                                        <th>类型</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>100</td>
                                        <td>1</td>
                                        <td>100</td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            最新线路
                            <front style="float: right">
                                <a href="#">
                                    <span class="badge">→</span>
                                </a>
                            </front>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>名称</th>
                                    <th>价格</th>
                                    <th>状态</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>100</td>
                                    <td>1</td>
                                    <td>100</td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            游客游记
                            <front style="float: right">
                                <a href="#">
                                    <span class="badge">→</span>
                                </a>
                            </front>
                        </div>
                        <div class="panel-body">

                        </div>
                    </div>
                </div>
            </div>

            <!-- 侧边其他信息显示 -->
            <div class="col-md-4 col-sm-12 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">这里是面板头部标题</div>
                    <div class="panel-body">这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分这里是面板内容部分</div>
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
