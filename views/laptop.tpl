<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SIDOLA COMPUTER CENTER</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <style>
  table, th, td 
  {
    margin:10px 0;
    border:solid 1px #333;
    padding:2px 4px;
    font:15px Verdana;
  }
  th {
    font-weight:bold;
  }
</style>
</head>

<body onLoad="buildHtmlTable('#excelDataTable')">
  <nav class="navigation">

   <ul>

    <a href="home"><span>Home</span></a>

    <a href="#"><span>Laptop</span></a>


    <a href="server"><span>Server</span></a>

  </ul>

</nav>
<table id="excelDataTable" border="1">
</table>

<script>
  var myList = {{.json}}

  function buildHtmlTable(selector) {
    var columns = addAllColumnHeaders(myList, selector);

    for (var i = 0; i < myList.length; i++) {
      var row$ = $('<tr/>');
      for (var colIndex = 0; colIndex < columns.length; colIndex++) {
        var cellValue = myList[i][columns[colIndex]];
        if (cellValue == null) cellValue = "";
        row$.append($('<td/>').html(cellValue));
      }
      $(selector).append(row$);
    }
  }
  function addAllColumnHeaders(myList, selector) {
    var columnSet = [];
    var headerTr$ = $('<tr/>');

    for (var i = 0; i < myList.length; i++) {
      var rowHash = myList[i];
      for (var key in rowHash) {
        if ($.inArray(key, columnSet) == -1) {
          columnSet.push(key);
          headerTr$.append($('<th/>').html(key));
        }
      }
    }
    $(selector).append(headerTr$);

    return columnSet;
  }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</body>
</html>
