/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.SubastaDAO;
import ModeloVO.SubastaVO;
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
@WebServlet(name = "SubastaControlador", urlPatterns = {"/Subasta"})
public class SubastaControlador extends HttpServlet {

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
         
        String Placa = request.getParameter("SubastaID"),
        EnvioID = request.getParameter("EnvioID"),
        FechaIN = request.getParameter("FechaIN"),
        FechaFN = request.getParameter("FechaFN"),
        Finalizado = request.getParameter("FechaFN");
               
                   
        int opcion =  Integer.parseInt(request.getParameter("opcion"));
        
        SubastaVO sbVO = new SubastaVO(Placa, EnvioID, FechaIN, FechaFN,Finalizado);
        SubastaDAO sbDAO = new SubastaDAO(sbVO);
        
        switch(opcion){
            case 1://agregar registro
                if(sbDAO.Registrar()){
                    request.setAttribute("MensageExito", "La subasta se registro correctamente");
                    request.getRequestDispatcher("listSubastas.jsp").forward(request, response);
                }else{
                    request.setAttribute("MensageError", "La subasta no se registro correctamente");
                    request.getRequestDispatcher("newSubasta.jsp").forward(request, response);
                }
                
            break;
                
            case 2:
                
                if(sbDAO.Eliminar()){
                    request.setAttribute("MensageExito", "La subasta se Elimino correctamente");
                    request.getRequestDispatcher("listSubastas.jsp").forward(request, response);
                }else{
                    request.setAttribute("MensageError", "La subasta no se Elimino correctamente");
                    request.getRequestDispatcher("listSubastas.jsp").forward(request, response);
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
