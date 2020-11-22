var realTimeDatetimeDisplay = function() {
  var dateObj        = new Date(),
      dateYear       = dateObj.getFullYear(),
      dateMonth      = dateObj.getMonth() + 1,
      dateDay        = dateObj.getDate(),
      dateWeek       = dateObj.getDay(),
      timeHour       = dateObj.getHours(),
      timeMinutes    = dateObj.getMinutes(),
      timeSeconds    = dateObj.getSeconds(),
      weekNames      = ['日', '月', '火', '水', '木', '金', '土'],
      displayElement = document.getElementById('time_result'),
      str            = '';

  
  if (timeHour < 10) {
      timeHour = '0' + timeHour;
  }
  if (timeMinutes < 10) {
      timeMinutes = '0' + timeMinutes;
  }
  if (timeSeconds < 10) {
      timeSeconds = '0' + timeSeconds;
  }

  str  = dateYear + '年' + dateMonth + '月' + dateDay + '日' + '（' + weekNames[dateWeek] + '） ';
  str += timeHour + '時' + timeMinutes + '分' + timeSeconds + '秒';

 
  if (displayElement) {
      displayElement.innerHTML = str;
  }

  setTimeout(realTimeDatetimeDisplay, 1000);
};


realTimeDatetimeDisplay();
