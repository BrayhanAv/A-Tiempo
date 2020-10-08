/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.UsuarioVO;
import util.Conexion;
import util.MetodosCrud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Brayhan
    */
public class UsuarioDAO extends Conexion implements MetodosCrud{
    
    //paso 1
    private Connection conexion = null;
    private PreparedStatement puente = null;
    private ResultSet rs = null;
    
    //paso 2
    private String sql = "";
    private boolean operacion = false;
    
    //paso 3
    private String UsuarioID="", Login="", Password="", Nombre="", Apellido="",Telefono="",Correo="",Documento="",Descontinuado="",Puntaje_prom = "",Tabla="";

    public UsuarioDAO(UsuarioVO usuvo){
        super();
        
        try {
            
            conexion = this.obtenerConeccion();          
            UsuarioID = usuvo.getUsuarioID();
            Login=usuvo.getLogin();
            Password=usuvo.getPassword();
            Nombre=usuvo.getNombre();
            Apellido=usuvo.getApellido();
            Telefono=usuvo.getTelefono();
            Correo=usuvo.getCorreo();
            Documento=usuvo.getDocumento();
            Descontinuado=usuvo.getDescontinuado();
            Puntaje_prom = usuvo.getPuntaje_prom();
            Tabla=usuvo.getTabla();

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }

    @Override
    public boolean Registrar() {
        
        if(Validar(Login)){
        
            try {

                if(Tabla.equals("cliente")){
                    sql = "INSERT INTO cliente (`login`, `Password`, `nombre`, `apellido`, `telefono`, `correo`, `documento`, `descontinuado`) VALUES (?,?,?,?,?,?,?,0)";
                    puente = conexion.prepareStatement(sql);
                    puente.setString(1,Login);
                    puente.setString(2,Password);
                    puente.setString(3,Nombre);
                    puente.setString(4,Apellido);
                    puente.setString(5,Telefono);
                    puente.setString(6,Correo);
                    puente.setString(7,Documento);
                    puente.executeUpdate();
                    operacion = true;
                }else if(Tabla.equals("acarreador")){
                    sql = "INSERT INTO `acarreador` (`login`, `Password`, `nombre`, `apellido`, `telefono`, `correo`, `documento`, `descontinuado`) VALUES (?,?,?,?,?,?,?,0)";
                    puente = conexion.prepareStatement(sql);
                    puente.setString(1,Login);
                    puente.setString(2,Password);
                    puente.setString(3,Nombre);
                    puente.setString(4,Apellido);
                    puente.setString(5,Telefono);
                    puente.setString(6,Correo);
                    puente.setString(7,Documento);
                    puente.executeUpdate();
                    operacion = true;  
                }


            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
                operacion = false;
            }finally{
                try {
                    this.cerrarConeccion();
                } catch (SQLException e) {
                    Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
                }
            }
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

    public boolean Validar(String Loginb){
        
         try {
                sql = "select * from cliente where login = ? ";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,Loginb);
                rs = puente.executeQuery();
                if(rs.next()){
                    operacion = false;
                }else{
                    sql = "select * from acarreador where login = ? ";
                    puente = conexion.prepareStatement(sql);
                    puente.setString(1,Loginb);
                    rs = puente.executeQuery();
                    if(rs.next()){
                        operacion = false;
                    }else{
                        operacion = true;
                    }
                }
                
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
       
       return operacion; 
        
    }
    
    public UsuarioVO login(String login,String password){
        
       UsuarioVO usuvo = null;
        try {
                sql = "select * from cliente where login = ? and Password = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,Login);
                puente.setString(2,Password);
                rs = puente.executeQuery();
                if(rs.next()){
                    usuvo = new UsuarioVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),"","cliente");
                }else{
                    sql = "select * from acarreador where login = ? and Password = ?";
                    puente = conexion.prepareStatement(sql);
                    puente.setString(1,Login);
                    puente.setString(2,Password);
                    rs = puente.executeQuery();
                    while(rs.next()){
                         usuvo = new UsuarioVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(10),rs.getString(9),"acarreador");
                    }
                }
                operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }finally{
            try {
                this.cerrarConeccion();
            } catch (SQLException e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
       
        
       return usuvo; 
    }
    
    public UsuarioVO search(String ID){
        UsuarioVO usvo = null;
        
        try {
                sql = "SELECT * FROM `acarreador` WHERE AcarreadorID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,ID);
                rs = puente.executeQuery();
                if(rs.next()){
                    usvo = new UsuarioVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(9),"cliente");
                }
                operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
        return usvo;
    }
    
}
