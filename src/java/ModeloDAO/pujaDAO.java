/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.SubastaVO;
import ModeloVO.VehiculoVO;
import ModeloVO.pujaVO;
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
public class pujaDAO extends Conexion implements MetodosCrud{
    
    //paso 1
    private Connection conexion = null;
    private PreparedStatement puente = null;
    private ResultSet rs = null;
    
    //paso 2
    private String sql = "";
    private boolean operacion = false;
    
    //paso 3
    private String PujaID="",SubastaID="",AcarreadorID="",Valor="",Fecha="";

    public pujaDAO(pujaVO puVO){
        super();
        
        try {
            conexion = this.obtenerConeccion();          
            
            PujaID = puVO.getPujaID();
            SubastaID = puVO.getSubastaID();
            AcarreadorID = puVO.getAcarreadorID();
            Valor = puVO.getValor();
            Fecha = puVO.getFecha();
            
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }

    @Override
    public boolean Registrar() {
        try {
                sql = "INSERT INTO `puja`(`PujaID`, `SubastaID`, `AcarreadorID`, `Valor`, `FechaRealizacion`) VALUES (?,?,?,?,?)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,PujaID);
                puente.setString(2,SubastaID);
                puente.setString(3,AcarreadorID);
                puente.setString(4,Valor);
                puente.setString(5,Fecha);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(pujaDAO.class.getName()).log(Level.SEVERE,null,e);
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
    
    public boolean EliminarXsubasta(String SubastaID){
        
         try {
                sql = "DELETE FROM `puja` WHERE SubastaID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,SubastaID);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(pujaDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }
    
    public ArrayList<pujaVO> list(String usuarioID){
        
        ArrayList<pujaVO> Listado = new ArrayList<pujaVO>();
        
        try {
                sql = "SELECT * FROM `puja` WHERE SubastaID = ? ORDER BY `puja`.`Valor` ASC";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, usuarioID);
            rs = puente.executeQuery();
            while(rs.next()){
                pujaVO VO = new pujaVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                Listado.add(VO);
            }
        } catch (Exception e) {
              Logger.getLogger(pujaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return Listado;
    }
    
    public String determinarGanador(String SubID){
        String idGanador = "";
        
        try {
                sql = "Select AcarreadorID, Valor FROM puja where SubastaID = ? ORDER BY Valor LIMIT 1";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, SubID);
                rs = puente.executeQuery();
            while(rs.next()){
                idGanador = rs.getString(1);
            }
        } catch (Exception e) {
              Logger.getLogger(pujaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return idGanador;
    }
    
    public String SearchValor(String EnvioID, String AcarreadorID){
        
        String precio = "";
        
        try {
                sql = "SELECT Valor FROM `puja` WHERE SubastaID = ? and AcarreadorID = ? Limit 1";
                puente = conexion.prepareStatement(sql);
                SubastaVO subvo = new SubastaVO();
                SubastaDAO subdao = new SubastaDAO(subvo);
                puente.setString(1, subdao.searchid(EnvioID));
                puente.setString(2, AcarreadorID);
                rs = puente.executeQuery();
            while(rs.next()){
                precio = rs.getString(1);
            }
        } catch (Exception e) {
              Logger.getLogger(pujaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return precio;
    }
}
