<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/7/1
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>旅游线路查看</title>
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="module/css/common.css" />
</head>
<body>
    <div class="container">
        <jsp:include page="statics/templates/nav.jsp"></jsp:include>

        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    线路列表
                </div>
                <div class="panel-body">
                    <front style="float: right">
                        <front style="float: right">
                            <%--<form style="margin:0px" class="form-inline">--%>
                                <%--<div class="form-group">--%>
                                    <%--<div class="input-group input-group-sm">--%>
                                        <%--<span class="input-group-addon">线路编号</span>--%>
                                        <%--<input id="idCondition" type="text" class="form-control"  value="" />--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<button id="submitCondition" type="button" class="btn btn-default btn-sm">查找</button>--%>
                            <%--</form>--%>
                        </front>
                    </front>
                </div>
                <table id="touristLine" class="table table-striped table-hover"></table>
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
        var columns= [{
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
                return '<a href="touristLine/findTouristLineListById.action?touristLine.touristLineId=' + row.touristLineId + '">' + value + '</a>';
            }
        },{
            field: 'touristLineName',
            title: '线路名称',
            align: 'center',
            valign: 'middle'

        }, {
            field: 'touristLinePrice',
            title: '线路价格',
            align: 'center',
            valign: 'middle'

        }];

        $(function() {
            var url = "touristLine/findTouristLineList.action";
            var queryParams = function(params) {
                return {
                    "pageContainer.pageSize": params.pageSize,
                    "pageContainer.currentPageNo": params.pageNumber,
                };
            }
            initTable($("#touristLine"), url, queryParams, columns);
        });

        $("#submitCondition").click(function() {
            var id = $("#idCondition").val();
            var url = "touristLine/findTouristLineListById.action";
            var queryParams = function(params) {
                return {
                    "pageContainer.pageSize": params.pageSize,
                    "pageContainer.currentPageNo": params.pageNumber,
                    "touristLine.touristLineId": id
                };
            };
            initTable($("#touristLine"), url, queryParams, columns);
            return false;
        });
    </script>
</body>
</html>
