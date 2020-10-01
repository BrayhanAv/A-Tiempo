<%@include file="ses.jsp" %>
<link rel="stylesheet" type="text/css" href="css/main_forms.css">

<title> Registrar Envio</title>
        
        <div class="wrapper">
          <div class="sa4d25">
            <div class="container-fluid">			
              <div class="row">
                  <div class="col-md-10" id="contenedor_form">

                  <form class="contact100-form validate-form" action="Envio" method="POST">
                      <span class="contact100-form-title">
                          Registrar Nuevo Envio
                      </span>
                      <div style="color: red">
                        <%if(request.getAttribute("MensageError") != null){%>
                          ${MensageError}
                        <%}else{%>
                          ${MensageExito}
                        <%}%>
                      </div>

                      <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                          <span class="label-input100">Presupuesto del envio</span>
                          <input class="input100" type="number" name="Presupuesto" placeholder="Ingrese el presupuesto inicial" required="">
                          <span class="focus-input100"></span>
                      </div>
                      <!-- END INPUT entero -->

                      <!-- INPUT Doble -->
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Direccion Inicial</span>
                          <input class="input100" type="text" name="PuntoIN" placeholder="Ingrese la direccion donde se encuentra el paquete" required="">
                          <span class="focus-input100"></span>
                      </div>
                  
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Direccion Final</span>
                          <input class="input100" type="text" name="PuntoFN" placeholder="Ingrese la direccion a la que se dirije el paquete" required="">
                          <span class="focus-input100"></span>
                      </div>
                      <!--END INPUT Doble -->

                      <!-- INPUT Doble -->
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Fecha Inicial</span>
                          <input class="input100" type="date" name="FechaIN" placeholder="Ingrese la fecha a la que inicia el envio" required="">
                          <span class="focus-input100"></span>
                      </div>
                  
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Fecha Final</span>
                          <input class="input100" type="date" name="FechaFN" placeholder="Ingrese la Fecha maxima permitida para realizar el envio" required="">
                          <span class="focus-input100"></span>
                      </div>
                      <!--END INPUT Doble -->
                      
                      <input type="hidden" name="ClID" value="<%= id %>">

                      <input type="hidden" name="opcion" value="1">
                  
                      <input type="submit" value="Enviar" value="Registrar" class="upload_btn" style="width: 25%;">
                  </form>

              </div>
						</div>
					</div>
				</div>
      </div>
      <script src="js/vertical-responsive-menu.min.js"></script>
      <script src="js/jquery-3.3.1.min.js"></script>
      <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="vendor/OwlCarousel/owl.carousel.js"></script>
      <script src="vendor/semantic/semantic.min.js"></script>
      <script src="js/night-mode.js"></script>
      <script src="js/custom.js"></script>    
    </body>
</html>