<%@page import="ModeloDAO.EnvioDAO"%>
<%@page import="ModeloVO.EnvioVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.pujaDAO"%>
<%@page import="ModeloVO.pujaVO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="ses.jsp" %>
<% 
if(request.getParameter("SubastaID") != null && request.getParameter("noid") != null){
%>

<% 
    EnvioVO envo = new EnvioVO();
    EnvioDAO envDAO = new EnvioDAO(envo);
    
    SubastaVO subVO = new SubastaVO();
    SubastaDAO subDAO = new SubastaDAO(subVO);
    String EnvioID = subDAO.searchEnvioID(request.getParameter("SubastaID"));
    
    if(envDAO.AceptarContrato(EnvioID, id)){
        
        NotificacionVO ntvo = new NotificacionVO(request.getParameter("noid"),"","","","");
        NotificacionDAO ntDAO = new NotificacionDAO(ntvo);
        ntDAO.Eliminar();
        
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