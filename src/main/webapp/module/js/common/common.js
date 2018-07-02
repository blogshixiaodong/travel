

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