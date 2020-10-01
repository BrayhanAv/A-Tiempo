/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ComentarioDAO;
import ModeloVO.ComentarioVO;
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
@WebServlet(name = "ComentarioControlador", urlPatterns = {"/Comentario"})
public class ComentarioControlador extends HttpServlet {

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
        
        String ComentarioID = request.getParameter("ComentarioID"),
               ClienteID = request.getParameter("ClienteID"),
               AcarreadorID = request.getParameter("AcarreadorID"),
               Contenido = request.getParameter("Contenido"),
               Puntaje = request.getParameter("Puntaje");
        
        int opcion =  Integer.parseInt(request.getParameter("opcion"));
        
        ComentarioVO ntvo = new ComentarioVO(ComentarioID,ClienteID,AcarreadorID, Contenido, Puntaje);
        ComentarioDAO ntDAO = new ComentarioDAO(ntvo);
        
        switch(opcion){
            case 1: 
                if(ntDAO.Registrar()){
                    request.setAttribute("MensageExito", "El Comentario se registro correctamente");
                    request.getRequestDispatcher("listContratosCliente.jsp").forward(request, response);
                }else{
                    request.setAttribute("MensageError", "El Comentario no se registro correctamente");
                    request.getRequestDispatcher("listContratosCliente.jsp").forward(request, response);
                }
                
            break;
        }
        
        ntDAO.determinarpromedio(AcarreadorID);
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
