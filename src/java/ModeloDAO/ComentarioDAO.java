/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.ComentarioVO;
import ModeloVO.ObjetoVO;
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
public class ComentarioDAO extends Conexion implements MetodosCrud{
    
    //paso 1
    private Connection conexion = null;
    private PreparedStatement puente = null;
    private ResultSet rs = null;
    
    //paso 2
    private String sql = "";
    private boolean operacion = false;
    
    //paso 3
    private String ComentarioID="",ClienteID="",AcarreadorID="",Contenido="",Puntaje="";

    public ComentarioDAO(ComentarioVO CoVO){
        super();
        
        try {
            conexion = this.obtenerConeccion();          
            
            ComentarioID = CoVO.getComentarioID();
            ClienteID = CoVO.getClienteID();
            AcarreadorID = CoVO.getAcarreadorID();
            Contenido = CoVO.getContenido();
            Puntaje = CoVO.getPuntaje();
            
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }

    @Override
    public boolean Registrar() {
       try {
                sql = "CALL ComentarioRegistrar(?,?,?,?);";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,ClienteID);
                puente.setString(2,AcarreadorID);
                puente.setString(3,Contenido);
                puente.setString(4,Puntaje);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(ComentarioDAO.class.getName()).log(Level.SEVERE,null,e);
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<ComentarioVO> List(String AcarreadorID){
         ArrayList<ComentarioVO> Listado = new ArrayList<ComentarioVO>();
        
        try {
            sql = "call ComentarioList(?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, AcarreadorID);
            rs = puente.executeQuery();
            while(rs.next()){
                ComentarioVO VO = new ComentarioVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                Listado.add(VO);
            }
        } catch (Exception e) {
              Logger.getLogger(ComentarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return Listado;
    }
    
    public void determinarpromedio(String UsID){
        
        String Promed = "";
        try {
            sql = "call ComentarioDeterminarPromedio(?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, UsID);
            rs = puente.executeQuery();
            while(rs.next()){
                Promed = rs.getString(1);
            }
            
            String sql1 = "call ComentarioActualizarPromedio(?,?)";
            puente = conexion.prepareStatement(sql1);
            puente.setString(1,UsID);
            puente.setString(2,Promed);
            puente.executeUpdate();
            
        } catch (Exception e) {
              Logger.getLogger(ComentarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }
    
}
