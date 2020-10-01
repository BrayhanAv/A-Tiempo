        <%@page import="ModeloDAO.SubastaDAO"%>
        <%@page import="ModeloVO.SubastaVO"%>
        
<% 
            SubastaVO subvo_lim = new SubastaVO();
            SubastaDAO subDAO_lim = new SubastaDAO(subvo_lim);
            subDAO_lim.LimiteSubasta();
%>
