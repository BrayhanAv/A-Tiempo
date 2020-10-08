<%@page import="ModeloDAO.VehiculoDAO"%>
<%@page import="ModeloVO.VehiculoVO"%>
        <%@include file="ses.jsp" %>    
       <link rel="stylesheet" type="text/css" href="css/main_forms.css">
        <title>Actualizar vehiculo</title>
<%if(request.getParameter("Vid") != null){%>
        <div class="wrapper">
            <div class="sa4d25">
                <div class="container-fluid">			
                    <div class="row">
        
                    <div class="col-md-10" id="contenedor_form">

                        <form class="contact100-form validate-form" action="Vehiculo" method="POST">
                            <span class="contact100-form-title">
                                Actualizar datso del vehiculo
                            </span>
                            <div style="color: red">
                              <%if(request.getAttribute("MensageError") != null){%>
                                ${MensageError}
                              <%}else{%>
                                ${MensageExito}
                              <%}%>
                            </div>

                                    <%
                                        VehiculoVO VH = new VehiculoVO();
                                        VehiculoDAO vhDa = new VehiculoDAO(VH);
                                        VehiculoVO VH2 = vhDa.search(request.getParameter("Vid"));
                                    %>

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Placa del vehiculo No modificable</span>
                                <input class="input100" type="text" name="Placa" value="<%=VH2.getPlaca()%>" readonly="readonly" required="">
                                <span class="focus-input100"></span>
                            </div>
                            <!-- END INPUT entero -->

                            <!-- INPUT Doble -->
                            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                                <span class="label-input100">Modelo No modificable</span>
                                <input class="input100" type="text" name="Modelo" value="<%=VH2.getModelo()%>" readonly="readonly" required="">
                                <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                                <span class="label-input100">Marca No modificable</span>
                                <input class="input100" type="text" name="Marca" value="<%=VH2.getMarca()%>" readonly="readonly" required="">
                                <span class="focus-input100"></span>
                            </div>
                            <!--END INPUT Doble -->

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Peso del vehiculo No modificable</span>
                                <input class="input100" type="text" name="Peso" value="<%=VH2.getPeso()%>" readonly="readonly" required="">
                                <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Extra especificaciones del vehiculo</span>
                                <input class="input100" type="text" name="Extra"value="<%=VH2.getExtra()%>"  required="">
                                <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Foto</span>
                                <input class="input100" readonly="readonly" type="text" name="Foto" value="<%=VH2.getFoto()%>">
                                <span class="focus-input100"></span>
                            </div>


                            <input type="hidden" name="IdAcarr" value="<%= id %>">

                            <input type="hidden" name="opcion" value="1">

                            <input type="submit" value="Registrar" class="upload_btn" style="width: 25%;">

                        </form>

                    </div>

        <%}else{%>
        
        
        <%  
            request.getRequestDispatcher("listVehiculos.jsp").forward(request, response);
            } 
        %>
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
