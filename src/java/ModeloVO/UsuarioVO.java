/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author Brayhan
 */
public class UsuarioVO {
    String UsuarioID, Login, Password, Nombre, Apellido,Telefono,Correo,Documento,Descontinuado,Puntaje_prom,Tabla;

    public UsuarioVO(String UsuarioID, String Login, String Password, String Nombre, String Apellido, String Telefono, String Correo, String Documento, String Puntaje_prom, String Descontinuado, String Tabla) {
        this.UsuarioID = UsuarioID;
        this.Login = Login;
        this.Password = Password;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Documento = Documento;
        this.Descontinuado = Descontinuado;
        this.Puntaje_prom = Puntaje_prom;
        this.Tabla = Tabla;
    }

    public UsuarioVO() {
    }

    

    public String getUsuarioID() {
        return UsuarioID;
    }

    public void setUsuarioID(String UsuarioID) {
        this.UsuarioID = UsuarioID;
    }

    public String getLogin() {
        return Login;
    }

    public void setLogin(String Login) {
        this.Login = Login;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getDescontinuado() {
        return Descontinuado;
    }

    public void setDescontinuado(String Descontinuado) {
        this.Descontinuado = Descontinuado;
    }

    public String getPuntaje_prom() {
        return Puntaje_prom;
    }

    public void setPuntaje_prom(String Puntaje_prom) {
        this.Puntaje_prom = Puntaje_prom;
    }

    public String getTabla() {
        return Tabla;
    }

    public void setTabla(String Tabla) {
        this.Tabla = Tabla;
    }
    
    
}
