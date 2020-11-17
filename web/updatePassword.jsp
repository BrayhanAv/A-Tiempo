<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>RecuperarContraseña</title>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,800" rel="stylesheet">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.7.2/css/all.min.css'><link rel="stylesheet" href="assets/css/style-ing.css">
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
</head>
<body>

<!-- partial:index.partial.html -->
<div class="fondo">
  <div class="container">
    <div class="side-1">
      <div class="header">
        <p class="h-sec">Dijite los datos para resibir un correo</p>
        <div style="color: black; margin-bottom: 20px;">
             <%if(request.getAttribute("MensageError") != null){%>
             ${MensageError}
             <%}else{%>
             ${MensageExito}
             <%}%>
        </div>
      </div>
    </div>
    <div class="forms">
      <div class="sign-in">
        <div class="form">
          <fieldset>
              <h2 class="h-main"><a href="index.html"><img class="img-logo" src="images/logo_carrito.png" alt=""></a></h2>
            <h2 class="form-h">Recuperar Contraseña</h2>
            
            <form method="POST" action="Usuario" onsubmit="return validacion()">
                <input class="input-text" name="Login" id="Login" placeholder="Nombre de usuario" type="text" required/>
                <input class="input-text" name="Corre" id="Corre" placeholder="Correo electronico" type="Email" required/>
              <input type="hidden" name="opcion" value="4">
              <a href="login.jsp">¿Ya tienes una sesion?, ingresa</a>
              <input class="input-submit" type="submit" value="Enviar"/>
            </form>
          </fieldset>
        </div>
      </div>
    </div>
  </div>
</div>
  <!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
  <script  src="assets/js/script-ing.js"></script>
  <script src="js/validacion/usuario.js"></script>

</body>
</html>
