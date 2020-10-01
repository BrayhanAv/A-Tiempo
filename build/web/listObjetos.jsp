<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.pujaDAO"%>
<%@page import="ModeloVO.pujaVO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="ses.jsp" %>
<link rel="stylesheet" type="text/css" href="css/main_forms.css">
<link href="css/instructor-dashboard.css" rel="stylesheet">
<% 
if(request.getParameter("EnvioID") != null){
%>

        <title>Listado Objetos</title>
                            
            <div class="wrapper">
            <div class="sa4d25">
                <div class="container-fluid">
                <div class="row">
                  <div class="col-md-10" id="contenedor_form">
                        <form class="contact100-form validate-form" action="Objeto" method="POST">
                            <span class="contact100-form-title">
                                Registrar nuevo objeto
                            </span>
                            <div style="color: red">
                              <%if(request.getAttribute("MensageError") != null){%>
                                ${MensageError}
                              <%}else{%>
                                ${MensageExito}
                              <%}%>
                            </div>
                            <% String EnvioID = request.getParameter("EnvioID"); %>

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Nombre del Objeto</span>
                                <input class="input100" type="text" name="Nombre" placeholder="Ingrese el nombre del objeto" required="">
                                <span class="focus-input100"></span>
                            </div>
                            <!-- END INPUT entero -->

                            <!-- INPUT Doble -->
                            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                                <span class="label-input100">Peso del Objeto</span>
                                <input class="input100" type="number" name="Peso" placeholder="Ingrese la direccion donde se encuentra el paquete" required="">
                                <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                                <span class="label-input100">Tamaño del Objeto</span>
                                <input class="input100" type="number" name="Tam" placeholder="Ingrese el objeto del tamaño" required="">
                                <span class="focus-input100"></span>
                            </div>
                            <!--END INPUT Doble -->

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Descripcion del Objeto</span>
                                <textarea class="input100" name="Desc" placeholder="Ingrese la fecha a la que inicia el envio"></textarea>
                                <span class="focus-input100"></span>
                            </div>
                            <!-- END INPUT entero -->



                            <input type="hidden" name="EnvioID" value="<%= EnvioID %>">

                            <input type="hidden" name="opcion" value="1">

                            <input type="submit" value="Registrar" class="upload_btn" style="width: 25%;">
                        </form>

                    </div>
                  </div>
                  <div class="col-lg-11 col-md-5" style="margin-left: 5%; margin-bottom: 40px;">
                    <div class="table-responsive mt-30" style="width: 97%; ">
                      <%@include file="includes/listadoObjetos.jsp" %>
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


<%
}else{
    request.getRequestDispatcher("listEnvios.jsp").forward(request, response);
}
%>