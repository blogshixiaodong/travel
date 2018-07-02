/*
 * 后台返回时间格式化
 * */
function AppendZero(number) {
	if (number < 10) {
		return "0" + number;
	}
	return number;
}

 function JsonDateToString(dateObject) {
	var year = 1900 + dateObject.year;
	var month = 1 + dateObject.month;
	var day = dateObject.date;
	var hours = dateObject.hours;

	var minutes = dateObject.minutes;

	var seconds = dateObject.seconds;

	return year + "-" + AppendZero(month) + "-" + AppendZero(day) + " "
			+ AppendZero(hours) + ":" + AppendZero(minutes) + ":"
			+ AppendZero(seconds);
}
 
//将星期1-7，具体上课时间1-4， 转为 星期一 上午 1-2节
function schooltime(day, attendTime) {
	var dayString = "";
	switch(day) {
		case 1:
			dayString = "星期一";
			break;
		case 2:
			dayString = "星期二";
			break;
		case 3:
			dayString = "星期三";
			break;
		case 4:
			dayString = "星期四";
			break;
		case 5:
			dayString = "星期五";
			break;
		case 6:
			dayString = "星期六";
			break;
		case 7:
			dayString = "星期一";
			break;
	}
	var attendTimeString = "";
	switch(attendTime) {
		case 1:
			attendTimeString = "上午 1-2节";
			break;
		case 2:
			attendTimeString = "上午 3-4节";
			break;
		case 3:
			attendTimeString = "下午 5-6节";
			break;
		case 4:
			attendTimeString = "下午 7-8节";
			break;
	}
	return dayString + " " + attendTimeString;
}

function isNullOrUndefined(value) {
	if(value == null || value == undefined) {
		return true;
	}
	return false;
}



