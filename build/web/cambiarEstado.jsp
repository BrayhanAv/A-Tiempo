<%@page import="ModeloDAO.EnvioDAO"%>
<%@page import="ModeloVO.EnvioVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.pujaDAO"%>
<%@page import="ModeloVO.pujaVO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="ses.jsp" %>
<% 
if(request.getParameter("EnID") != null){
%>

<% 
    EnvioVO envo = new EnvioVO();
    EnvioDAO envDAO = new EnvioDAO(envo);
    
    if(envDAO.CambiarEstado("Realizando",(String)request.getParameter("EnID"))){
        request.getRequestDispatcher("listContrato.jsp?true=ok").forward(request, response);
    }else{
        request.getRequestDispatcher("listContrato.jsp?false=ok").forward(request, response);
    }

%>

<%
}else{
    request.getRequestDispatcher("MenuUsuario.jsp").forward(request, response);
}
%>