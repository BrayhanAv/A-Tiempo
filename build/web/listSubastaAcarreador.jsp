<%-- 
    Document   : listVehiculos
    Created on : 25/07/2020, 10:57:11 PM
    Author     : Brayhan
--%>

<%@page import="ModeloDAO.VehiculoDAO"%>
<%@page import="ModeloVO.VehiculoVO"%>
<%@page import="ModeloDAO.SubastaDAO"%>
<%@page import="ModeloVO.SubastaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
        <%@include file="ses.jsp" %>
        <title>Listado Subastas</title>
        <div class="wrapper">
            <div class="sa4d25">
                <div class="container-fluid">			
                    <div class="row">
			<div class="col-md-10" style="margin-left: 8%;">
                            <h4 class="mhs_title" style="font-size: 25px;">Listado de Subastas</h4>
                                                <div style="color: red">
                                                        <%if(request.getAttribute("MensageError") != null){%>
                                                        ${MensageError}
                                                        <%}else{%>
                                                        ${MensageExito}
                                                        <%}%>
                                                </div>
						<div class="row">   
			
                                                            <%
                                                                    ArrayList<SubastaVO> Listado = new ArrayList<SubastaVO>();
                                                                    SubastaVO subVO = new SubastaVO();
                                                                    SubastaDAO subDAO = new SubastaDAO(subVO);
                                                                 
                                                                    ArrayList<VehiculoVO> Listado2 = new ArrayList<VehiculoVO>();
                                                                    VehiculoVO VhVO = new VehiculoVO();
                                                                    VehiculoDAO VhDAO = new VehiculoDAO(VhVO);

                                                                    if(VhDAO.list(id)!= null){
                                                                       Listado2 = VhDAO.list(id);
                                                                       Iterator<VehiculoVO> Iter2 = Listado2.iterator();

                                                                       if(Iter2.hasNext()){
                                                                           System.out.println("Tienes carritos");
                                                                                if(subDAO.listAcarreador()!= null){
                                                                                        Listado = subDAO.listAcarreador();
                                                                                        Iterator<SubastaVO> Iter = Listado.iterator();
                                                                                        while(Iter.hasNext()){                        
                                                                                                SubastaVO sub = Iter.next();
                                                                                                EnvioVO  EnVO = new EnvioVO();
                                                                                                EnvioDAO EnDAO = new EnvioDAO(EnVO); 

                                                                                                EnvioVO EnVO2 = EnDAO.search(sub.getEnvioID());
                                                            %>

								<div class="col-lg-5 col-md-4">
									<div class="fcrse_1 mt-30">
										<a href="newlicitacion.jsp?SubID=<%= sub.getSubastaID()%>" class="fcrse_img">
											<img src="images/courses/img-1.jpg" alt="">
											<div class="course-overlay">
												<div class="crse_reviews"> <%= sub.getSubastaID()%> </div>
												<div class="badge_seller"> <%= EnVO2.getPuntoIn() %> -- <%= EnVO2.getPuntoFn()%> </div>
												<div class="crse_timer">
													<%= EnVO2.getFechaIn() %>  -  <%= EnVO2.getFechaFn() %>
												</div>
											</div>
										</a>
										<div class="fcrse_content">
											
											<div class="vdtodt">
												<span class="vdt14">Peso total: <%= EnVO2.getPesoTotal()%>kg</span>
											</div>
											<a href="course_detail_view.html" class="crse14s"></a>
											<p href="#" class="crse-cate">Fecha limite de subasta: <%= sub.getFechaFin()%> </p>
											<div class="auth1lnkprce">
												<p class="cr1fot">By <%= EnVO2.getClienteID()%></p>
												<div class="prce142">$<%= EnVO2.getPresupuesto()%></div>
											</div>
										</div>
									</div>	       												
								</div>

									<%            
											}
										}
                                                                            }else{
                                                                        %>
                                                                        <h5 class="mhs_title" style="font-size: 15px;">No tienes vehiculos para poder participar</h5>
                                                                        <%
                                                                       }
                                                                    }
                                                                %>
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

