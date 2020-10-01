<%-- 
    Document   : listVehiculos
    Created on : 25/07/2020, 10:57:11 PM
    Author     : Brayhan
--%>

<%@page import="ModeloDAO.SubastaDAO"%>
<%@page import="ModeloVO.SubastaVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@include file="ses.jsp" %>
        <title>Listado Subastas</title>
	<div class="wrapper">
		<div class="sa4d25">
			<div class="container-fluid">			
				<div class="col-md-10" style="margin-left: 8%;">
					<div class="_14d25">
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

                                                                    if(subDAO.list(id)!= null){
                                                                            Listado = subDAO.list(id);
                                                                            Iterator<SubastaVO> Iter = Listado.iterator();
                                                                            while(Iter.hasNext()){                        
                                                                                    SubastaVO sub = Iter.next();
                                                                                    EnvioVO  EnVO = new EnvioVO();
                                                                                    EnvioDAO EnDAO = new EnvioDAO(EnVO); 

                                                                                    EnvioVO EnVO2 = EnDAO.search(sub.getEnvioID());
                                                            %>

								<div class="col-lg-5 col-md-4">
									<div class="fcrse_1 mt-30">
										<a href="listLicitaciones.jsp?SubID=<%=sub.getSubastaID()%>" class="fcrse_img">
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
											<div class="eps_dots more_dropdown">
												<a href="#"><i class="uil uil-ellipsis-v"></i></a>
												<div class="dropdown-content">
                                                                                                    <form action="Subasta" method="POST">
                                                                                                        <input type="hidden" name="opcion" value="2">
                                                                                                        <input type="hidden" name="SubastaID" value="<%= sub.getSubastaID() %>">
                                                                                                        <span> <input style="width: 100%; border: none; background-color: transparent;" class="boton_personal" type="submit" value="Eliminar"/> </span>
                                                                                                    </form>
												</div>																											
											</div>
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
