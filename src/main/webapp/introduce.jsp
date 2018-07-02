<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/7/1
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>福州介绍</title>
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
                            <li><a href="touristline.jsp">旅游线路</a></li>
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

        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    福州简介
                </div>
                <div class="panel-body">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;福州，别称榕城，简称“榕”，隶属于福建省，位于福建省东部、闽江下游及沿海地区，是福建省省会，福建省的政治、文化、交通中心，海峡西岸经济区中心城市之一。福州建城于公元前202年，历史上曾长期作为福建的政治中心。是中国东南沿海重要都市、东部战区陆军机关驻地。福州地貌属典型的河口盆地，盆地四周被群山峻岭所环抱，其海拔多在600~1000米之间。
                    福州是首批14个对外开放的沿海港口城市之一，海上丝绸之路门户以及中国（福建）自由贸易试验区三片区之一；福州也是近代中国最早开放的五个通商口岸之一，福州马尾是中国近代海军的摇篮，中国船政文化的发祥地；曾获“中国优秀旅游城市”、“国家卫生城市”、“滨江滨海生态园林城市”  、“国家环保模范城”、“全国双拥模范城市”、“国家历史文化名城”、“全国文明城市”等称号。
                    2017年福州辖6区1县级市6县，全市陆地总面积11968平方公里，其中市区面积1786平方公里，建成区面积260平方公里，城镇化率64.8%。
                    2016年末全市常住人口757万人，全市海域总面积11.09万平方公里，海岸线长1137公里，占福建省的1/3，当地居民以汉族的闽海系族群为主，通行闽东语福州方言。
                    2017年11月，中央文明委复查确认继续保留荣誉称号的往届全国文明城市。2017年中国百强城市排行榜排25位。
                    <hr />
                    <div>
                        <img src="statics/images/fz1.jpg" />
                        <img src="statics/images/fz2.jpg" />
                    </div>
                </div>
            </div>

        </div>

    </div>

    <script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
