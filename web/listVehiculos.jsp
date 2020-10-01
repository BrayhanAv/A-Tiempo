<%-- 
    Document   : listVehiculos
    Created on : 25/07/2020, 10:57:11 PM
    Author     : Brayhan
--%>

<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.VehiculoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloVO.VehiculoVO"%>
        <%@include file="ses.jsp" %>
        <title>Listado Vehiculos</title>
        <div class="wrapper">
            <div class="sa4d25">
                <div class="container-fluid">			
                    <div class="row">
                                        
                                        <!-- Adaptar -->
                  
                                        <div class="col-md-10" style="margin-left: 8%;">
						<div class="_14d25 mb-20">						
							<div class="row">
								<div class="col-md-12">
									<h4 class="mhs_title" style="font-size: 25px;">Tus vehículos</h4>
                                                                        <h5 class="mhs_title" style="font-size: 15px;">Manten tus vehiculos en buen estado</h5>
                                                                        
									<%
                                                                             ArrayList<VehiculoVO> Listado = new ArrayList<VehiculoVO>();
                                                                            VehiculoVO VhVO = new VehiculoVO();
                                                                            VehiculoDAO VhDAO = new VehiculoDAO(VhVO);

                                                                            if(VhDAO.list(id)!= null){
                                                                               Listado = VhDAO.list(id);
                                                                               Iterator<VehiculoVO> Iter = Listado.iterator();
                                                                               while(Iter.hasNext()){                        
                                                                                   VehiculoVO veh = Iter.next();
                                                                        %>
									<div class="fcrse_1" style="margin-bottom: 20px;">
										<a href="#" class="hf_img">
											<img src="images/about/title_bg.jpg" alt="">
											<div class="course-overlay">
												<div class="crse_reviews"> Placa: <%= veh.getPlaca()%> </div>
											</div>
										</a>
										<div class="hs_content">
											<div class="eps_dots eps_dots10 more_dropdown">
												<a href="#"><i class="uil uil-ellipsis-v"></i></a>
												<div class="dropdown-content">
                                                                                                    <a href="updateVehiculo.jsp?Vid=<%=veh.getPlaca()%>" style="text-align: center"> <span> Modificar </span> </a> 

                                                                                                    <form action="Vehiculo" method="POST">
                                                                                                        <input type="hidden" name="Placa" value="<%= veh.getPlaca() %>">
                                                                                                        <input type="hidden" name="opcion" value="3">
                                                                                                        <span>
                                                                                                            <input style=" border: none; background-color: transparent;" class="boton_personal" type="submit" value="Eliminar"/>
                                                                                                        </span>
                                                                                                    </form>
												</div>																											
											</div>
											<div class="vdtodt">
												<span class="vdt14">Peso: <%= veh.getPeso()%> </span>
												
											</div>
											<p href="" class="cr1fot">
                                                                                            Este es un vehiculo identificado con la placa: <%= veh.getPlaca()%> , es de marca <%= veh.getMarca()%>, modelo <%= veh.getModelo()%> y 
                                                                                            tiene una capacidad de <%= veh.getPeso()%> Toneladas
                                                                                            con estas extraespecificaciones <%= veh.getExtra()%>
											</p>
											<a href="#" class="crse-cate"></a>
											<div class="auth1lnkprce">
                                                                                            <p class="cr1fot"> <%= veh.getMarca()%> - <%= veh.getModelo()%> </p>
												<div class="prce142"><%= veh.getExtra()%></div>
											</div>
                                                                                </div>
                                                                          </div>	
                                                                        <%      }
                                                                            }
                                                                        %>

							</div>																		
						</div>								
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
