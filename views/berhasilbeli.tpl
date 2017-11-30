<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>SIDOLA COMPUTER CENTER</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<nav class="navigation">

		<ul>
			<a href="home"><span>Home</span></a>
		</ul>

	</nav>
	<h3>Sukses!</h3>
	<div id="element-to-print"><iframe id="invoice" width="600" height="400"></iframe></div>
	<button onclick="downloadCurrentDocument()">Download Invoice(HTML)</button>
</body>
<script type="text/javascript">
	
	var iframe = document.getElementById('invoice'),
	iframedoc = iframe.contentDocument || iframe.contentWindow.document;

	iframedoc.body.innerHTML = {{.LayoutContent}};

	document.getElementById('demo').innerHTML = {{.LayoutContent}};

	function downloadCurrentDocument() {
		var base64doc = btoa(unescape(encodeURIComponent({{.LayoutContent}}))),
		a = document.createElement('a'),
		e = new MouseEvent('click');

		a.download = 'invoice.html';
		a.href = 'data:text/html;base64,' + base64doc;
		a.dispatchEvent(e);
	}

	var element = document.getElementById('element-to-print');
</script>
<script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
<script src="html2pdf.bundle.min.js"></script>.
</html>