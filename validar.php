<?php session_start();
require_once("conexion.php");


if ((isset($_POST["accion"])) and ($_POST["accion"] == "Ingresar")) {
  $nick = $_POST["nick"];
  $password = $_POST["password"];

  $sql1 = $db->Prepare("SELECT clave
                          FROM usuarios 
                          WHERE usuario = ?
                          AND estado <> 'X'   
                        ");
  $rs1 = $db->GetAll($sql1, array($nick));

  $clave_bd = $rs1 ? $rs1[0]["clave"] : 0;

  $sql2 = $db->Prepare("SELECT p.*
                          FROM personas p, usuarios u
                          WHERE u.usuario = ?
                          AND u.id_persona = p.id_persona
                          AND p.estado <> 'X'   
                          AND u.estado <> 'X'   
                        ");
  $rs2 = $db->GetAll($sql2, array($nick));

  if ($rs2) {
    $nombres = $rs2[0]["nombres"];
    $ap = $rs2[0]["ap"];
    $am = $rs2[0]["am"];
    $nom_completo = $nombres . " " . $ap . " " . $am;
  } else {
    $nom_completo = '';
  }

  if (password_verify($password, $clave_bd)) {
    $sql = $db->Prepare("SELECT u.*, ur.id_rol, r.rol
                           FROM usuarios u  
                           INNER JOIN usuarios_roles ur ON u.id_usuario = ur.id_usuario
                           INNER JOIN roles r ON ur.id_rol = r.id_rol
                           WHERE u.usuario = ?                           
                           AND u.estado <> 'X'
                           AND ur.estado <> 'X'
                           AND r.estado <> 'X'
                       ");
    $rs = $db->GetAll($sql, array($nick));

    if ($rs) {

      $db->Execute("UPDATE visitas SET contador = contador + 1 WHERE id = 1");

      // Obtener el valor actualizado
      $result = $db->GetRow("SELECT contador FROM visitas WHERE id = 1");
      $visitas = $result ? $result["contador"] : 0;
      $_SESSION['contador'] = $visitas; // Guardar en sesión

      foreach ($rs as $k => $linea) {
        $_SESSION["sesion_id_usuario"] = $linea["id_usuario"];
        $_SESSION["sesion_usuario"] = $linea["usuario"];
        $_SESSION["sesion_id_rol"] = $linea["id_rol"];
        $_SESSION["sesion_rol"] = $linea["rol"];
      }

      header('Location: template/principal.php');
      exit();
    }
  } else {
    $_SESSION['mensaje'] = "DATOS INCORRECTOS NO ENCUENTRA AL USUARIO!!!";
    $_SESSION['mensaje1'] = "POR FAVOR INTENTE NUEVAMENTE";
    header('Location: index.php');
    exit();
  }
} else {
  $_SESSION['mensaje'] = "CERRANDO LA SESION!!!!!!!!!!!";
  $_SESSION['mensaje1'] = "SE ESTA SALIENDO DEL SISTEMA............";
  session_destroy();
  header('Location: index.php');
  exit();
}
echo "</body>
      </html>";
