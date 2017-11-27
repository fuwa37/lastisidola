<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>SIDOLA COMPUTER CENTER</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	

<nav class="navigation">

	<ul>
		<a href="index"><span>Home</span></a>
	</ul>

</nav>
<form method="post" action="" id="user">
  <div>
    <h4>Login</h4>
  </div>
  <div>
    <label for="email">Email Address: <span class="required">*</span> </label>
    <input type="email" id="email" name="email" value="" placeholder="your@email.com" required="required" />
  </div>
  <div>
    <label for="password">Password: <span class="required">*</span> </label>
    <input type="password" id="password" name="password" value="" placeholder="" required="required" />
  </div>
  <div>
    <input type="submit" value="Submit" id="submit" />
  </div>
</form>
</body>
</html>