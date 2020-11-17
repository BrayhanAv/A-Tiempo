/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.NotificacionVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Conexion;
import util.MetodosCrud;

/**
 *
 * @author Brayhan
 */
public class NotificacionDAO extends Conexion implements MetodosCrud{
    
    //paso 1
    private Connection conexion = null;
    private PreparedStatement puente = null;
    private ResultSet rs = null;
    
    //paso 2
    private String sql = "";
    private boolean operacion = false;
    
    //paso 3
    private String NotificacionID="", usuarioID="", remitente="", accion="", vinculo="";

    public NotificacionDAO(NotificacionVO NtVO){
        super();
        
        try {
            
            conexion = this.obtenerConeccion();          
            NotificacionID = NtVO.getNotificacionID(); 
            usuarioID = NtVO.getUsuarioID();
            remitente = NtVO.getRemitente();
            accion = NtVO.getAccion(); 
            vinculo = NtVO.getVinculo();
            
        } catch (Exception e) {
            Logger.getLogger(NotificacionDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }

    @Override
    public boolean Registrar() {
        try {
                sql = "call NotificacionRegistrar(?,?,?,?)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,usuarioID);
                puente.setString(2,remitente);
                puente.setString(3,accion);
                puente.setString(4,vinculo);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(NotificacionDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }

    @Override
    public boolean Actualizar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Eliminar() {
        
        try {
                sql = "DELETE FROM `notificacion` WHERE notificacionID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,NotificacionID);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(NotificacionDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
        return operacion;
    }

    public  ArrayList<NotificacionVO> listUsuario(String id){
        
        ArrayList<NotificacionVO> listado = new ArrayList<NotificacionVO>();
        
            try {
                sql = "call NotificacionList(?)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, id);
            rs = puente.executeQuery();
            while(rs.next()){
                NotificacionVO VO = new NotificacionVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                listado.add(VO);
            }
        } catch (Exception e) {
              Logger.getLogger(NotificacionDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return listado;
    }
}
