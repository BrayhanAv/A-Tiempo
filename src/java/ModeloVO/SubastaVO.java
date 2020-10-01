
package ModeloVO;

public class SubastaVO {
    public String SubastaID,EnvioID,FechaIn,FechaFin,Finalizada;

    public SubastaVO() {
    }

    public SubastaVO(String SubastaID, String EnvioID, String FechaIn, String FechaFin,String Finalizada) {
        this.SubastaID = SubastaID;
        this.EnvioID = EnvioID;
        this.FechaIn = FechaIn;
        this.FechaFin = FechaFin;
        this.Finalizada = Finalizada;
    }

    public String getSubastaID() {
        return SubastaID;
    }

    public void setSubastaID(String SubastaID) {
        this.SubastaID = SubastaID;
    }

    public String getEnvioID() {
        return EnvioID;
    }

    public void setEnvioID(String EnvioID) {
        this.EnvioID = EnvioID;
    }

    public String getFechaIn() {
        return FechaIn;
    }

    public void setFechaIn(String FechaIn) {
        this.FechaIn = FechaIn;
    }

    public String getFechaFin() {
        return FechaFin;
    }

    public void setFechaFin(String FechaFin) {
        this.FechaFin = FechaFin;
    }

    public String getFinalizada() {
        return Finalizada;
    }

    public void setFinalizada(String Finalizada) {
        this.Finalizada = Finalizada;
    }

}
