package ModeloDAO;

import ModeloVO.NotificacionVO;
import ModeloVO.SubastaVO;
import ModeloVO.pujaVO;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Conexion;
import util.MetodosCrud;

public class SubastaDAO extends Conexion implements MetodosCrud{
    
    //paso 1
    private Connection conexion = null;
    private PreparedStatement puente = null;
    private ResultSet rs = null;
    
    //paso 2
    private String sql = "";
    private boolean operacion = false;
    
    //paso 3
    private String SubastaID="",EnvioID="",FechaIn="",FechaFin="",Finalizada = "";
    
    public SubastaDAO(SubastaVO suVO){
        super();
        
        try {
            
            conexion = this.obtenerConeccion();          
            SubastaID=suVO.getSubastaID();
            EnvioID=suVO.getEnvioID();
            FechaIn=suVO.getFechaIn();
            FechaFin=suVO.getFechaFin();
            Finalizada = suVO.getFinalizada();
        } catch (Exception e) {
            Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }

    @Override
    public boolean Registrar() {
        try {
                sql = "INSERT INTO `subasta`(subastaID,`EnvioID`, Fehainicio, FehaFin,Finalizada) VALUES  (?,?,?,?,0)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,SubastaID);
                puente.setString(2,EnvioID);
                puente.setString(3,FechaIn);
                puente.setString(4,FechaFin);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
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
                sql = "DELETE FROM `subasta` WHERE SubastaID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1,SubastaID);
                puente.executeUpdate();
                operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }
    
    public ArrayList<SubastaVO> list(String usuarioID){
        
        ArrayList<SubastaVO> Listado = new ArrayList<SubastaVO>();
        
        try {
                sql = "SELECT * FROM subastasporcliente WHERE clienteID = ? and finalizada = 0 ORDER BY `subastaid` DESC";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, usuarioID);
                rs = puente.executeQuery();
            while(rs.next()){
                SubastaVO VhVO = new SubastaVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6));
                Listado.add(VhVO);
            }
        } catch (Exception e) {
              Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return Listado;
    }
    
    public ArrayList<SubastaVO> listAcarreador(){
        
        ArrayList<SubastaVO> Listado = new ArrayList<SubastaVO>();
        
        try {
                sql = "SELECT * FROM `subasta` WHERE finalizada = 0 ORDER BY `subastaid` DESC";
                puente = conexion.prepareStatement(sql);
                rs = puente.executeQuery();
            while(rs.next()){
                SubastaVO VhVO = new SubastaVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                Listado.add(VhVO);
            }
        } catch (Exception e) {
              Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return Listado;
    }
    
    public void LimiteSubasta(){ 

        Date ahora = new Date();
        SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
        String[] partsAC = formateador.format(ahora).split("-");
        
        int dia = Integer.parseInt(partsAC[0]);
        int mes = Integer.parseInt(partsAC[1]);
        int annio = Integer.parseInt(partsAC[2]);
        
        try {
                sql = "SELECT * FROM `subasta` where finalizada = 0";
                puente = conexion.prepareStatement(sql);
                rs = puente.executeQuery();
                while(rs.next()){
                SubastaVO VhVO = new SubastaVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));

                String medio = VhVO.getFechaFin();
                String[] parts = medio.split("-");
                //System.out.println(parts[0]); //año
                //System.out.println(parts[1]); //mes
                //System.out.println(parts[2]); //dia
                
               if( Integer.parseInt(parts[0]) == annio){
                   if( Integer.parseInt(parts[1]) == mes){
                   
                       if( Integer.parseInt(parts[2]) == dia ){
                           finalizar(VhVO.getSubastaID());
                           
                       }else if( Integer.parseInt(parts[2]) < dia ){
                           finalizar(VhVO.getSubastaID());
                       }else{
                           //System.out.println("Subasta faltan "+ (Integer.parseInt(parts[2]) - dia) +" para finalizar");
                       }
             
                   }else if( Integer.parseInt(parts[1]) < mes){
                       finalizar(VhVO.getSubastaID());
                   }
                   
               }else if(Integer.parseInt(parts[0]) < annio){
                   finalizar(VhVO.getSubastaID());
               }
               
            }
        } catch (Exception e) {
              Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
    }
    
    public boolean finalizar(String id){
        try {
                PreparedStatement puente2 = null;
                sql = "UPDATE `subasta` SET `finalizada`= 1 WHERE subastaID = ?";
                puente2 = conexion.prepareStatement(sql);
                puente2.setString(1, id);
                puente2.executeUpdate();

                pujaVO pjvo = new pujaVO();
                pujaDAO pjdao = new pujaDAO(pjvo);
                
                String Usuario = pjdao.determinarGanador(id);
                String Remitente = "Sistema";
                String Accion = "Contrato";
                String Link = id;
                
                NotificacionVO ntvo = new NotificacionVO("",Usuario,Remitente,Accion,Link); 
                NotificacionDAO ntDAO = new NotificacionDAO(ntvo);
                ntDAO.Registrar();
                
                operacion = true;
                
        } catch (SQLException e) {
            Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
            operacion = false;
        }
        
       return operacion;
    }
    
    public String searchid(String EnvioID){
        String id = "";
        
         try {
                sql = "SELECT SubastaID from subasta where envioID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, EnvioID);
                rs = puente.executeQuery();
            while(rs.next()){
               id = rs.getString(1);
            }
        } catch (Exception e) {
              Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return id;
    }
    
    public String searchEnvioID(String SubastaID){
        String id = "";

        try {
                sql = "SELECT EnvioID from subasta where SubastaID = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, SubastaID);
                rs = puente.executeQuery();
            while(rs.next()){
               id = rs.getString(1);
            }
        } catch (Exception e) {
              Logger.getLogger(SubastaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        
        return id;
    }
}
