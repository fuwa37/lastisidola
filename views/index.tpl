<!DOCTYPE html>

<html>
<head>
</head>

<body onLoad="buildHtmlTable('#excelDataTable')">
	<script>
		var laptop={{.json}}

		function buildHtmlTable(selector) {
			var columns = addAllColumnHeaders(laptop, selector);

			for (var i = 0; i < laptop.length; i++) {
				var row$ = $('<tr/>');
				for (var colIndex = 0; colIndex < columns.length; colIndex++) {
					var cellValue = laptop[i][columns[colIndex]];
					if (cellValue == null) cellValue = "";
					row$.append($('<td/>').html(cellValue));
				}
				$(selector).append(row$);
			}
		}
		function addAllColumnHeaders(laptop, selector) {
			var columnSet = [];
			var headerTr$ = $('<tr/>');

			for (var i = 0; i < laptop.length; i++) {
				var rowHash = laptop[i];
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



		window['CboxReady'] = function (Cbox) {
			Cbox('button', '7-849074-dqM8Oh');
		}
	</script>
	<script src="https://static.cbox.ws/embed/1.js" async></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

	<table id="excelDataTable" border="1">
	</table>
</body>
</html>
