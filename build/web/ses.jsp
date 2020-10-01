<%@page import="ModeloVO.UsuarioVO"%>
<% 
    
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires",0);

%>

<% 
    String Nombre = "";
    String Rol = "";
    String id = "";
    HttpSession SUsuario = (HttpSession)request.getSession();
    
    if(SUsuario.getAttribute("DatosUsuario") == null){       
        request.getRequestDispatcher("index.html").forward(request, response);
    }else{
        UsuarioVO usuVO = (UsuarioVO)SUsuario.getAttribute("DatosUsuario");
        id = usuVO.getUsuarioID();
        Nombre = usuVO.getLogin();
        Rol = (String)SUsuario.getAttribute("Rol");
%>

<% } %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="includes/limiteSubasta.jsp"%>

<!DOCTYPE html>
<html lang="en">

	<!-- Links de css -->
	<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, shrink-to-fit=9">
			<meta name="description" content="Gambolthemes">
			<meta name="author" content="Gambolthemes">		
			<title>A tiempo</title>
			
			<!-- Favicon Icon -->
			    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
			
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
                <% if(Rol.equals("acarreador")){ %>
                <!-- Menu del acarreador -->
                  <%@include file="includes/Menu_acarreador.jsp" %>     

                <% }else if(Rol.equals("cliente")){ %>
                <!-- Menu del cliente -->    
                  <%@include file="includes/Menu_cliente.jsp" %>          
                  
                  
                <% } %>

                