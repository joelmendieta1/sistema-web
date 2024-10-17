<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>login</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
</head>
<?php
session_start();

if (isset($_SESSION['mensaje']) && isset($_SESSION['mensaje1'])):
    // Generar alerta con JavaScript
    echo "<script>
        alert('" . $_SESSION['mensaje'] . "\\n" . $_SESSION['mensaje1'] . "');
    </script>";
    
    // Limpiar las variables de sesión
    unset($_SESSION['mensaje']);
    unset($_SESSION['mensaje1']);
endif;
?>

<body class="hold-transition login-page" >
<div class="login-box">
  <div class="login-logo">
    <label for="">INGRESAR AL SISTEMA</label>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Insertar usuario y contraseña</p>

      <form action="validar.php" method="post">
        <div class="input-group mb-3">
          <input type="text" id="nick" name="nick" class="form-control" placeholder="Usuario">
          <div class="input-group-append">
            <div class="input-group-text">
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" id="password" name="password" class="form-control" placeholder="Contraseña">
          <div class="input-group-append">
            <div class="input-group-text">
            </div>
          </div>
        </div>
        <div class="row justify-content-center"">
          <div class="col-6">
            <button type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">Ingresar</button>
          </div>
          <div class="col-6">
            <button type="reset" class="btn btn-danger btn-block">Cancelar</button>
          </div>
        </div>
      </form>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- REQUIRED SCRIPTS -->

  <!-- jQuery -->
  <script src="plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="dist/js/adminlte.min.js"></script>

</body>
</html>
