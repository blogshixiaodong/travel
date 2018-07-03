<%--
  Created by IntelliJ IDEA.
  User: 15129
  Date: 2018/7/1
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>旅游游记</title>
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="vendors/bootstrap-table/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="module/css/common.css" />
</head>
<body>
    <div class="container">

        <!-- 导航栏部分 -->


        <jsp:include page="statics/templates/nav.jsp"></jsp:include>


        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    游记列表
                </div>

                </div>
            </nav>
        </div>

                <div class="panel-body">
                    <front style="float: right">
                        <front style="float: right">
                            <form style="margin:0px" class="form-inline">
                                <div class="form-group">
                                    <div class="input-group input-group-sm">
                                        <span class="input-group-addon">游记标题</span>
                                        <input id="headCondition" type="text" class="form-control" name="search" value="" />
                                    </div>
                                </div>
                                <button id="submitCondition" type="submit" class="btn btn-default btn-sm">查找</button>
                            </form>
                        </front>
                    </front>
                </div>
                <table id="touristnote" class="table table-striped table-hover"></table>
            </div>


    <script type="text/javascript" src="vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="vendors/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="module/js/common/common.js"></script>
    <script type="text/javascript">
        //激活下拉列表
        $(".dropdown-toggle").dropdown();
        var columns = [{
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
                return '<a href="touristNote/findTouristNoteById.action?touristNote.touristNoteId=' + row.touristNoteId + '">' + value + '</a>';
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
            var url = "touristNote/findTouristNoteList.action";
            var queryParams = function(params) {
                return {
                    "pageContainer.pageSize": params.pageSize,
                    "pageContainer.currentPageNo": params.pageNumber
                }
            };
            initTable($("#touristnote"), url, queryParams, columns);
        });

        $("#submitCondition").click(function() {
            var head = $("#headCondition").val();
            var urls = "touristNote/findTouristNoteListByHeadLine.action";
            var queryParams = function(params) {
                return {
                    "pageContainer.pageSize": params.pageSize,
                    "pageContainer.currentPageNo": params.pageNumber,
                    "touristNote.touristNoteHeadLine": head
                }
            };
            initTable($("#touristnote"), urls, queryParams, columns);
            return false;
        });
    </script>
</body>
</html>
