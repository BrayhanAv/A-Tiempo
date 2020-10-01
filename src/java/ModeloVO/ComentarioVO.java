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
public class ComentarioVO {
    public String ComentarioID,ClienteID,AcarreadorID,Contenido,Puntaje;

    public ComentarioVO(String ComentarioID, String ClienteID, String AcarreadorID, String Contenido, String Puntaje) {
        this.ComentarioID = ComentarioID;
        this.ClienteID = ClienteID;
        this.AcarreadorID = AcarreadorID;
        this.Contenido = Contenido;
        this.Puntaje = Puntaje;
    }

    public ComentarioVO() {
    }

    public String getComentarioID() {
        return ComentarioID;
    }

    public void setComentarioID(String ComentarioID) {
        this.ComentarioID = ComentarioID;
    }

    public String getClienteID() {
        return ClienteID;
    }

    public void setClienteID(String ClienteID) {
        this.ClienteID = ClienteID;
    }

    public String getAcarreadorID() {
        return AcarreadorID;
    }

    public void setAcarreadorID(String AcarreadorID) {
        this.AcarreadorID = AcarreadorID;
    }

    public String getContenido() {
        return Contenido;
    }

    public void setContenido(String Contenido) {
        this.Contenido = Contenido;
    }

    public String getPuntaje() {
        return Puntaje;
    }

    public void setPuntaje(String Puntaje) {
        this.Puntaje = Puntaje;
    }
    
}
