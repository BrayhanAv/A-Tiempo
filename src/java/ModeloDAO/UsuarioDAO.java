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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


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
        
            try {

                if(Tabla.equals("cliente")){
                    sql = "call  UsuarioModificarCliente(?,?,?,?,?,?)";
                    puente = conexion.prepareStatement(sql);
                    puente.setString(1,Nombre);
                    puente.setString(2,Apellido);
                    puente.setString(3,Telefono);
                    puente.setString(4,Correo);
                    puente.setString(5,Documento);
                    puente.setString(6,UsuarioID);
                    puente.executeUpdate();
                    operacion = true;
                }else if(Tabla.equals("acarreador")){
                    sql = "call UsuarioModificarAcarreador(?,?,?,?,?,?)";
                    puente = conexion.prepareStatement(sql);
                    puente.setString(1,Nombre);
                    puente.setString(2,Apellido);
                    puente.setString(3,Telefono);
                    puente.setString(4,Correo);
                    puente.setString(5,Documento);
                    puente.setString(6,UsuarioID);
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
        
       return operacion;
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
                        String n = rs.getString(9);
                        String n1 = rs.getString(1);
                         usuvo = new UsuarioVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(10),rs.getString(9),"acarreador");
                    }
                }
                operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
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
    
    public UsuarioVO searchCliente(String ID){
        UsuarioVO usvo = null;
        
        try {
                sql = "SELECT * FROM `cliente` WHERE clienteID = ?";
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
    
    public boolean CambiarPassword(){
        try {

                    if(Tabla.equals("cliente")){
                    sql = "UPDATE `cliente` SET Password=? WHERE `ClienteID`= ?";
                    puente = conexion.prepareStatement(sql);
                    puente.setString(1,Password);
                    puente.setString(2,UsuarioID);
                    puente.executeUpdate();
                    operacion = true;
                }else if(Tabla.equals("acarreador")){
                    sql = "UPDATE `acarreador` SET Password=? WHERE `AcarreadorID`= ?";
                    puente = conexion.prepareStatement(sql);
                    puente.setString(1,Password);
                    puente.setString(2,UsuarioID);
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
        
        return operacion;
    }
    
    public boolean enviarCorreo(String correoEmail, String loginEmail){
            
            UsuarioVO usvo = null;
        
            try {
                
                sql = "select * from cliente where login = ? and correo = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,loginEmail);
                puente.setString(2,correoEmail);
                rs = puente.executeQuery();
                if(rs.next()){
                    usvo = new UsuarioVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),"","cliente");
                }else{
                    sql = "select * from acarreador where login = ? and correo = ?";
                    puente = conexion.prepareStatement(sql);
                    puente.setString(1,loginEmail);
                    puente.setString(2,correoEmail);
                    rs = puente.executeQuery();
                    while(rs.next()){
                         usvo = new UsuarioVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(10),rs.getString(9),"acarreador");
                    }
                }
                
                //el correo al cual envias
                String Correo_Usu = usvo.getCorreo();
                
                Properties props = new Properties();

                // Nombre del host de correo, es smtp.gmail.com
                props.setProperty("mail.smtp.host", "smtp.gmail.com");

                // TLS si está disponible
                props.setProperty("mail.smtp.starttls.enable", "true");

                // Puerto de gmail para envio de correos
                props.setProperty("mail.smtp.port","587");

                // Correo personal
                props.setProperty("mail.smtp.user", "avilabrayhan@gmail.com");

                // Si requiere o no usuario y password para conectarse.
                props.setProperty("mail.smtp.auth", "true");

                //Con esto estamos en disposición de obtener nuestra instancia de Session.

                Session session = Session.getDefaultInstance(props);
                session.setDebug(true);

                //Mensaje
                MimeMessage message = new MimeMessage(session);

                // Quien envia el correo
                message.setFrom(new InternetAddress("atiempoacarreos@gmail.com"));

                // A quien va dirigido
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(Correo_Usu));

                message.setSubject("Recuperacion de contraseña");
                message.setText(
                "Este mensaje es con el fin de realizar la recuperacion de contraseña<br>" + "<a href=\"http://localhost:8080/SSEB_2/updatePasswordPerfil.jsp?IdUs="+ usvo.getUsuarioID()+"&Tabla="+ usvo.getTabla()+"\">Recuperar contraseña</a>",
                "ISO-8859-1",
                "html");
                Transport t = session.getTransport("smtp");
                t.connect("atiempoacarreos@gmail.com","ServicioAtiempoDGB");

                t.sendMessage(message,message.getAllRecipients());
                t.close();

                System.out.println("to good");
                operacion = true;
            } catch (Exception e) {
                System.out.println("A la chingada " + e);
                operacion = false;
            }
                
        return operacion;
    }
}
