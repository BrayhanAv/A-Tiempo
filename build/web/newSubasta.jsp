<%@page import="java.util.Date"%>
<%@include file="ses.jsp" %>
<link rel="stylesheet" type="text/css" href="css/main_forms.css">


<title> Registrar Subasta</title>
<% 
    if(request.getParameter("EnID") != null){
%>
         <div class="wrapper">
          <div class="sa4d25">
            <div class="container-fluid">			
              <div class="row">
                  <div class="col-md-10" id="contenedor_form">

                  <form class="contact100-form validate-form" action="Subasta" method="POST">
                      <span class="contact100-form-title">
                          Subastar Envio
                      </span>
                      <div style="color: red">
                        <%if(request.getAttribute("MensageError") != null){%>
                          ${MensageError}
                        <%}else{%>
                          ${MensageExito}
                        <%}%>
                      </div>

                      <!-- END INPUT entero -->

                      <!-- INPUT Doble -->
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Fecha de Inicio</span>
                          <input class="input100" type="date" name="FechaIN" value="" required="">
                          
                          <span class="focus-input100"></span>
                      </div>
                  
                      <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                          <span class="label-input100">Fecha de Finalizacion</span>
                          <input class="input100" type="date" name="FechaFN" value="" required="">
                          <span class="focus-input100"></span>
                      </div>
                      <!--END INPUT Doble -->

                      <input type="hidden" name="opcion" value="1">

                      <input type="hidden" name="EnvioID" value="<%= request.getParameter("EnID") %>">
                  
                      <input type="submit" value="Subastar"  class="upload_btn" style="width: 25%;">
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
    <%     
    }else{
        request.getRequestDispatcher("listEnvios.jsp").forward(request, response);
    }
    %>
</html>
