<%@page import="ModeloDAO.EnvioDAO"%>
<%@page import="ModeloVO.EnvioVO"%>
<%@page import="ModeloVO.EnvioVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.SubastaDAO"%>
<%@page import="ModeloVO.SubastaVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
		
	<!-- Mirrored from gambolthemes.net/html-items/cursus_demo_f12/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Jun 2020 12:49:44 GMT -->
	<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, shrink-to-fit=9">
			<meta name="description" content="Gambolthemes">
			<meta name="author" content="Gambolthemes">		
			<title>A tiempo - Menu</title>
			
			<!-- Favicon Icon -->
			<link rel="icon" type="image/png" href="images/favicon.ico">
			
			<!-- Stylesheets -->
			<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet'>
			<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
			<link href="css/vertical-responsive-menu.min.css" rel="stylesheet">
			<link href="css/style.css" rel="stylesheet">
			<link href="css/responsive.css" rel="stylesheet">
			<link href="css/style_personal.css" rel="stylesheet">
			<link href="css/night-mode.css" rel="stylesheet">
			
			<!-- Vendor Stylesheets -->
			<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
			<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
			<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
			<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
			<link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">	
			
	</head>

	<body>
		<!-- Contenido -->
		<%@include file="ses.jsp" %> 


		<div style="color: red">
			<%if(request.getAttribute("MensageError") != null){%>
				${MensageError}
			<%}else{%>
				${MensageExito}
			<%}%>
		</div>     
							
		<div class="wrapper">
			<div class="sa4d25">
				<div class="container-fluid">			
					<div class="row">
			
						<div class="col-md-10" style="margin-left: 8%;">
							<div class="_14d25 mb-20">						
								<div class="row">
									<div class="col-md-12">
										<h4 class="mhs_title" style="font-size: 25px;">Listado de Contratos</h4>	
											<%
												ArrayList<EnvioVO> Listado = new ArrayList<EnvioVO>();
												EnvioVO SbVO = new EnvioVO();
												EnvioDAO SbDAO = new EnvioDAO(SbVO);

												if(SbDAO.ListContrato(id)!= null){
												Listado = SbDAO.ListContrato(id);
												Iterator<EnvioVO> Iter = Listado.iterator();
												while(Iter.hasNext()){                        
													EnvioVO veh = Iter.next();
											%>
                                                                                                   <div class="press_item mt-30" style="height: 35vh; overflow: hidden;">
                                                                                                       
                                                                                                        <div class="vdtopress"><%= veh.getFecha_Acep()%> - 
                                                                                                            
                                                                                                            <en style=" padding: 2px 10px; border-radius: 45px; background-color: 
                                                                                                                
                                                                                                                <% if(veh.getEstado().equals("Realizando")){%>
                                                                                                                        rgba(187,196,0,.9);
                                                                                                                        
                                                                                                                <%}else if(veh.getEstado().equals("Espera")){ %>
                                                                                                                        
                                                                                                                        rgba(180,0,0,.9);
                                                                                                                        
                                                                                                                <% }else if(veh.getEstado().equals("Pago")){%>
                                                                                                                        rgba(0,196,12,.9);
                                                                                                                    
                                                                                                                <% } %>
                                                                                                                    ">
                                                                                                                <strong style="color: white;">
                                                                                                                    <%= veh.getEstado() %> 
                                                                                                                </strong>
                                                                                                            </en>
                                                                                                        </div>
													<h4>Contrato del envío identificado con el ID (<%= veh.getEnvioID()%>)</h4>
													<p class="blog_des">
														El acarreador Acarreador (<%= veh.getAcarreadorID()%>) esta ligado a realizar el envio 
														de los objeto (etc...), de la direccion  <%= veh.getPuntoIn()%>
														a la direccion <%= veh.getPuntoFn()%> en el margen de (<%= veh.getFechaIn()%> -|- <%= veh.getFechaFn()%>) por el 
														precio de $<%= veh.getCosto_Final()%>
													</p>
                                                                                                        
                                                                                                        <div  style="position: relative; left: 76%; width: 24%;">

                                                                                                            <button class="Get_btn" style="float: left; background-color: rgba(0,0,0,.5)" onclick="window.location.href = 'newComentario.jsp?AcarID=<%= veh.getAcarreadorID()%>';">comentar</button>
                                                                                                            
                                                                                                            <% if(veh.getEstado().equals("Realizando")){%>
                                                                                                                    <button class="Get_btn" style="margin-right: 20px; float: right;" onclick="window.location.href = 'cambiarEstadoCliente.jsp?EnID=<%= veh.getEnvioID()%>';">Pagar</button>
                                                                                                            <%}%>
                                                                                                            
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
							
							
			<script src="js/vertical-responsive-menu.min.js"></script>
			<script src="js/jquery-3.3.1.min.js"></script>
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<script src="vendor/OwlCarousel/owl.carousel.js"></script>
			<script src="vendor/semantic/semantic.min.js"></script>
			<script src="js/night-mode.js"></script>
            <script src="js/custom.js"></script>
	</body>
</html>