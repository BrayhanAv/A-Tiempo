<%-- 
    Document   : logaut
    Created on : 25/07/2020, 09:59:33 PM
    Author     : Brayhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 

        HttpSession SUsuario =request.getSession();
        SUsuario.removeAttribute("DatosUsuarios");
        SUsuario.removeAttribute("Rol");
        SUsuario.invalidate();
        
        request.getRequestDispatcher("index.html").forward(request, response);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
    </body>
</html>
