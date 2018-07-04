<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>发布旅游线路</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/admin/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../vendors/admin/css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../module/css/common.css" />
    <link rel="stylesheet" href="../module/css/index.css" />
</head>
<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <!-- left nav bar -->
                <jsp:include page="left.jsp" />
            </div>

            <jsp:include page="top-nav.jsp" />

            <!-- page content -->
            <div class="right_col" role="main">
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>发布线路</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i
                                            class="fa fa-chevron-up"></i></a></li>
                                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                            data-toggle="dropdown" role="button" aria-expanded="false"><i
                                            class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Settings 1</a></li>
                                            <li><a href="#">Settings 2</a></li>
                                        </ul></li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                线路信息：
                                <div class="row">
                                    <!--前缀-->
                                    <div class="form-group col-lg-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">线路名称</span>
                                            <input id="touristName" class="form-control" type="text">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">线路价格</span>
                                            <input id="touristPrice" class="form-control" type="text">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-3">
                                        <div class="input-group">
                                            <button id="saveTouristLine" type="button" class="btn btn-primary">保存线路信息</button>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                景点信息：
                                <div id="sceneryList" class="row">
                                    <div>
                                        <select id="scenerySelect" class="selectpicker show-tick" title="请选择景点" data-live-search="true" data-size="5">
                                            <!-- 页面加载后由ajax加载 -->
                                        </select>
                                        <button id="addScenery" type="button" class="btn btn-primary">添加景点</button>
                                    </div>
                                </div>
                                <!-- 隐藏模板 -->
                                <div class="row hide scenery" id="sceneryTemplate">
                                    <div class="form-group col-lg-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">景点编号</span>
                                            <input class="form-control sceneryId" type="text" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">景点名称</span>
                                            <input class="form-control sceneryName" type="text" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-primary removeScenery">删除</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->

            <jsp:include page="footer.jsp" />
        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="../vendors/bootstrap-select/bootstrap-select.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../vendors/admin/js/custom.min.js"></script>
    <script type="text/javascript" src="../module/js/common/common.js"></script>
    <script src="../vendors/admin/js/common.js"></script>

    <script type="text/javascript">
        $(function() {
            $.ajax({
                url: "../scenery/queryAllScenery.action",
                type: "get",
                dataType: "json",
                data: {
                    "pageContainer.pageSize" : 100,
                    "pageContainer.currentPageNo": 1
                },
                success: function(responseText) {
                    var json = JSON.parse(responseText);
                    var select = $("#sceneryList #scenerySelect");
                    var rows = json.rows;
                    for(var i = 0; i < rows.length; i++) {
                        var sceneryId = rows[i].sceneryId;
                        var sceneryName = rows[i].sceneryName;
                        select.append($("<option></option>").html(sceneryId + " : " + sceneryName));
                    };
                    select.selectpicker("refresh");
                }
            })
        });

        //克隆模板，添加数据返回节点
        function createScenery(sceneryId, sceneryName) {
            var $template = $("#sceneryTemplate");
            var $clone = $template.clone().removeClass("hide").removeAttr("id");
            $clone.find(".sceneryId").val(sceneryId);
            $clone.find(".sceneryName").val(sceneryName);
            return $clone;
        };

        $("#addScenery").click(function() {
            if($("#scenerySelect").val() == "") {
                alert("请先选择景点!");
                return false;
            }
            var sceneryId = $("#scenerySelect").val().split(" : ")[0];
            var sceneryName = $("#scenerySelect").val().split(" : ")[1];
            $("#sceneryList").append(createScenery(sceneryId, sceneryName));
            document.getElementById("scenerySelect").options.selectedIndex = 0;
            $("#scenerySelect").selectpicker("refresh");
        });

        $("#sceneryList").on("click", ".removeScenery", function() {
            $(this).closest(".row").remove();
        });

        $("#saveTouristLine").click(function() {
            var touristName = $("#touristName").val();
            var touristPrice = $("#touristPrice").val();
            if(!checkNumber(touristPrice)) {
                alert("线路价格非法数据.");
                return false;
            }
            var sceneryIds = [];
            $("#sceneryList .sceneryId").each(function() {
                sceneryIds.push($(this).val());
            });
            //序列化k-v
            var params = $.param({
                "sceneryIds": sceneryIds,
                "touristLine.touristLineName": touristName,
                "touristLine.touristLinePrice": touristPrice
            }, true);
            $.ajax({
                url: "../touristLine/addTouristLine.action",
                type: "post",
                async: false,
                data: params,
                success: function(responseText) {
                    location.reload();
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("error");
                }
            })
        });
    </script>
</body>
</html>