<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.EnvioDAO"%>
<%@page import="ModeloVO.EnvioVO"%>
<%@page import="java.util.ArrayList"%>
<header class="header clearfix">
            <button type="button" id="toggleMenu" class="toggle_menu">
            <i class='uil uil-bars'></i>
            </button>
            <button id="collapse_menu" class="collapse_menu">
              <i class="uil uil-bars collapse_menu--icon "></i>
              <span class="collapse_menu--label"></span>
            </button>
            <div class="main_logo" id="logo">
              <a href="MenuUsuario.jsp"><img class="imagen_logo" src="images/atiempo2-negro.png"></a>
              <a href="MenuUsuario.jsp"><img class="logo-inverse imagen_logo" src="images/atiempo2-large.png" alt=""></a>
            </div>
            <div class="search120">
              <div class="ui search"> <!--
              <div class="ui left icon input swdh10">
                <input class="prompt srch10" type="text" placeholder="Busca Envios especificos...">
                <i class='uil uil-search-alt icon icon1'></i>
              </div>-->
              </div>
            </div>
            <div class="header_right">
              <ul>
                <li>
                  <a href="newEnvio.jsp" class="upload_btn">Crear Envío</a>
                </li>
                <li>
                  <a href="MenuUsuario.jsp" class="option_links"><i class='uil uil-home-alt'></i></a>
                </li>
                <!-- 
                <li class="ui dropdown">
                  <a href="#" class="option_links"><i class='uil uil-bell'></i><span class="noti_count">1</span></a>
                  <div class="menu dropdown_mn">
                    <a href="#Aceptar Contrato" class="channel_my item">
                      <div class="profile_link">
                        <img src="images/left-imgs/img-1.jpg" alt="">
                        <div class="pd_content">
                          <h6>Subasta 1</h6>
                          <p>La subasta a terminado <strong>Has ganado la subasta</strong>.</p>
                          <span class="nm_time">1 min</span>
                        </div>							
                      </div>							
                    </a>
                  </div>
                </li>
                -->
                <li class="ui dropdown">
                  <a href="#" class="opts_account">
                    <img src="images/hd_dp.jpg" alt="">
                  </a>
                  <div class="menu dropdown_account">
                    <div class="channel_my">
                      <div class="profile_link">
                        <img src="images/hd_dp.jpg" alt="">
                        <div class="pd_content">
                          <div class="rhte85">
                            <h6><%= Nombre %></h6>
                            <div class="mef78" title="Verify">
                              <i class='uil uil-check-circle'></i>
                            </div>
                          </div>
                          <span><%= Rol %></span>
                        </div>							
                      </div>						
                    </div>
                        <a href="updatePerfilCliente.jsp?UsuID=<%= id %>" class="item channel_item">Modificar datos</a>
                    <div class="night_mode_switch__btn">
                    </div>   
                    
                    <a href="logaut.jsp" class="item channel_item">Salir</a>						
                  </div>
                </li>
              </ul>
            </div>
        </header>

			<!-- Menu -->
			<nav class="vertical_nav">
				<div class="left_section menu_left" id="js-menu" >
					<div class="left_section">
						<ul>
							<li class="menu--item">
								<a href="MenuUsuario.jsp" class="menu--link" title="Home">
									<i class='uil uil-home-alt menu--icon'></i>
									<span class="menu--label">Inicio</span>
								</a>
							</li>
							<li class="menu--item">
								<a href="listEnvios.jsp" class="menu--link" title="">
									<i class='uil uil-layers menu--icon'></i>
									<span class="menu--label">Envíos</span>
								</a>
							</li>
							<li class="menu--item">
								<a href="listSubastas.jsp" class="menu--link" title="">
                                                                   
									<i class='uil uil-graph-bar menu--icon'></i>
									<span class="menu--label">Subastas</span>
								</a>
							</li>
							<li class="menu--item">
								<a href="listContratosCliente.jsp" class="menu--link" title="">
									<i class='uil uil-chart-line menu--icon'></i>
									<span class="menu--label">Contratos</span>
								</a>
							</li>
						</ul>
					</div>
                                    <!-- 
					<div class="left_footer">
						<div class="left_footer_content">
							<p>Â© 2020 <strong>Cursus</strong>. All Rights Reserved.</p>
						</div>
					</div>
                                    -->
				</div>
			</nav>
			<!-- Menu End -->
                    