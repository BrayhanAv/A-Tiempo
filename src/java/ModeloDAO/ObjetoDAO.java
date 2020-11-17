/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

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
public class ObjetoDAO extends Conexion implements MetodosCrud{
    
    //paso 1
    private Connection conexion = null;
    private PreparedStatement puente = null;
    private ResultSet rs = null;
    
    //paso 2
    private String sql = "";
    private boolean operacion = false;
    
    //paso 3
    private String ObjetoID="", EnvioID="", Nombre="", Peso="", Tam="", Descripcion="";

    public ObjetoDAO(ObjetoVO ObVO){
        super();
        
        try {
            
            conexion = this.obtenerConeccion();          
            ObjetoID = ObVO.getObjetoID();
            EnvioID = ObVO.getEnvioID();
            Nombre= ObVO.getNombre();
            Peso = ObVO.getPeso();
            Tam = ObVO.getTam();
            Descripcion = ObVO.getDescripcion();

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }

    @Override
    public boolean Registrar() {
        try {
                sql = "call ObjetoRegistrar(?,?,?,?,?)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,EnvioID);
                puente.setString(2,Nombre);
                puente.setString(3,Peso);
                puente.setString(4,Tam);
                puente.setString(5,Descripcion);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(VehiculoDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }

    @Override
    public boolean Actualizar() {
        try {
                sql = "call ObjetoModificar(?,?,?,?,?)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,Nombre);
                puente.setString(2,Peso);
                puente.setString(3,Tam);
                puente.setString(4,Descripcion);
                puente.setString(5,ObjetoID);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }

    @Override
    public boolean Eliminar() {
        try {
                sql = "DELETE FROM `objeto` WHERE ObjetoID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,ObjetoID);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }
    
    public boolean EliminarxEnvio(String EnID){
        try {
                sql = "DELETE FROM `objeto` WHERE EnvioID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,EnID);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }

    public ArrayList<ObjetoVO> List(String EnvioID){
         ArrayList<ObjetoVO> Listado = new ArrayList<ObjetoVO>();
        
        try {
            sql = "Call ObjetoList(?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, EnvioID);
            rs = puente.executeQuery();
            while(rs.next()){
                ObjetoVO VhVO = new ObjetoVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6));
                Listado.add(VhVO);
            }
        } catch (Exception e) {
              Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return Listado;
    }
    
    public void sumar_peso(String IDEnvio){
        
        try {
                String sum_peso = "";
                sql = "select sum(peso) from objeto where EnvioID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,IDEnvio);
                rs = puente.executeQuery();
                while(rs.next()){
                    sum_peso = rs.getString(1);
                }
                
                sql = "update Envio set Peso_Total = ? where EnvioID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,sum_peso);
                puente.setString(2,IDEnvio);
                puente.executeUpdate();
                
            
        } catch (SQLException e) {
            Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }
    
    public ObjetoVO search(String ObjetoID){
        
        ObjetoVO ObVO = null;
        
        try {
            sql = "call ObjetoSearch(?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, ObjetoID);
            rs = puente.executeQuery();
            while(rs.next()){
                ObVO = new ObjetoVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
            }
        } catch (Exception e) {
              Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return ObVO;
    }
    
}
