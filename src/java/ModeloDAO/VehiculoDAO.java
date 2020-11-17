
package ModeloDAO;

import ModeloVO.VehiculoVO;
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
public class VehiculoDAO extends Conexion implements MetodosCrud{
    
    //paso 1
    private Connection conexion = null;
    private PreparedStatement puente = null;
    private ResultSet rs = null;
    
    //paso 2
    private String sql = "";
    private boolean operacion = false;
    
    //paso 3
    private String Placa="", AcarreadorID="", Modelo="", Marca="", Peso="",Extra="",Foto="";

    public VehiculoDAO(VehiculoVO VhVO){
        super();
        
        try {
            
            conexion = this.obtenerConeccion();          
            Placa = VhVO.getPlaca();
            AcarreadorID = VhVO.getAcarreadorID();
            Modelo = VhVO.getModelo();
            Marca = VhVO.getMarca();
            Peso = VhVO.getPeso();
            Extra = VhVO.getExtra();
            Foto = VhVO.getFoto();

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }

    @Override
    public boolean Registrar() {
        try {
                sql = "call VehiculoRegistrar(?,?,?,?,?,?,?)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,Placa);
                puente.setString(2,AcarreadorID);
                puente.setString(3,Modelo);
                puente.setString(4,Marca);
                puente.setString(5,Peso);
                puente.setString(6,Extra);
                puente.setString(7,Foto);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }finally{
            try {
                this.cerrarConeccion();
            } catch (SQLException e) {
                Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
        
       return operacion;
    }

    @Override
    public boolean Actualizar() {
        try {
                sql = "CALL VehiculoModificar(?,?,?,?,?,?)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,Modelo);
                puente.setString(2,Marca);
                puente.setString(3,Peso);
                puente.setString(4,Extra);
                puente.setString(5,Foto);
                puente.setString(6,Placa);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }finally{
            try {
                this.cerrarConeccion();
            } catch (SQLException e) {
                Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
        
       return operacion;
    }

    @Override
    public boolean Eliminar() {
       try {
                sql = "DELETE FROM `vehiculo` WHERE placa = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,Placa);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }finally{
            try {
                this.cerrarConeccion();
            } catch (SQLException e) {
                Logger.getLogger(ObjetoDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
        
       return operacion;
    }

    public ArrayList<VehiculoVO> list(String acarreadorid){
        
        ArrayList<VehiculoVO> Listado = new ArrayList<VehiculoVO>();
        
        try {
            sql = "select * from vehiculo where AcarreadorID = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, acarreadorid);
            rs = puente.executeQuery();
            while(rs.next()){
                VehiculoVO VhVO = new VehiculoVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                Listado.add(VhVO);
            }
        } catch (Exception e) {
              Logger.getLogger(VehiculoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return Listado;
    }
    
    public VehiculoVO search(String Vehiculoid){
        
        VehiculoVO VHVO = null;
        
        try {
            sql = "select * from vehiculo where placa = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Vehiculoid);
            rs = puente.executeQuery();
            while(rs.next()){
                VHVO = new VehiculoVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
            }
        } catch (Exception e) {
              Logger.getLogger(VehiculoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return VHVO;
    }
    
}
