<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/6/30
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FuZhou Scenery</title>
    <link rel="stylesheet" href="../vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="../vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="../module/css/common.css" />
    <link rel="stylesheet" href="../module/css/index.css" />
</head>
<body>
    <div class="container">
        <jsp:include page="../statics/templates/nav.jsp"/>
        <div class="row">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    酒店信息
                </div>
                <div class="panel-body">
                    <front style="float: left">
                        <front style="float: left">
                        </front>
                    </front>
                </div>
                <table id="hotels" class="table table-striped table-hover"></table>
            </div>
        </div>
    </div>

    <script src="http://apps.bdimg.com/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="../vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="../vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="../module/js/common/common.js"></script>
    <script type="text/javascript">

        //激活下拉列表
        $(".dropdown-toggle").dropdown();

        $(function() {
            var actionUrl = "../hotel/queryHotelByVisitorId.action";
            queryHotelList(actionUrl);
        });

        function queryHotelList(actionUrl) {
            $("#hotels").bootstrapTable("destroy");
            $("#hotels").bootstrapTable({
                url: actionUrl,
                method: "get",
                cache: false, // 不缓存
                striped: true, // 隔行加亮
                height:300,
                uniqueId: "hotelId", //每一行的唯一标识，一般为主键列
                sortName: 'hotelId', // 设置默认排序为 name
                sortOrder: 'asc', // 设置排序为反序 desc
                sortTable:true,
                pagination: true, // 开启分页功能
                pageNumber: 1,
                pageSize: 5,    //每页的记录行数（*）
                pageList: [5, 10, 15, 20],
                paginationPreText: "上一页",
                paginationNextText: "下一页",
                sidePagination: "server",
                search: false, // 开启搜索功能
                showColumns: false, // 开启自定义列显示功能
                showRefresh: false, // 开启刷新功能
                queryParamsType: "undefined",
                queryParams: queryParams,
                //minimumCountColumns: 2, // 设置最少显示列个数
                clickToSelect: true, // 单击行即可以选中

                columns: [{
                    field: 'hotelId',
                    title: '酒店编号',
                    align: 'center',
                    valign: 'middle',
                    sortable: true // 开启排序功能
                }, {
                    field: 'hotelName',
                    title: '酒店名称',
                    align: 'center',
                    valign: 'middle',
                    formatter: linkToDetail,
                }, {
                    field: 'hotelPrice',
                    title: '酒店价格',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                }, {
                    field: 'hotelPhone',
                    title: '酒店电话',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'hotelAddress',
                    title: '酒店地址',
                    align: 'center',
                    valign: 'middle',
                }],
                responseHandler: function (e) {
                    var json = JSON.parse(e);
                    console.log(json);
                    return json;
                },
                onLoadSuccess: function() {
                    //alert("加载成功");
                },
                onLoadError: function() {
                    alert("加载失败");
                }
            });
            function operateFormatter(value, row, index) {
                return jsonDateToString(value);
            }

            function queryParams(params) {
                var hotelName = $("#hotelName").val();
                var hotelAddress = $("#hotelAddress").val();
                var hotelLowPrice = $("#hotelLowPrice").val();
                var hotelHighPrice = $("#hotelHighPrice").val();
                return {
                    "pageContainer.pageSize": params.pageSize,
                    "pageContainer.currentPageNo": params.pageNumber,
                    "hotel.hotelName":hotelName,
                    "hotel.hotelAddress":hotelAddress,
                    "hotelLowPrice":hotelLowPrice,
                    "hotelHighPrice":hotelHighPrice
                };
            }
            function linkToDetail(value, row, index) {
                return '<a href="hotel/queryHotelByHotelId.action?hotel.hotelId=' + row.hotelId + '">' + value + '</a>';
            }
        }

        $("#submit").click(function(){
            var hotelName = $("#hotelName").val();
            var hotelAddress = $("#hotelAddress").val();
            var hotelLowPrice = $("#hotelLowPrice").val();
            var hotelHighPrice = $("#hotelHighPrice").val();
            if(hotelName == "" && hotelAddress == "" && hotelHighPrice == "" && hotelLowPrice == ""){
                alert("至少输入一个查询条件");
                window.location = "./hotel.jsp";
            }
            var actionUrl = "hotel/queryHotelByCondition.action";
            queryHotelList(actionUrl);
            return false;
        });
    </script>
</body>
</html>
