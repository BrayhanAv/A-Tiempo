<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.pujaDAO"%>
<%@page import="ModeloVO.pujaVO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="ses.jsp" %>
<link href="css/instructor-dashboard.css" rel="stylesheet">
                                        
	
<% 
if(request.getParameter("SubID") != null){
%>

        <title>Subasta</title>
 <div class="wrapper">
            <div class="sa4d25">
                <div class="container-fluid">
                    <h4 class="mhs_title" style="font-size: 25px;">Subasta En juego</h4>
                <div class="row">
                  
                  <div class="col-lg-4 col-md-12">
                    <div class="top_countries mt-15">
                      <div class="top_countries_title">
                        <h2>Informacion del envio</h2>
                      </div>
                        <% 
                        
                        SubastaVO subastVo = new SubastaVO();
                        SubastaDAO subastDAO = new SubastaDAO(subastVo);
                        String SubastaID = subastDAO.searchEnvioID(request.getParameter("SubID"));
                        EnvioVO EnvioVO = new EnvioVO();
                        EnvioDAO EnvioDAO = new EnvioDAO(EnvioVO);
                        EnvioVO EnVO = EnvioDAO.search(SubastaID);
                        
                        if((subastDAO.searchid(EnVO.getEnvioID())).equals("")){
                            request.getRequestDispatcher("listSubastaAcarreador.jsp").forward(request, response);
                        }
                        
                        %>
                      <ul class="country_list">
                        <li>
                          <div class="country_item">
                            <div class="country_item_left">
                              <span>Codigo</span>
                            </div>
                            <div class="country_item_right">
                              <span><%= EnVO.getEnvioID() %></span>
                            </div>
                          </div>
                        </li>
                        
                        <li>
                          <div class="country_item">
                            <div class="country_item_left">
                              <span>Peso total </span>
                            </div>
                            <div class="country_item_right">
                              <span><%= EnVO.getPesoTotal()%> kg</span>
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="country_item">
                            <div class="country_item_left">
                              <span>Presupuesto </span>
                            </div>
                            <div class="country_item_right">
                              <span>$<%= EnVO.getPresupuesto()%></span>
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="country_item">
                            <div class="country_item_left">
                              <span>Ruta </span>
                            </div>
                            <div class="country_item_right">
                              <span style="font-size: 12px;"><%= EnVO.getPuntoIn()%> - <%= EnVO.getPuntoFn()%></span>
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="country_item">
                            <div class="country_item_left">
                              <span>Margen de fecha </span>
                            </div>
                            <div class="country_item_right">
                              <span style="font-size: 12px;"><%= EnVO.getFechaIn()%> - <%= EnVO.getFechaFn()%>  </span>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="col-lg-8 col-md-12">
                    <div class="table-responsive mt-15">
                      <table class="table ucp-table earning__table">
                        <thead class="thead-s">
                          <tr>
                            <th scope="col">ID</th>
                            <th scope="col">AcarreadorID</th>
                            <th scope="col">Valor</th>
                            <th scope="col">Fecha</th>								
                          </tr>
                        </thead>
                        <tbody>
                        <%
                          ArrayList<pujaVO> Listado = new ArrayList<pujaVO>();
                          pujaVO VO = new pujaVO();
                          pujaDAO DAO = new pujaDAO(VO);

                          if(DAO.list(request.getParameter("SubID"))!= null){
                              Listado = DAO.list(request.getParameter("SubID"));
                              Iterator<pujaVO> Iter = Listado.iterator();
                              while(Iter.hasNext()){                        
                                  pujaVO puj = Iter.next();                                
                          %>
                        
                          <tr onclick="window.location.assign('viewPerfil.jsp?UsuID=<%= puj.getAcarreadorID() %>')">	
                            <a href="viewPerfil.jsp?IDUSER="></a>
                            <td><%= puj.getPujaID()%></td>	
                            <td><%= puj.getAcarreadorID()%></td>	
                            <td>$ <%= puj.getValor()%></td>
                            <td><%= puj.getFecha()%></td>
                            
                          </tr>
                        
                        <%            
                              }
                          }
                      %>
                        </tbody>
                        <tfoot style="background-color: #545654;">
                          <tr>
                              
                              <td>Listado de Licitaciones</td>
                              <td colspan="2">
                                  Revisa los perfiles de los usuarios 
                              </td>
                              
                              <td>  
                              </td>
                          </tr>
                        </tfoot>
                      </table>
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
    request.getRequestDispatcher("listSubastaAcarreador.jsp").forward(request, response);
}
%>
