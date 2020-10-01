<%@page import="ModeloDAO.ObjetoDAO"%>
<%@page import="ModeloVO.ObjetoVO"%>
<%@page import="ModeloDAO.VehiculoDAO"%>
<%@page import="ModeloVO.VehiculoVO"%>
<link rel="stylesheet" type="text/css" href="css/main_forms.css">
<link href="css/instructor-dashboard.css" rel="stylesheet">
        <%@include file="ses.jsp" %>    
        <title>Actualizar Objeto</title>
        <div class="wrapper">
            <div class="sa4d25">
                <div class="container-fluid">
                <div class="row">
                  <div class="col-md-10" id="contenedor_form">
                        <div style="color: red">
                            <%if(request.getAttribute("MensageError") != null){%>
                            ${MensageError}
                            <%}else{%>
                            ${MensageExito}
                            <%}%>
                        </div>
        
                        <%if(request.getParameter("ObjID") != null){%>
                        <form class="contact100-form validate-form" action="Objeto" method="POST">
                            <span class="contact100-form-title">
                                Modificar Objeto
                            </span>
                            
                            <% String EnvioID = request.getParameter("EnvioID"); %>
                            <%
                                ObjetoVO Obj = new ObjetoVO();
                                ObjetoDAO vhDa = new ObjetoDAO(Obj);
                                ObjetoVO Obj2 = vhDa.search(request.getParameter("ObjID"));
                            %>

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Nombre del Objeto</span>
                                <input class="input100" type="text" name="Nombre" value="<%= Obj2.getNombre() %>" required="">
                                <span class="focus-input100"></span>
                            </div>
                            <!-- END INPUT entero -->

                            <!-- INPUT Doble -->
                            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                                <span class="label-input100">Peso del Objeto</span>
                                <input class="input100" type="number" name="Peso" value="<%= Obj2.getPeso()%>" required="">
                                <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                                <span class="label-input100">Tamaño del Objeto</span>
                                <input class="input100" type="number" name="Tam" value="<%= Obj2.getTam()%>" required="">
                                <span class="focus-input100"></span>
                            </div>
                            <!--END INPUT Doble -->

                            <div class="wrap-input100 validate-input"> <!-- INPUT entero -->
                                <span class="label-input100">Descripcion del Objeto</span>
                                <textarea class="input100" name="Desc"><%= Obj2.getDescripcion()%></textarea>
                                <span class="focus-input100"></span>
                            </div>
                            <!-- END INPUT entero -->

                            <input type="hidden" name="EnvioID" value="<%= request.getParameter("EnvioID") %> ">
                            <input type="hidden" name="ObjID" value="<%= request.getParameter("ObjID") %> ">
                            <input type="hidden" name="opcion" value="3">

                            <input type="submit" value="Modificar" class="upload_btn" style="width: 25%;">
                        </form>

                    </div>
                  </div>
                </div>			                              
              </div>
            </div>
        <%
            }else{
                request.getRequestDispatcher("listObjetos.jsp").forward(request, response);
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
