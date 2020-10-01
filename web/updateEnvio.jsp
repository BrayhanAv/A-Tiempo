<%@page import="ModeloDAO.VehiculoDAO"%>
<%@page import="ModeloVO.VehiculoVO"%>
        <%@include file="ses.jsp" %>    
        <link rel="stylesheet" type="text/css" href="css/main_forms.css">
        <title>Actualizar Envio</title>
        

        <%if(request.getParameter("EnID") != null){%>

        
        <div class="wrapper">
          <div class="sa4d25">
            <div class="container-fluid">			
              <div class="row">
                  <div class="col-md-10" id="contenedor_form">

                  <form class="contact100-form validate-form" action="Envio" method="POST">
                      <span class="contact100-form-title">
                          Actualizar datos del Envio
                      </span>
                      <div style="color: red">
                        <%if(request.getAttribute("MensageError") != null){%>
                          ${MensageError}
                        <%}else{%>
                          ${MensageExito}
                        <%}%>
                      </div>

                      <%
                                EnvioVO ENvo = new EnvioVO();
                                EnvioDAO vhDa = new EnvioDAO(ENvo);
                                EnvioVO EnVO2 = vhDa.search(request.getParameter("EnID"));
                        %>
                      
                      <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                          <span class="label-input100">Presupuesto del envio</span>
                          <input class="input100" type="number" name="Presupuesto" value="<%= EnVO2.getPresupuesto() %>" required="">
                          <span class="focus-input100"></span>
                      </div>
                      <!-- END INPUT entero -->

                      <!-- INPUT Doble -->
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Direccion Inicial</span>
                          <input class="input100" type="text" name="PuntoIN" value="<%= EnVO2.getPuntoIn()%>" required="">
                          <span class="focus-input100"></span>
                      </div>
                  
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Direccion Final</span>
                          <input class="input100" type="text" name="PuntoFN" value="<%= EnVO2.getPuntoFn()%>" required="">
                          <span class="focus-input100"></span>
                      </div>
                      <!--END INPUT Doble -->

                      <!-- INPUT Doble -->
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Fecha Inicial</span>
                          <input class="input100" type="date" name="FechaIN" value="<%= EnVO2.getFechaIn()%>" required="">
                          <span class="focus-input100"></span>
                      </div>
                  
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Fecha Final</span>
                          <input class="input100" type="date" name="FechaFN" value="<%= EnVO2.getFechaFn()%>" required="">
                          <span class="focus-input100"></span>
                      </div>
                      <!--END INPUT Doble -->
                      
                      <input type="hidden" name="opcion" value="3">
        
                      <input type="hidden" name="EnvioID" value="<%= request.getParameter("EnID") %>">
                  
                      <input type="submit" value="Actualizar"  class="upload_btn" style="width: 25%;">
                  </form>

              </div>
            </div>
    </div>
</div>
      </div>
        
        
        <%}else{
            request.getRequestDispatcher("listVehiculos.jsp").forward(request, response);
            } 
        %>


    <script src="js/vertical-responsive-menu.min.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/OwlCarousel/owl.carousel.js"></script>
    <script src="vendor/semantic/semantic.min.js"></script>
    <script src="js/night-mode.js"></script>
    <script src="js/custom.js"></script>
    </body>
</html>
