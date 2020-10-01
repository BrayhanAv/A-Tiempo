

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>A Tiempo - Menu</title>
        <link rel="icon" type="image/png" href="images/favicon.ico">
    </head>
    <body>

        <%@include file="ses.jsp" %>

        <% if(Rol.equals("acarreador")){ %>
                <!-- acarreador -->


        <% }else if(Rol.equals("cliente")){ %>
                <!-- cliente -->    
   			<div class="wrapper">
				<div class="sa4d25">
					<div class="container-fluid">			
						<div class="row">
							<div class="col-xl-9 col-lg-8">
                        								<div class="section3125 mt-50">
									<h4 class="item_title">Listado de envios</h4>
									<a href="listEnvios.jsp" class="see150">Ver todas</a>
									<div class="la5lo1">
										<div class="owl-carousel top_instrutors owl-theme">
                                                                                        <%
                                                                                            ArrayList<EnvioVO> Listado = new ArrayList<EnvioVO>();
                                                                                            EnvioVO SbVO = new EnvioVO();
                                                                                            EnvioDAO SbDAO = new EnvioDAO(SbVO);

                                                                                            if(SbDAO.List(id)!= null){
                                                                                            Listado = SbDAO.List(id);
                                                                                            Iterator<EnvioVO> Iter = Listado.iterator();
                                                                                            while(Iter.hasNext()){                        
                                                                                                EnvioVO veh = Iter.next();
                                                                                        %>
 											<div class="item">
												<div class="fcrse_1 mb-20">
													<div class="envio_img">	
														<p class="txt">Presupuesto: <%= veh.getPresupuesto() %>$</p>										
													</div>
													<div class="tutor_content_dt">

														<div class="tutor_cate"><%= veh.getFechaIn()%>  -  <%= veh.getFechaFn()%></div>
														<div class="tutor_cate"> <a class="link" href="#ver_ruta"><%= veh.getPuntoIn()%> - <%= veh.getPuntoFn()%></a> </div>
														<ul class="tutor_social_links">
															<a href="listObjetos.jsp?EnvioID=<%= veh.getEnvioID()%>"><span class="vdt15">Ver objetos</span></a>
                                                                                                                        <span class="vdt15">Peso total: <%= veh.getPesoTotal()%> kg</span>
														</ul>
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
			</div>
                  
                  
        <% } %>
        
        		<script src="js/vertical-responsive-menu.min.js"></script>
			<script src="js/jquery-3.3.1.min.js"></script>
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<script src="vendor/OwlCarousel/owl.carousel.js"></script>
			<script src="vendor/semantic/semantic.min.js"></script>
			<script src="js/night-mode.js"></script>
                        <script src="js/custom.js"></script>
    </body>
</html>
