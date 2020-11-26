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

			<!-- Body Start -->
<div class="wrapper">
		<div class="sa4d25">
			<div class="container-fluid">			
				<div class="row">

                    <div class="col-md-10" style="margin-left: 8%;">
						<div class="_14d25 mb-20">						
							<div class="row">
								<div class="col-md-12">
									<h4 class="mhs_title" style="font-size: 25px;">Listado de envíos</h4>
									<%
                                                                            ArrayList<EnvioVO> Listado = new ArrayList<EnvioVO>();
                                                                            EnvioVO SbVO = new EnvioVO();
                                                                            EnvioDAO SbDAO = new EnvioDAO(SbVO);

                                                                            if(SbDAO.List(id)!= null){
                                                                            Listado = SbDAO.List(id);
                                                                            Iterator<EnvioVO> Iter = Listado.iterator();
                                                                            while(Iter.hasNext()){                        
                                                                                EnvioVO veh = Iter.next();
                                                                                
                                                                                SubastaVO svo = new SubastaVO();
                                                                                SubastaDAO svoDAO = new SubastaDAO(svo);
                                                                        %>
									<div class="fcrse_1" style="margin-bottom: 20px;">
										<a href="#" class="hf_img">
											<img src="images/courses/img-1.jpg" alt="">
											<div class="course-overlay">
												<div class="crse_reviews"> ID: <%= veh.getEnvioID() %>  </div>
												<div class="badge_seller"><%= veh.getPuntoIn() %> -- <%= veh.getPuntoFn() %> </div>
												<div class="crse_timer">
													<%= veh.getFechaIn() %>  -  <%= veh.getFechaFn() %> 
												</div>
											</div>
										</a>
										<div class="hs_content">
											<div class="eps_dots eps_dots10 more_dropdown">
												<a href="#"><i class="uil uil-ellipsis-v"></i></a>
												<div class="dropdown-content">
                                                                                                    <% if(!(svoDAO.searchid(veh.getEnvioID())).equals("")) {%>
                                                                                                        <span>En subasta</span>
                                                                                                    <% }else{%>
                                                                                                    
                                                                                                            <form action="Envio" method="POST">
                                                                                                                <input type="hidden" name="opcion" value="2">
                                                                                                                <input type="hidden" name="EnvioID" value="<%=  veh.getEnvioID() %>">
                                                                                                                <span><input style=" border: none; background-color: transparent;" 
                                                                                                                              class="boton_personal" type="submit" value="Eliminar"/> </span>
                                                                                                            </form>
                                                                                                                
                                                                                                            <a href="updateEnvio.jsp?EnID=<%= veh.getEnvioID()%>" style="text-align: center;"> <span>Editar</span> </a>
													
                                                                                                            <% if(veh.getPesoTotal() == null || veh.getPesoTotal().equals("0")){ %>                                                                                                            
                                                                                                            <a style="text-align: center;"> <span>Sin Objetos</span> </a>
                                                                                                        <% }else{ %>
                                                                                                            <a href="newSubasta.jsp?EnID=<%= veh.getEnvioID()%>" style="text-align: center;"> <span>Subastar</span> </a>
                                                                                                        <% } %>
                                                                                                    <% } %>
												</div>																											
											</div>
											<div class="vdtodt">
												<span class="vdt14">Peso total: <%= veh.getPesoTotal() %> </span>
                                                                                                <% if(!(svoDAO.searchid(veh.getEnvioID())).equals("")) {%>
                                                                                                            <span class="vdt14">Objetos no visibles</span>
                                                                                                    <% }else{%>
                                                                                                    
                                                                                                           <span class="vdt14"> <a href="listObjetos.jsp?EnvioID=<%= veh.getEnvioID()%>"> ver objetos</a></span>
                                                                                                    <% } %>
												
											</div>
											<p href="" class="cr1fot">
												El usuario (<%= veh.getClienteID() %>) esta dispuesto a pagar $<%= veh.getPresupuesto() %>
												por la realización del envio identificado por el id <%= veh.getEnvioID() %> ,
												que contiene la ruta de <%= veh.getPuntoIn() %>  a <%= veh.getPuntoFn() %> 
												con un margen del <%= veh.getFechaIn() %>   a  <%= veh.getFechaFn()%>  y que contiene 
												un peso total de <%= veh.getPesoTotal() %> kg y n objetos.
											</p>
											<a href="#" class="crse-cate"></a>
											<div class="auth1lnkprce">
												<p class="cr1fot">By <a href="#"><%= veh.getClienteID() %> </a></p>
												<div class="prce142">$<%= veh.getPresupuesto() %></div>
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
					<!--
						<div class="col-xl-3 col-lg-4">
							<div class="right_side">
										<div class="get1452">
												<h4>Revisa tus envios en tiempo real</h4>
												<p>No se que poner en esta zona :)</p>
												<button class="Get_btn" onclick="window.location.href = '#';">Vamos alla</button>
										</div>
							</div>
						</div>
					-->
				</div>
			</div>
		</div>
	</div>
			<!-- Body End -->          
			<script src="js/vertical-responsive-menu.min.js"></script>
			<script src="js/jquery-3.3.1.min.js"></script>
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<script src="vendor/OwlCarousel/owl.carousel.js"></script>
			<script src="vendor/semantic/semantic.min.js"></script>
			<script src="js/night-mode.js"></script>
                        <script src="js/custom.js"></script>
	</body>
</html>