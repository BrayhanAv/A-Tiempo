/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.EnvioDAO;
import ModeloVO.EnvioVO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brayhan
 */
@WebServlet(name = "EnvioControlador", urlPatterns = {"/Envio"})
public class EnvioControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String EnvioID= request.getParameter("EnvioID"), 
                ClienteID= request.getParameter("ClID"), 
                Presupuesto= request.getParameter("Presupuesto"), 
                Costo_Final= request.getParameter("costofn"), 
                AcarreadorID= request.getParameter("AcarreadorID"),
                PesoTotal= request.getParameter("PesoTL"),
                PuntoIn= request.getParameter("PuntoIN"),
                PuntoFn= request.getParameter("PuntoFN"), 
                FechaIn= request.getParameter("FechaIN"), 
                FechaFn= request.getParameter("FechaFN"),
                AcepCl= request.getParameter("AcepCL"),
                AcepAc = request.getParameter("AcepAC"),
                Estado= request.getParameter("Estado"),
                Fecha_Acep = request.getParameter("FechaAcep"), 
                Activado=request.getParameter("Activado");
        
        int opcion =  Integer.parseInt(request.getParameter("opcion"));
        
        EnvioVO enVO = new EnvioVO(EnvioID, ClienteID, Presupuesto, Costo_Final, AcarreadorID, PesoTotal, PuntoIn, PuntoFn, FechaIn, FechaFn, AcepCl, AcepAc, Estado, Fecha_Acep, Activado);
        EnvioDAO enDAO = new EnvioDAO(enVO);
        
        switch(opcion){
            
            case 1:
                
                if(enDAO.Registrar()){
                    String id = enDAO.DeterminarID();
                    request.setAttribute("EnvioID", id);
                    request.getRequestDispatcher("listObjetos.jsp?EnvioID="+id).forward(request, response);
                    
                }else{
                    request.setAttribute("MensageError", "El Envio no se registro correctamente");
                    request.getRequestDispatcher("newEnvio.jsp").forward(request, response);
                }

                
            break;    
            
            case 2:
                
                if(enDAO.Eliminar()){
                    request.setAttribute("MensageExito", "El Envio se Elimino correctamente");
                    request.getRequestDispatcher("listEnvios.jsp").forward(request, response);
                    
                }else{
                    request.setAttribute("MensageError", "El Envio no se Elimino correctamente");
                    request.getRequestDispatcher("listEnvios.jsp").forward(request, response);
                }

                
            break;   
                
            case 3:
                
                if(enDAO.Actualizar()){
                    request.setAttribute("MensageExito", "El Envio se Actualizo correctamente");
                    request.getRequestDispatcher("listEnvios.jsp").forward(request, response);
                    
                }else{
                    request.setAttribute("MensageError", "El Envio no se Actualizo correctamente");
                    request.getRequestDispatcher("listEnvios.jsp").forward(request, response);
                }

                
            break;   
            
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
