<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloDAO.VehiculoDAO"%>
<%@page import="ModeloVO.VehiculoVO"%>
        <%@include file="ses.jsp" %>    
       <link rel="stylesheet" type="text/css" href="css/main_forms.css">
        <title>Actualizar Perfil</title>
<%if(request.getParameter("UsuID") != null){%>
        <div class="wrapper">
            <div class="sa4d25">
                <div class="container-fluid">			
                    <div class="row">
        
                    <div class="col-md-10" id="contenedor_form">

                        <form class="contact100-form validate-form" action="Usuario" method="POST" onsubmit="return validacion()">
                            <div style="color: red">
                              <%if(request.getAttribute("MensageError") != null){%>
                                ${MensageError}
                              <%}else{%>
                                ${MensageExito}
                              <%}%>
                            </div>
                            
                            <span class="contact100-form-title">
                                Actualizar datos de usuario
                            </span>
                            

                                    <%
                                        UsuarioVO usVo = new UsuarioVO();
                                        UsuarioDAO usDAO = new UsuarioDAO(usVo);
                                        usVo = usDAO.searchCliente(request.getParameter("UsuID"));
                              
                                    %>
                           
                            <!-- INPUT Doble -->
                            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                                <span class="label-input100">Nombre</span>
                                <input class="input100" type="text" id="Nombre" name="Nombre" value="<%= usVo.getNombre() %>" required="">
                                <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                                <span class="label-input100">Apellido</span>
                                <input class="input100" type="text" id="Apellido" name="Apellido" value="<%= usVo.getApellido() %>" required="">
                                <span class="focus-input100"></span>
                            </div>
                            <!--END INPUT Doble -->

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Telefono</span>
                                <input class="input100" type="text" id="Telefono" name="Telefono" value="<%= usVo.getTelefono() %>" required="">
                                <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Correo</span>
                                <input class="input100" type="email" id="Corre" name="Corre" value="<%= usVo.getCorreo() %>"  required="">
                                <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Documento</span>
                                <input class="input100" type="text" id="Documento" name="Documento" value="<%= usVo.getDocumento()%>">
                                <span class="focus-input100"></span>
                            </div>


                            <input type="hidden" name="UsuarioID" value="<%= request.getParameter("UsuID") %>">
                            <input type="hidden" name="Tabla" value="cliente">
                            <input type="hidden" name="opcion" value="3">

                            <input type="submit" value="Modificar" class="upload_btn" style="width: 25%;">

                        </form>

                    </div>

        <%}else{%>
        
        
        <%  
            request.getRequestDispatcher("MenuUsuario.jsp").forward(request, response);
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
    <script src="js/validacion/usuario.js"></script>
    
    </body>
</html>
