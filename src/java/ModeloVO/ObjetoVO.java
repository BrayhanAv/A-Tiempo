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
public class ObjetoVO {
    String ObjetoID, EnvioID, Nombre, Peso, Tam, Descripcion;

    public ObjetoVO(String ObjetoID, String EnvioID, String Nombre, String Peso, String Tamaño, String Descripcion) {
        this.ObjetoID = ObjetoID;
        this.EnvioID = EnvioID;
        this.Nombre = Nombre;
        this.Peso = Peso;
        this.Tam = Tamaño;
        this.Descripcion = Descripcion;
    }

    public ObjetoVO() {
    }

    public String getObjetoID() {
        return ObjetoID;
    }

    public void setObjetoID(String ObjetoID) {
        this.ObjetoID = ObjetoID;
    }

    public String getEnvioID() {
        return EnvioID;
    }

    public void setEnvioID(String EnvioID) {
        this.EnvioID = EnvioID;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getPeso() {
        return Peso;
    }

    public void setPeso(String Peso) {
        this.Peso = Peso;
    }

    public String getTam() {
        return Tam;
    }

    public void setTam(String Tam) {
        this.Tam = Tam;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    
}
