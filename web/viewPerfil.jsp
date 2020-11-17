<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloDAO.ComentarioDAO"%>
<%@page import="ModeloVO.ComentarioVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.pujaDAO"%>
<%@page import="ModeloVO.pujaVO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="ses.jsp" %>
<link href="css/instructor-dashboard.css" rel="stylesheet">
	
<% 
if(request.getParameter("UsuID") != null){
%>

        <title>Subasta</title>
	<div class="wrapper">
		<div class="sa4d25">
			<div class="container-fluid">			
				<div class="row">
					<div class="col-lg-12">	
						<h2 class="st_title"><i class="uil uil-star"></i> Todos los comentarios</h2>
					</div>					
				</div>				
				<div class="row">
					<div class="col-12">						
						<div class="student_reviews">
							<div class="row">
								<div class="col-lg-5">
									<div class="reviews_left">
                                                                            <% 
                                                                             String UserID = request.getParameter("UsuID");
                                                                             UsuarioVO usVO = new UsuarioVO();
                                                                             UsuarioDAO usDAO = new UsuarioDAO(usVO);
                                                                             UsuarioVO usVO2 = usDAO.search(UserID);
                                                                            %>
                                                                            
										<h3><%= usVO2.getLogin() %></h3>
										<div class="total_rating">
                                                                                    <div class="_rate002"><%= usVO2.getNombre()%> <%= usVO2.getApellido()%></div>
                                                                                </div>
                                                                                <div style="margin:12px">
                                                                                        <p>Correo: <%= usVO2.getCorreo()%></p>
                                                                                </div>
                                                                                
                                                                                <div style="margin:12px">
                                                                                        <p>Telefono: <%= usVO2.getTelefono()%></p>
                                                                                </div>
                                                                                
                                                                                <div style="margin:12px">
                                                                                        <p>Documento: <%= usVO2.getDocumento()%></p>
                                                                                </div>
                                                                                
                                                                                <div style="margin:12px">
                                                                                        <p>Promedio
                                                                                            <% 

                                                                                            for(int x = 0; x < Integer.parseInt(usVO2.getPuntaje_prom()); x++){
                                                                                                
                                                                                            %>
                                                                                            <span class="rating-star full-star"></span>                                                                                        

                                                                                            <%
                                                                                                }
                                                                                            %>
											</p>
                                                                                </div>
                                                                                        
                                                                                
									</div>												
								</div>
								<div class="col-lg-7">
									<div class="review_right">
										<div class="review_right_heading">
											<h3>Todos los comentarios</h3>
											
										</div>
									</div>
									<div class="review_all120">
										
                                                                            <% 
                                                                            ArrayList<ComentarioVO> Listado = new ArrayList<ComentarioVO>();
                                                                            ComentarioVO cmVO = new ComentarioVO();
                                                                            ComentarioDAO cmDAO = new ComentarioDAO(cmVO);
                                                                            
                                                                            
                                                                            if(cmDAO.List(UserID) != null){
                                                                                
                                                                                Listado = cmDAO.List(UserID);
                                                                                Iterator<ComentarioVO> Iter = Listado.iterator();
                                                                                while(Iter.hasNext()){
                                                                                    
                                                                                    ComentarioVO com = Iter.next();
                                                                                    
                                                                                    UsuarioVO USUVO = new UsuarioVO();
                                                                                    UsuarioDAO USUDAO = new UsuarioDAO(USUVO);
                                                                                    USUVO = USUDAO.searchCliente(com.getClienteID());
                                                                            %>
                                                                            
										<div class="review_item" style="margin-bottom: 30px;">
											<div class="review_usr_dt">
												<img src="images/left-imgs/img-1.jpg" alt="">
												<div class="rv1458">
													<h4 class="tutor_name1"><%= USUVO.getLogin() %> </h4>
                                                                                                        <span class="time_145">Codigo de comentario:<%= com.getComentarioID()%></span>
												</div>
											</div>
											<div class="rating-box mt-20">
                                                                                            <% 

                                                                                            for(int x = 0; x < Integer.parseInt(com.getPuntaje()); x++){
                                                                                                
                                                                                            %>
                                                                                            <span class="rating-star full-star"></span>                                                                                        

                                                                                            <%
                                                                                                }
                                                                                            %>
											</div>
											<p class="rvds10"><%= com.getContenido()%></p>
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


<%
}else{
    request.getRequestDispatcher("listSubasta.jsp").forward(request, response);
}
%>
