/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.UsuarioDAO;
import ModeloVO.UsuarioVO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brayhan
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {

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
        
        String UsuarioID=request.getParameter("UsuarioID"), 
               Login=request.getParameter("Login"), 
               Password=request.getParameter("password"), 
               Nombre=request.getParameter("Nombre"), 
               Apellido=request.getParameter("Apellido"),
               Telefono=request.getParameter("Telefono"),
               Correo=request.getParameter("Corre"),
               Documento=request.getParameter("Documento"),
               Descontinuado=request.getParameter("Desc"),
               Tabla=request.getParameter("Tabla");
                   
        int opcion =  Integer.parseInt(request.getParameter("opcion"));
        
        UsuarioVO VhVO = new UsuarioVO(UsuarioID, Login, Password, Nombre, Apellido, Telefono, Correo, Documento, Descontinuado,"", Tabla);
        UsuarioDAO UsDAO = new UsuarioDAO(VhVO);
        
        switch(opcion){
            case 1://agregar registro
                if(UsDAO.Registrar()){
                    request.setAttribute("MensageExito", "El Usuario se registro correctamente");
                }else{
                    request.setAttribute("MensageError", "El login ya esta registrado");
                }
                
                request.getRequestDispatcher("login.jsp").forward(request, response);
                
            break;
                
            case 2://Iniciar session
                
                UsuarioVO ses = UsDAO.login(Login, Password);
                
                if(ses != null){
                    
                    if(ses.getDescontinuado().equals("1")){
                        request.setAttribute("MensageError", "La cuenta fue desactivada");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }else{  
                        HttpSession SUsuario = request.getSession(); //crea una session
                        SUsuario.setAttribute("DatosUsuario", ses);
                        SUsuario.setAttribute("Rol", ses.getTabla());
                        request.getRequestDispatcher("MenuUsuario.jsp").forward(request, response);
                    }
                }else{
                    request.setAttribute("MensageError", "El Login o la contraseña son incorrectos");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
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
