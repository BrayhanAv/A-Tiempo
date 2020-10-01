
package ModeloVO;


public class NotificacionVO {
    public String NotificacionID, usuarioID, remitente, accion, vinculo;

    public NotificacionVO() {
    }

    public NotificacionVO(String NotificacionID, String usuarioID, String remitente, String accion, String vinculo) {
        this.NotificacionID = NotificacionID;
        this.usuarioID = usuarioID;
        this.remitente = remitente;
        this.accion = accion;
        this.vinculo = vinculo;
    }

    public String getNotificacionID() {
        return NotificacionID;
    }

    public void setNotificacionID(String NotificacionID) {
        this.NotificacionID = NotificacionID;
    }

    public String getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(String usuarioID) {
        this.usuarioID = usuarioID;
    }

    public String getRemitente() {
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getVinculo() {
        return vinculo;
    }

    public void setVinculo(String vinculo) {
        this.vinculo = vinculo;
    }
    
    
}
