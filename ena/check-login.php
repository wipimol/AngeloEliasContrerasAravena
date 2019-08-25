<?php
session_start();
?>

<!doctype html>
<html lang="es">
	<head>
		<title>Verifique usuario y cree sesión</title>
		
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	</head>
	<body>
		<div class="container">
		
			<?php
			
			include 'conn.php';	
			
	
			$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

	
			if (!$conn) {
				die("Connection failed: " . mysqli_connect_error());
			}
			
		
			$email = $_POST['email']; 
			$password = $_POST['password'];
			
		
			$result = mysqli_query($conn, "SELECT Email, Password, Name FROM users WHERE Email = '$email'");
			
		
			$row = mysqli_fetch_assoc($result);
			
		
			$hash = $row['Password'];
			
		
			if (password_verify($_POST['password'], $hash)) {	
				
				$_SESSION['loggedin'] = true;
				$_SESSION['name'] = $row['Name'];
				$_SESSION['start'] = time();
				$_SESSION['expire'] = $_SESSION['start'] + (5 * 60) ;						
				
				echo "<div class='alert alert-success mt-4' role='alert'><strong>Bienvenido!</strong> $row[Name]			
				<p><a href='menu.php'>Ingesar Menu Pricipal</a></p>	
				<p><a href='cerrarsesion.php'>Cerrar Sesion</a></p></div>";	
			
			} else {
				echo "<div class='alert alert-danger mt-4' role='alert'>¡Datos Incorrectos!
				<p><a href='login.html'><strong>¡Inténtalo de nuevo!</strong></a></p></div>";			
			}	
			?>
		</div>

		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

	</body>
</html>