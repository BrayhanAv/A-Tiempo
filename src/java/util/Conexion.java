/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Brayhan
 */
public class Conexion {
    
    public String driver, bd, usuario ,password,urlBd;
    public Connection con;
    
    public Conexion(){
        
        driver = "com.mysql.jdbc.Driver";
        //bd = "ssebv2";
        bd = "ssebv2_prueba";
        usuario = "root";
        password = "";
        urlBd = "jdbc:mysql://localhost:3306/"+bd;
        
        try {
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(urlBd,usuario,password);
        } catch (Exception e) {
            System.out.println(" _[E]_ Error en la coneccion" + e);
        }
    }
    
    public Connection obtenerConeccion(){   
        return con;
    }
    
    public Connection cerrarConeccion() throws SQLException{
        con.close();
        con = null;
        return con;
    }

    public static void main(String [] arg){
        new Conexion();
    }
}
