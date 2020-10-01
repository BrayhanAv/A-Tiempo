<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ObjetoDAO"%>
<%@page import="ModeloVO.ObjetoVO"%>
<%@page import="ModeloVO.ObjetoVO"%>
<link rel="stylesheet" type="text/css" href="css/main_forms.css">
        <%@include file="ses.jsp" %>
            <div class="wrapper">
                <div class="sa4d25">
                    <div class="container-fluid">			
                        <div class="row">
                            <div class="col-md-10" id="contenedor_form">
                                                                <%      
                                                                    if(request.getParameter("AcarID") != null){
                                                                     String AcarreadorID = (String) request.getParameter("AcarID");
                                                                %>
                                                                  <form class="contact100-form validate-form" action="Comentario" method="POST" onsubmit="return Validar()">
                                                                        <span class="contact100-form-title">
                                                                            Comentar Usuario
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
                                                                        <div class="wrap-input100 validate-input">
                                                                            <span class="label-input100">Puntaje(1 - 5)</span>
                                                                            <input class="input100" type="number" id="punt" name="Puntaje" placeholder="Ingrese el puntaje que le desea poner al acarreador" required="">

                                                                            <span class="focus-input100" id="punts"></span>
                                                                        </div>

                                                                        <div class="wrap-input100 validate-input">
                                                                            <span class="label-input100">Comentario:</span>
                                                                            <textarea class="input100" name="Contenido" id="cont" value="">Ingrese un comentario refiriéndose a sus servicios.</textarea>
                                                                            <span class="focus-input100" id="conts"></span>
                                                                        </div>
                                                                        <!--END INPUT Doble -->

                                                                        <input type="hidden" name="ClienteID" value="<%= id %>">
                                                                        <input type="hidden" name="AcarreadorID" value="<%= AcarreadorID %>">

                                                                        <input type="hidden" name="opcion" value="1">

                                                                        <input type="submit" value="Comentar"  class="upload_btn" style="width: 25%;">
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
                        <script src="js/validacion/comentario.js"></script>
        <%        
            }else{
                request.getRequestDispatcher("listContratosCliente.jsp").forward(request, response);         
            }
        %>

