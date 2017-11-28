<!DOCTYPE html>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
	.dropdown-submenu {
		position: relative;
	}

	.dropdown-submenu .dropdown-menu {
		top: 0;
		left: 100%;
		margin-top: -1px;
	}
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
      
      
    </ul>
    <ul>
		<div class="container">                                       
		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Katalog
				<span class="caret"></span></button>
				<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="laptop">Laptop</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="server">Server</a></li>
				</ul>
			</div>
		</div>
    </ul>

  </nav>


  <table id="excelDataTable" border="1">
  </table>

  <script>
    var myList = [{"ID":"acr-1","Merk":"Acer","Tipe":"TravelMate 6293-872G32Mn","Deskripsi":"Intel® Centrino® 2 processor technology, featuring: Intel® Core2 Duo processor P8700 (3 MB L2 cache, 2.53 GHz, 1066 MHz FSB, 25 W); Mobile Intel® GM45 Express Chipset; Intel® Wireless WiFi Link 802.11a/b/g/Draft-N) Wi-Fi CERTIFIED® network connection, featuring MIMO technology; Genuine Windows 7 Professional (32bit); 12.1\" WXGA TFT LCD Display with LED Backlight; Integrated 3G Modem Module, UMTS/HSPA at 850/1900/2100 MHz and quad-band GSM/GPRS/EDGE (850/900/1800/1900 MHz); 2GB DDR3 ; 320GB HDD with DASP (Disk Anti Shock Protection) Technology; DVD SuperMulti Double Layer Drive ; Integrated Bluetooth 2.1 + EDR; Crystal Eye webcam with Acer PrimaLite technology; Acer Bio-Protection fingerprint solution; TravelMate TPM (Trusted Platform Module) solution; Microsoft® Office Ready 2007 (60 Days)","Gambar":""},{"ID":"acr-2","Merk":"Acer","Tipe":"AS3810T-354G50n","Deskripsi":"Linux Operating System; Intel® Centrino® processor technology, featuring: Intel® Core®2 Solo processor SU3500 (3 MB L2 cache, 1.40 GHz, 800 MHz FSB, 5.50 W), supporting Intel® 64 architecture; Mobile Intel® GS45 Express Chipset; Intel® Wireless WiFi Link 802.11a/b/g/Draft-N; 13.3\" HD Acer CineCrystal LED-backlit TFT LCD; 16:9 aspect ratio; 4GB DDR3; 500GB HDD; Integrated Bluetooth; 5-in-1 Media Reader; HDMI port with HDCP support; Crystal Eye webcam with Acer PrimaLite technology; Dolby Sound Room®; 8+ hour battery life*\r\n*  Battery life indicated is with Acer PowerSmart Manager enabled \u0026 may vary depending on product specifications","Gambar":""},{"ID":"lnv-1","Merk":"Lenovo","Tipe":"Thinkpad X100e","Deskripsi":"AMD Athlon MV40; 11,6\" HD 1366 x 768 AntiGlare; 320 GB HDD 5400rpm; 2 GB PC3-5300 667MHz DDR2; ATI Radeon HD 3200 graphics; Realtek 802.11 bgn 1 x 2 (Wireless LAN); Trackpoint, Touchpad; Bluetooth, Camera, 4 in 1 Card Reader; No WWAN, USB Power, Windows 7 Professional 32; 6 cell 2.6 Ah/Up to 5hours; One Year Warranty part and labour; INCLUDED with Multiburner","Gambar":""},{"ID":"lnv-2","Merk":"Lenovo","Tipe":"ThinkPad T400s","Deskripsi":"Intel® Core 2 Duo Processor SP9600 (2.53 GHz, 6MB L2, 1066 MHz FSB); 14.1 \" WXGA + LED; 250GB HDD 5400rpm, 2GB PC3-8500 DDR3 1066MHz (up to 8GB); Intel Graphics Media Accelerator 4500MHD; Intel Wireless Wi-Fi Link 5100 (AGN), Bluetooth; Gigabit Ethernet, Fingerprint Reader, Camera, Trackpoint; DVD Recordable; 6 cell Li-Ion/Up to 5hours; Windows 7 Professional, Three years parts and labour","Gambar":""},{"ID":"lnv-3","Merk":"Lenovo","Tipe":"ThinkPad X301","Deskripsi":"Intel SU9400 (1.4GHz, 800MHz, 3MB); 13.3\" 1440 x 900; 2GB PC3-8500 1066MHz DDR3; 64 Solid State Drive; Intel 4500 MHD; Intel Wireless Wi-Fi Link 5100 (AGN); Bluetooth, Ultranav, Secure Chip; Finger Print, Camera, DVD Recordable; Win Vista Business, Three years parts and labour; FREE UPGRADE TO WINDOWS 7 PROFESSIONAL","Gambar":""}]

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
