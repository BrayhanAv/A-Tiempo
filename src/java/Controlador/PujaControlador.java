/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.pujaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ModeloVO.pujaVO;

/**
 *
 * @author Brayhan
 */
@WebServlet(name = "PujaControlador", urlPatterns = {"/Puja"})
public class PujaControlador extends HttpServlet {

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
        
        String PujaID = request.getParameter("PujaID"),
               SubastaID = request.getParameter("SubastaID"),
               AcarreadorID = request.getParameter("AcarreadorID"),
               Valor = request.getParameter("Valor"),
               Fecha = request.getParameter("Fecha");
        
        int opcion =  Integer.parseInt(request.getParameter("opcion"));
        
        pujaVO pjVO = new pujaVO(PujaID, SubastaID, AcarreadorID, Valor, Fecha);
        pujaDAO pjDAO = new pujaDAO(pjVO);
        
        switch(opcion){
            case 1: 
                if(pjDAO.Registrar()){
                    request.setAttribute("MensageExito", "");
                    request.getRequestDispatcher("newlicitacion.jsp?SubID="+SubastaID).forward(request, response);
                }else{
                    request.setAttribute("MensageError", "La subasta no se registro correctamente");
                    request.getRequestDispatcher("newlicitacion.jsp?SubID="+SubastaID).forward(request, response);
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
