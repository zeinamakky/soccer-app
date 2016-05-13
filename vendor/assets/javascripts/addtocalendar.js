function forEachAttr(attrs,cb){for(key in attrs){if(attrs.hasOwnProperty(key)&&key.indexOf("$")===-1){cb(key,attrs[key])}}}"use strict";var formatIcsText=function(s,maxLength){function _wrap(s){if(s.length<=maxLength){return s}return s.substring(0,maxLength).replace(/\n/g,"\\n")+"\r\n "+_wrap(s.substring(maxLength),75)}return _wrap(s.replace(/\n/g,"\\n"),maxLength)};"use strict";var CalendarRegex;(function(){var dateRegex="[0-9]{8}T[0-9]{6}";function escapeRegex(s){return s.replace(/[-\/\\^$*+?.()|[\]{}]/g,"\\$&")}function getUrlRegex(baseUrl,urlParams){var regex="http(s?)\\:\\/\\/"+escapeRegex(baseUrl)+"\\?";var params=[];for(var key in urlParams){params.push(key+"="+urlParams[key])}regex+=params.join("\\&");return new RegExp(regex,"g")}function getIcsCalendarRegex(){var regex=["BEGIN:VCALENDAR","VERSION:2.0","BEGIN:VEVENT","CLASS:PUBLIC","DESCRIPTION:(.*)","DTSTART:"+dateRegex,"DTEND:"+dateRegex,"LOCATION:(.*)","SUMMARY:(.*)","TRANSP:TRANSPARENT","END:VEVENT","END:VCALENDAR"].join("\n");return new RegExp(regex,"g")}CalendarRegex={dateRegex:dateRegex,getUrlRegex:getUrlRegex,getIcsCalendarRegex:getIcsCalendarRegex}})();"use strict";angular.module("jshor.angular-addtocalendar",[]).config(["$compileProvider",function($compileProvider){$compileProvider.aHrefSanitizationWhitelist(/^\s*(http(s)?|data):/)}]).controller("AddtocalendarCtrl",["$scope","$attrs",function($scope,$attrs){$scope.description=$scope.description||"";function getIcsCalendar(){return["BEGIN:VCALENDAR","VERSION:2.0","BEGIN:VEVENT","CLASS:PUBLIC","DESCRIPTION:"+formatIcsText($scope.description,62),"DTSTART:"+$scope.startDate,"DTEND:"+$scope.endDate,"LOCATION:"+formatIcsText($scope.location,64),"SUMMARY:"+formatIcsText($scope.title,66),"TRANSP:TRANSPARENT","END:VEVENT","END:VCALENDAR"].join("\n")}function getYahooCalendarUrl(){var yahooCalendarUrl="http://calendar.yahoo.com/?v=60&view=d&type=20";yahooCalendarUrl+="&title="+encodeURIComponent($scope.title);yahooCalendarUrl+="&st="+encodeURIComponent($scope.startDate)+"&et="+encodeURIComponent($scope.endDate);yahooCalendarUrl+="&desc="+encodeURIComponent($scope.description);yahooCalendarUrl+="&in_loc="+encodeURIComponent($scope.location);return yahooCalendarUrl}function getGoogleCalendarUrl(){var googleCalendarUrl="https://www.google.com/calendar/render?action=TEMPLATE";googleCalendarUrl+="&text="+encodeURIComponent($scope.title);googleCalendarUrl+="&dates="+encodeURIComponent($scope.startDate)+"/"+encodeURIComponent($scope.endDate);googleCalendarUrl+="&details="+encodeURIComponent($scope.description);googleCalendarUrl+="&location="+encodeURIComponent($scope.location);return googleCalendarUrl}function getMicrosoftCalendarUrl(){var microsoftCalendarUrl="http://calendar.live.com/calendar/calendar.aspx?rru=addevent";microsoftCalendarUrl+="&summary="+encodeURIComponent($scope.title);microsoftCalendarUrl+="&dtstart="+encodeURIComponent($scope.startDate)+"&dtend="+encodeURIComponent($scope.endDate);microsoftCalendarUrl+="&description="+encodeURIComponent($scope.description);microsoftCalendarUrl+="&location="+encodeURIComponent($scope.location);return microsoftCalendarUrl}function buildUrl(){$scope.calendarUrl={microsoft:getMicrosoftCalendarUrl(),google:getGoogleCalendarUrl(),yahoo:getYahooCalendarUrl(),icalendar:getIcsCalendar(),dlIcal:dlIcal}}function dlIcal(){var fileName=$scope.title.replace(/[^\w ]+/g,"")+".ics";download(getIcsCalendar(),fileName,"application/octet-stream")}forEachAttr($attrs,function(key){$attrs.$observe(key,function(){buildUrl()})});buildUrl()}]).directive("addtocalendar",function(){return{restrict:"E",scope:{startDate:"@",endDate:"@",title:"@",description:"@",location:"@",className:"@",btnText:"@"},controller:"AddtocalendarCtrl",template:'      <div class="btn-group" dropdown on-toggle="toggled(open)">        <span          ng-class="className || \'btn btn-sm btn-default dropdown-toggle\'"          dropdown-toggle>          {{btnText || \'Add to calendar\'}} <span class="caret"></span>        </span>        <ul class="dropdown-menu">          <li><a ng-click="calendarUrl.dlIcal()">iCalendar</a></li>          <li><a href="{{calendarUrl.google}}" target="_blank">Google Calendar</a></li>          <li><a ng-click="calendarUrl.dlIcal()">Outlook</a></li>          <li><a href="{{calendarUrl.yahoo}}" target="_blank">Yahoo! Calendar</a></li>          <li><a href="{{calendarUrl.microsoft}}" target="_blank">Microsoft Calendar</a></li>        </ul>      </div>'}});