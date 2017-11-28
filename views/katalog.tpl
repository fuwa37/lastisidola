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
</style>
</head>
<body>
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
	</body>
	</html>