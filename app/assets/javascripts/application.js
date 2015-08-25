// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  var date_from_string = function(str){
    var months = ["jan","feb","mar","apr","may","jun","jul",
                  "aug","sep","oct","nov","dec"];
    var pattern = "^([a-zA-Z]{3})\\s*(\\d{2}),\\s*(\\d{4})$";
    var re = new RegExp(pattern);
    var DateParts = re.exec(str).slice(1);

    var Year = DateParts[2];
    var Month = $.inArray(DateParts[0].toLowerCase(), months);
    var Day = DateParts[1];
    return new Date(Year, Month, Day);
  }

  var moveBlanks = function(a, b) {
    if ( a < b ){
      if (a == "")
        return 1;
      else
        return -1;
    }
    if ( a > b ){
      if (b == "")
        return -1;
      else
        return 1;
    }
    return 0;
  };
  var moveBlanksDesc = function(a, b) {
    if ( a < b )
      return 1;
    if ( a > b )
      return -1;
    return 0;
  };

  var table = $("#monsters").stupidtable({
    "date":function(a,b){
      aDate = date_from_string(a);
      bDate = date_from_string(b);
      return aDate - bDate;
    },
    "moveBlanks": moveBlanks,
    "moveBlanksDesc": moveBlanksDesc,
  });

  var th_to_sort = table.find("thead th").eq(0);
	th_to_sort.stupidsort();

  table.on("aftertablesort", function (event, data) {
    var th = $(this).find("th");
    th.find(".arrow").remove();
    var dir = $.fn.stupidtable.dir;

    var arrow = data.direction === dir.ASC ? "&uarr;" : "&darr;";
    th.eq(data.column).append('<span class="arrow">' + arrow +'</span>');
  });

  var table1 = $("#monsters1").stupidtable({
    "date":function(a,b){
      aDate = date_from_string(a);
      bDate = date_from_string(b);
      return aDate - bDate;
    },
    "moveBlanks": moveBlanks,
    "moveBlanksDesc": moveBlanksDesc,
  });

  var th_to_sort = table1.find("thead th").eq(0);
  th_to_sort.stupidsort();

  table1.on("aftertablesort", function (event, data) {
    var th = $(this).find("th");
    th.find(".arrow").remove();
    var dir = $.fn.stupidtable.dir;

    var arrow = data.direction === dir.ASC ? "&uarr;" : "&darr;";
    th.eq(data.column).append('<span class="arrow">' + arrow +'</span>');
  });

  var table2 = $("#monsters2").stupidtable({
    "date":function(a,b){
      aDate = date_from_string(a);
      bDate = date_from_string(b);
      return aDate - bDate;
    },
    "moveBlanks": moveBlanks,
    "moveBlanksDesc": moveBlanksDesc,
  });

  var th_to_sort = table2.find("thead th").eq(0);
  th_to_sort.stupidsort();

  table2.on("aftertablesort", function (event, data) {
    var th = $(this).find("th");
    th.find(".arrow").remove();
    var dir = $.fn.stupidtable.dir;

    var arrow = data.direction === dir.ASC ? "&uarr;" : "&darr;";
    th.eq(data.column).append('<span class="arrow">' + arrow +'</span>');
  });

  var table3 = $("#monsters3").stupidtable({
    "date":function(a,b){
      aDate = date_from_string(a);
      bDate = date_from_string(b);
      return aDate - bDate;
    },
    "moveBlanks": moveBlanks,
    "moveBlanksDesc": moveBlanksDesc,
  });

  var th_to_sort = table3.find("thead th").eq(0);
  th_to_sort.stupidsort();

  table3.on("aftertablesort", function (event, data) {
    var th = $(this).find("th");
    th.find(".arrow").remove();
    var dir = $.fn.stupidtable.dir;

    var arrow = data.direction === dir.ASC ? "&uarr;" : "&darr;";
    th.eq(data.column).append('<span class="arrow">' + arrow +'</span>');
  });
});