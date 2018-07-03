

function jsonConvertToBootstrapTableData(json) {
    var data = {
        total: json.recordCount,
        rows: json.list
    };
    return data;
}

function appendZero(number) {
    if (number < 10) {
        return "0" + number;
    }
    return number;
}


function jsonDateToString(dateObject) {
    var year = 1900 + dateObject.year;
    var month = 1 + dateObject.month;
    var day = dateObject.date;
    var hours = dateObject.hours;

    var minutes = dateObject.minutes;

    var seconds = dateObject.seconds;

    return year + "-" + appendZero(month) + "-" + appendZero(day) + " "
        + appendZero(hours) + ":" + appendZero(minutes) + ":"
        + appendZero(seconds);
}
//验证字符串是否是数字
function checkNumber(theObj) {
    var reg = /^[0-9]+.?[0-9]*$/;
    if(reg.test(theObj)) {
        return true;
    }
    return false;
}

function createBtnGroup(btnGroup, json) {
    btnGroup.html("");
    var currentPageNo = json.currentPageNo;
    var pageCount = json.pageCount;

    var recordCount = json.recordCount;
    if(currentPageNo == 1) {
        btnGroup.append($("<button class='btn btn-default disabled' pageNo='1'>上一页</button>"));
    } else {
        btnGroup.append($("<button class='btn btn-default' pageNo='" + (currentPageNo - 1) + "'>上一页</button>"));
    }
    for(var i = 1; i <= pageCount; i++) {
        if(i == currentPageNo) {
            btnGroup.append($("<button class='btn btn-default disabled' pageNo='" + i  +"'>" + i + "</button>"));
            continue;
        }
        btnGroup.append($("<button class='btn btn-default' pageNo='" + i  +"'>" + i + "</button>"));
    }
    if(currentPageNo == pageCount) {
        btnGroup.append($("<button class='btn btn-default disabled' pageNo='" + currentPageNo  +"'>下一页</button>"));
    } else {
        btnGroup.append($("<button class='btn btn-default' pageNo='" + (currentPageNo + 1 ) + "'>下一页</button>"));
    }
}

function initTable(table, url, queryPrarams, columns) {
    table.bootstrapTable("destroy");
    table.bootstrapTable({
        url: url,
        method: "post",    //解决搜索时中文乱码，下同
        contentType:"application/x-www-form-urlencoded",
        cache: false, // 不缓存
        striped: true, // 隔行加亮
        height: 300,
        sortable: true,
        sortName: 'sceneryId', // 设置默认排序为 name
        sortOrder: "asc",
        uniqueId: "sceneryId", //每一行的唯一标识，一般为主键列
        pagination: true, // 开启分页功能
        pageNumber: 1,
        pageSize: 3,    //每页的记录行数（*）
        pageList: [5, 10, 15, 20],
        paginationPreText: "上一页",
        paginationNextText: "下一页",
        sidePagination: "server",
        clickToSelect: true, // 单击行即可以选中
        search: false, // 开启搜索功能
        showColumns: false, // 开启自定义列显示功能
        showRefresh: false, // 开启刷新功能
        queryParamsType: "undefined",
        queryParams: queryPrarams,
        columns: columns,
        responseHandler: function (e) {
            var json = JSON.parse(e);
            return json;
        },
        onLoadSuccess: function() {
            console.log("加载成功.");
        },
        onLoadError: function() {
            alert("加载失败, 刷新重试.");
        }
    });
}