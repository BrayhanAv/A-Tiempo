/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.VehiculoDAO;
import ModeloVO.VehiculoVO;
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
@WebServlet(name = "VehiculoControlador", urlPatterns = {"/Vehiculo"})
public class VehiculoControlador extends HttpServlet {

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
         
        String Placa = request.getParameter("Placa"),
               AcarreadorID = request.getParameter("IdAcarr"),
               Modelo = request.getParameter("Modelo"),
               Marca = request.getParameter("Marca"),
               Peso = request.getParameter("Peso"),
               Extra = request.getParameter("Extra"),
               Foto = request.getParameter("Foto");
               
                   
        int opcion =  Integer.parseInt(request.getParameter("opcion"));
        
        VehiculoVO vhVO = new VehiculoVO(Placa, AcarreadorID, Modelo, Marca, Peso, Extra, Foto);
        VehiculoDAO vhDAO = new VehiculoDAO(vhVO);
        
        switch(opcion){
            case 1://agregar registro
                if(vhDAO.Registrar()){
                    request.setAttribute("MensageExito", "El Vehiculo se registro correctamente");
                    request.getRequestDispatcher("listVehiculos.jsp").forward(request, response);
                }else{
                    request.setAttribute("MensageError", "El Vehiculo no se registro correctamente");
                    request.getRequestDispatcher("newVehiculo.jsp").forward(request, response);
                }
                
            break;
                
            case 2://agregar registro
                if(vhDAO.Actualizar()){
                    request.setAttribute("MensageExito", "El Vehiculo se Actualizo correctamente");
                    request.getRequestDispatcher("listVehiculos.jsp").forward(request, response);
                }else{
                    request.setAttribute("MensageError", "El Vehiculo no se Actualizo correctamente");
                    request.getRequestDispatcher("updateVehiculo.jsp").forward(request, response);
                }
                
            break;
            
            case 3://agregar registro
                if(vhDAO.Eliminar()){
                    request.getRequestDispatcher("listVehiculos.jsp").forward(request, response);
                }else{
                    request.setAttribute("MensageError", "El Vehiculo no se Elimino correctamente");
                    request.getRequestDispatcher("listVehiculos.jsp").forward(request, response);
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
