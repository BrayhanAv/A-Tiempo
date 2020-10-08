<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login</title>
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
        <p class="h-sec">Porfavor digita los datos requeridos</p>
        <div style="color: black; margin-bottom: 20px;">
             <%if(request.getAttribute("MensageError") != null){%>
             ${MensageError}
             <%}else{%>
             ${MensageExito}
             <%}%>
        </div>
        <button class="toggle-log">REGÍSTRARSE</button>
      </div>
    </div>
    <div class="side-2">
      <div class="header">
        <h2 class="h-main">
          <h2 class="h-main"><a href="index.html"><img class="img-logo" src="images/logo_carrito.png" alt=""></a></h2></h2>
        <p class="h-sec">Coloca tus datos personales para empezar!</p>
        <button class="toggle-log">INGRESAR</button>
      </div>
    </div>
    <div class="forms">
      <div class="sign-up">
        <div class="form">
          <fieldset class="block">
            <h2 class="form-h">Registrarse</h2>
            <form method="POST" action="Usuario" onsubmit="return validacion()">
                <input class="input-text tool" id="Nombre" name="Nombre" placeholder="Nombre" type="text"/>
                
                <input class="input-text tool" id="Apellido" name="Apellido" placeholder="Apellido" type="text"/>

                <input class="input-text tool" id="password" name="password" placeholder="contraseña entre 8 y 16 digitos" type="password"/>

                <input class="input-text tool" id="Login" name="Login" placeholder="Login" type="text"/>

                <input class="input-text tool" id="Telefono" name="Telefono" placeholder="Telefono" type="text"/>

                <input class="input-text tool" id="Corre" name="Corre" placeholder="Correo" type="email"/>

                <input class="input-text tool" id="Documento" name="Documento" placeholder="Documento" type="text"/>

                <select id="Tabla"  name="Tabla" class="input-text tool">
                  <option value="cliente" > Cliente </option>
                  <option value="acarreador" > Acarreador </option>
                </select>

                <input type="hidden" name="opcion" value="1">

                <input class="input-submit" type="submit" value="Registrar"/>
              </form>
          </fieldset>
        </div>
      </div>
      <div class="sign-in">
        <div class="form">
          <fieldset>
              <h2 class="h-main"><a href="index.html"><img class="img-logo" src="images/logo_carrito.png" alt=""></a></h2>
            <h2 class="form-h">Iniciar Sesión</h2>
            
            <form method="POST" action="Usuario">
              <input class="input-text" name="Login" placeholder="Nombre de usuario" type="text"/>
              <input class="input-text" name="password" placeholder="Contraseña" type="password"/>
              <input type="hidden" name="opcion" value="2">
              <input class="input-submit" type="submit" value="Ingresar"/>
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
