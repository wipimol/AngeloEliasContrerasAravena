<?php
session_start();
?>

<!doctype html>
<html lang="es">
  <head>
    <title>Menu Principal</title>
	
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
  
  <body>      
    <?php
    if (isset($_SESSION['loggedin'])) {  
    }
    else {
        echo "<div class='alert alert-danger mt-4' role='alert'>
        <h4>Necesita iniciar sesión para acceder a esta página.</h4>
        <p><a href='login.html'>Loguear Aqui!</a></p></div>";
        exit;
    }

    $now = time();           
    if ($now > $_SESSION['expire']) {
        session_destroy();
        echo "<div class='alert alert-danger mt-4' role='alert'>
        <h4>¡Tu sesión ha caducado!</h4>
        <p><a href='login.html'>Loguear Aqui!</a></p></div>";
        exit;
        }
    ?>

    <div class="container">
        <p>Bienvenido(a): <?php echo $_SESSION['name']; ?></p>
        <h3>Menu Principal</h3>
        <ul>
            <li><p><a href="ingresar.php">Ingresar requerimiento</a></p></li>
            <li><p><a href="consultar.php">Consultar requerimiento</a></p></li>
            <li><p><a href="cerrar.php">Cerrar requerimiento</a></p></li>
            
        </ul>
        <p><a href="cerrarsesion.php">Cerrar sesion</a></p>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

	</body>
</html>