
package ModeloVO;

/**
 *
 * @author Brayhan
 */
public class pujaVO {
    public String PujaID,SubastaID,AcarreadorID,Valor,Fecha;

    public pujaVO(String PujaID, String SubastaID, String AcarreadorID, String Valor, String Fecha) {
        this.PujaID = PujaID;
        this.SubastaID = SubastaID;
        this.AcarreadorID = AcarreadorID;
        this.Valor = Valor;
        this.Fecha = Fecha;
    }

    public pujaVO() {
    }

    public String getPujaID() {
        return PujaID;
    }

    public void setPujaID(String PujaID) {
        this.PujaID = PujaID;
    }

    public String getSubastaID() {
        return SubastaID;
    }

    public void setSubastaID(String SubastaID) {
        this.SubastaID = SubastaID;
    }

    public String getAcarreadorID() {
        return AcarreadorID;
    }

    public void setAcarreadorID(String AcarreadorID) {
        this.AcarreadorID = AcarreadorID;
    }

    public String getValor() {
        return Valor;
    }

    public void setValor(String Valor) {
        this.Valor = Valor;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
}
