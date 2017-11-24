<!DOCTYPE html>

<html>
<head>
    <title>SIDOLA COMPUTER CENTER</title>
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

<body onLoad=CreateTableFromJSON()>
    <nav class="navigation">

       <ul>

          <li><a href="home"><span>Home</span></a></li>

          <li><a href="#"><span>Laptop</span></a></li>

          <li><a href="server"><span>Server</span></a></li>

          <li class="account"><a href="#"><span>Akun</span></a></li>

      </ul>

  </nav>
  <div id="showData"></div>
  <script>
      function CreateTableFromJSON() {
         var laptop={{.json}}

        // EXTRACT VALUE FOR HTML HEADER. 
        // ('Book ID', 'Book Name', 'Category' and 'Price')
        var col = [];
        for (var i = 0; i < laptop.length; i++) {
        	for (var key in laptop[i]) {
        		if (col.indexOf(key) === -1) {
        			col.push(key);
        		}
        	}
        }

        // CREATE DYNAMIC TABLE.
        var table = document.createElement("table");

        // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

        var tr = table.insertRow(-1);                   // TABLE ROW.

        for (var i = 0; i < col.length; i++) {
            var th = document.createElement("th");      // TABLE HEADER.
            th.innerHTML = col[i];
            tr.appendChild(th);
        }

        // ADD JSON DATA TO THE TABLE AS ROWS.
        for (var i = 0; i < laptop.length; i++) {

        	tr = table.insertRow(-1);

        	for (var j = 0; j < col.length; j++) {
        		var tabCell = tr.insertCell(-1);
        		tabCell.innerHTML = laptop[i][col[j]];
        	}
        }

        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        var divContainer = document.getElementById("showData");
        divContainer.innerHTML = "";
        divContainer.appendChild(table);
    }
    window['CboxReady'] = function (Cbox) {
    	Cbox('button', '7-849074-dqM8Oh');
    }
</script>
<script src="https://static.cbox.ws/embed/1.js" async></script>
</body>
</html>
