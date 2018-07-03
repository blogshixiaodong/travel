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
    <link rel="stylesheet" href="vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="module/css/common.css" />
    <link rel="stylesheet" href="module/css/index.css" />
</head>
<body>
    <div class="container">
        <jsp:include page="statics/templates/nav.jsp"></jsp:include>

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
            <div class="col-md-12 cols-sm-12 cols-xs-12">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            旅游资讯
                            <front style="float: right">
                                <a href="news.jsp">
                                    <span class="badge">→</span>
                                </a>
                            </front>
                        </div>
                        <div class="panel-body">
                            <table id="newsTable" class="table table-striped table-hover"></table>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            最新线路
                            <front style="float: right">
                                <a href="touristline.jsp">
                                    <span class="badge">→</span>
                                </a>
                            </front>
                        </div>
                        <table id="touristLineTable" class="table table-striped table-hover"></table>
                    </div>
                </div>

                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            游客游记
                            <front style="float: right">
                                <a href="touristnote.jsp">
                                    <span class="badge">→</span>
                                </a>
                            </front>
                        </div>
                        <div class="panel-body">
                            <table id="touristLineNoteTable" class="table table-striped table-hover"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="module/js/common/common.js"></script>
    <script type="text/javascript">
        //激活下拉列表
        $(".dropdown-toggle").dropdown();
        //激活轮播图
        $('.carousel').carousel();

        var newsColumns = [{
            field: 'newsType',
            title: '新闻类型',
            align: 'center',
            valign: 'middle',
        }, {
            field: 'newsHeadLine',
            title: '新闻标题',
            align: 'center',
            valign: 'middle',
            formatter: function(value, row, index) {
                return '<a href="news/queryNewsByNewsId.action?news.newsId=' + row.newsId + '">' + value + '</a>';
            },
        }, {
            field: 'newsDate',
            title: '发表时间',
            align: 'center',
            valign: 'middle',
            formatter: function(value, row, index) {
                return jsonDateToString(value);
            },
        }];

        var touristLineColumns = [{
            field: 'touristLineId',
            title: '线路编号',
            align: 'center',
            valign: 'middle',
        }, {
            field: 'touristLineName',
            title: '线路名称',
            align: 'center',
            valign: 'middle',
            formatter: function(value, row, index) {
                return '<a href="touristNote/findTouristNoteById.action?touristNote.touristNoteId=' + row.touristNoteId + '">' + value + '</a>';
            }
        }, {
            field: 'touristLinePrice',
            title: '线路价格',
            align: 'center',
            valign: 'middle',

        }];

        var touristNoteColumns = [{
            field: 'touristNoteId',
            title: '游记编号',
            align: 'center',
            valign: 'middle',
        }, {
            field: 'touristNoteHeadLine',
            title: '标题',
            align: 'center',
            valign: 'middle',
            formatter: function(value, row, index) {
                return '<a href="touristLine/findTouristLineListById.action?touristLine.touristLineId=' + row.touristLineId + '">' + value + '</a>';
            }
        }, {
            field: 'touristNoteTime',
            title: '发表时间',
            align: 'center',
            valign: 'middle',
            formatter: function(value, row, index) {
                return jsonDateToString(value);
            },
        }, {
            field: 'visitor.visitorId',
            title: '作者',
            align: 'center',
            valign: 'middle',

        }];

        $(function() {
            initTable(
                $("#newsTable"),
                "news/queryAllNews.action",
                function(params) {
                    return {
                        "pageContainer.pageSize": params.pageSize,
                        "pageContainer.currentPageNo": params.pageNumber,
                    };},
                newsColumns);

            initTable(
                $("#touristLineTable"),
                "touristLine/findTouristLineList.action",
                function(params) {
                    return {
                        "pageContainer.pageSize": params.pageSize,
                        "pageContainer.currentPageNo": params.pageNumber,
                    };},
                touristLineColumns);

            initTable(
                $("#touristLineNoteTable"),
                "touristNote/findTouristNoteList.action",
                function(params) {
                    return {
                        "pageContainer.pageSize": params.pageSize,
                        "pageContainer.currentPageNo": params.pageNumber,
                    };},
                touristNoteColumns);
        });




    </script>
</body>
</html>
