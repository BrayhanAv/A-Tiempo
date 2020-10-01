/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.EnvioVO;
import ModeloVO.ObjetoVO;
import ModeloVO.SubastaVO;
import ModeloVO.pujaVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Conexion;
import util.MetodosCrud;

/**
 *
 * @author Brayhan
 */
public class EnvioDAO extends Conexion implements MetodosCrud{
    
    //paso 1
    private Connection conexion = null;
    private PreparedStatement puente = null;
    private ResultSet rs = null;
    
    //paso 2
    private String sql = "";
    private boolean operacion = false;
    
    //paso 3
    private String EnvioID="", ClienteID="", Presupuesto="", Costo_Final="", 
            AcarreadorID="", PesoTotal="", PuntoIn="", PuntoFn="", FechaIn="", FechaFn="", 
            AcepCl="", AcepAc,Estado="", Fecha_Acep="", Activado="";

    public EnvioDAO(EnvioVO EnVO){
        super();
        
        try {
            
            conexion = this.obtenerConeccion();
            EnvioID=EnVO.getEnvioID(); 
            ClienteID=EnVO.getClienteID(); 
            Presupuesto=EnVO.getPresupuesto(); 
            Costo_Final=EnVO.getCosto_Final(); 
            AcarreadorID=EnVO.getAcarreadorID(); 
            PesoTotal=EnVO.getPesoTotal(); 
            PuntoIn=EnVO.getPuntoIn(); 
            PuntoFn=EnVO.getPuntoFn(); 
            FechaIn=EnVO.getFechaIn(); 
            FechaFn=EnVO.getFechaFn(); 
            AcepCl=EnVO.getAcepCl(); 
            AcepAc = EnVO.getAcepAc();
            Estado= EnVO.getEstado();
            Fecha_Acep=EnVO.getFecha_Acep(); 
            Activado=EnVO.getActivado();
            
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }

    @Override
    public boolean Registrar() {
         try {
                sql = "INSERT INTO `envio`(ClienteID ,`presupuesto`, `PuntoInicio`, `PuntoFinal`, `FechaInicio`, `FechaLimite`, activado) VALUES  (?,?,?,?,?,?,0)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,ClienteID);
                puente.setString(2,Presupuesto);
                puente.setString(3,PuntoIn);
                puente.setString(4,PuntoFn);
                puente.setString(5,FechaIn);
                puente.setString(6,FechaFn);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(EnvioDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }

    @Override
    public boolean Actualizar() {
        try {
                sql = "UPDATE `Envio` SET `Presupuesto`=?,`PuntoInicio`=?,`PuntoFinal`=?,`FechaInicio`=?,`FechaLimite`=? WHERE `EnvioID`=?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,Presupuesto);
                puente.setString(2,PuntoIn);
                puente.setString(3,PuntoFn);
                puente.setString(4,FechaIn);
                puente.setString(5,FechaFn);
                puente.setString(6,EnvioID);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(EnvioDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }finally{
            try {
                this.cerrarConeccion();
            } catch (SQLException e) {
                Logger.getLogger(EnvioDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
        
       return operacion;
    }

    @Override
    public boolean Eliminar() {
        try {
                ObjetoVO obj =  new ObjetoVO();
                ObjetoDAO objDAO = new ObjetoDAO(obj);
                
                objDAO.EliminarxEnvio(EnvioID);
                
                sql = "DELETE FROM `envio` WHERE EnvioID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,EnvioID);
                puente.executeUpdate();
                
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }
    
    public EnvioVO search(String ID){
        EnvioVO EnVO = null;
        
        try {
            sql = "SELECT * FROM `Envio` WHERE EnvioID = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, ID);
            rs = puente.executeQuery();
            while(rs.next()){
                EnVO = new EnvioVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15));
            }
        } catch (Exception e) {
              Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return EnVO;
    }
    
    public String DeterminarID(){
        
        String id = "";
        try {
                sql = "select EnvioID from envio where ClienteID = ? and Presupuesto = ? and PuntoInicio = ? and PuntoFinal = ? and FechaInicio = ? and FechaLimite = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,ClienteID);
                puente.setString(2,Presupuesto);
                puente.setString(3,PuntoIn);
                puente.setString(4,PuntoFn);
                puente.setString(5,FechaIn);
                puente.setString(6,FechaFn);
                rs = puente.executeQuery();
                while(rs.next()){
                    id = rs.getString(1);
                }
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(EnvioDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }finally{
            try {
                this.cerrarConeccion();
            } catch (SQLException e) {
                Logger.getLogger(EnvioDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
        
        
        return id;
    }
    
    public ArrayList<EnvioVO> List(String UsuarioID){
            
         ArrayList<EnvioVO> Listado = new ArrayList<EnvioVO>();
        try {
            sql = "SELECT * FROM `envio` where ClienteID = ? and activado = 0 ORDER BY `EnvioID` DESC";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, UsuarioID);
            rs = puente.executeQuery();
            while(rs.next()){
                EnvioVO VhVO = new EnvioVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6),rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),rs.getString(12),rs.getString(13), rs.getString(14),rs.getString(15));
                Listado.add(VhVO);
            }
        } catch (Exception e) {
              Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return Listado;
    }
    
    public ArrayList<EnvioVO> ListContrato(String UsuarioID){
            
         ArrayList<EnvioVO> Listado = new ArrayList<EnvioVO>();
        try {
            sql = "SELECT * FROM `envio` where ClienteID = ? and activado = 1 ORDER BY `EnvioID` DESC";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, UsuarioID);
            rs = puente.executeQuery();
            while(rs.next()){
                EnvioVO VhVO = new EnvioVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6),rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),rs.getString(12),rs.getString(13), rs.getString(14),rs.getString(15));
                Listado.add(VhVO);
            }
        } catch (Exception e) {
              Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return Listado;
    }

     public ArrayList<EnvioVO> ListContratoAcarreador(String AcarreadorID){
            
         ArrayList<EnvioVO> Listado = new ArrayList<EnvioVO>();
        try {
            sql = "SELECT * FROM `envio` where AcarreadorID = ? and activado = 1 ORDER BY `EnvioID` DESC";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, AcarreadorID);
            rs = puente.executeQuery();
            while(rs.next()){
                EnvioVO VhVO = new EnvioVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6),rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),rs.getString(12),rs.getString(13), rs.getString(14),rs.getString(15));
                Listado.add(VhVO);
            }
        } catch (Exception e) {
              Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return Listado;
    }
    
    public boolean CambiarEstado(String Estado, String EnvioIDx){
        
        try {
                sql = "UPDATE `envio` SET Estado = ? WHERE EnvioID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, Estado);
                puente.setString(2, EnvioIDx);
                puente.executeUpdate();
                operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
        return operacion;
    } 
     
    public boolean AceptarContrato(String EnvioID,String AcarreadorID){
        
        try {
                sql = "UPDATE `envio` SET `Costo_Final`=?,`AcarreadorID`=?,`AceptacionCliente`=?,`AceptacionAcarreador`=?,`Fechaaceptacion`=?,`activado`= 1,Estado = 'Espera' WHERE EnvioID = ?";
                puente = conexion.prepareStatement(sql);
                pujaVO pjvo = new pujaVO();
                pujaDAO pjDAO = new pujaDAO(pjvo);
                
                puente.setString(1,  pjDAO.SearchValor(EnvioID, AcarreadorID));
                puente.setString(2, AcarreadorID);
                puente.setString(3, "true");
                puente.setString(4, "true");     
                Date ahora = new Date();
                SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                puente.setString(5, String.valueOf(formateador.format(ahora)));
                puente.setString(6, EnvioID);
                puente.executeUpdate();
                
                SubastaVO subVO = new SubastaVO();
                SubastaDAO subDAO = new SubastaDAO(subVO);
                
                pjDAO.EliminarXsubasta(subDAO.searchid(EnvioID));
                
                operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
        return operacion;
    }
}
