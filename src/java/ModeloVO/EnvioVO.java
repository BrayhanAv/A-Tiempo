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
public class EnvioVO {
    String EnvioID, ClienteID, Presupuesto, Costo_Final, 
    AcarreadorID, PesoTotal, PuntoIn, PuntoFn, FechaIn, FechaFn, AcepCl, AcepAc,Estado, Fecha_Acep, Activado;

    public EnvioVO() {
    }

    public EnvioVO(String EnvioID, String ClienteID, String Presupuesto, String Costo_Final, String AcarreadorID, String PesoTotal, String PuntoIn, String PuntoFn, String FechaIn, String FechaFn, String AcepCl, String AcepAc, String Estado, String Fecha_Acep, String Activado) {
        this.EnvioID = EnvioID;
        this.ClienteID = ClienteID;
        this.Presupuesto = Presupuesto;
        this.Costo_Final = Costo_Final;
        this.AcarreadorID = AcarreadorID;
        this.PesoTotal = PesoTotal;
        this.PuntoIn = PuntoIn;
        this.PuntoFn = PuntoFn;
        this.FechaIn = FechaIn;
        this.FechaFn = FechaFn;
        this.AcepCl = AcepCl;
        this.AcepAc = AcepAc;
        this.Estado = Estado;
        this.Fecha_Acep = Fecha_Acep;
        this.Activado = Activado;
    }

    
    
    public String getEnvioID() {
        return EnvioID;
    }

    public void setEnvioID(String EnvioID) {
        this.EnvioID = EnvioID;
    }

    public String getClienteID() {
        return ClienteID;
    }

    public void setClienteID(String ClienteID) {
        this.ClienteID = ClienteID;
    }

    public String getPresupuesto() {
        return Presupuesto;
    }

    public void setPresupuesto(String Presupuesto) {
        this.Presupuesto = Presupuesto;
    }

    public String getCosto_Final() {
        return Costo_Final;
    }

    public void setCosto_Final(String Costo_Final) {
        this.Costo_Final = Costo_Final;
    }

    public String getAcarreadorID() {
        return AcarreadorID;
    }

    public void setAcarreadorID(String AcarreadorID) {
        this.AcarreadorID = AcarreadorID;
    }

    public String getPesoTotal() {
        return PesoTotal;
    }

    public void setPesoTotal(String PesoTotal) {
        this.PesoTotal = PesoTotal;
    }

    public String getPuntoIn() {
        return PuntoIn;
    }

    public void setPuntoIn(String PuntoIn) {
        this.PuntoIn = PuntoIn;
    }

    public String getPuntoFn() {
        return PuntoFn;
    }

    public void setPuntoFn(String PuntoFn) {
        this.PuntoFn = PuntoFn;
    }

    public String getFechaIn() {
        return FechaIn;
    }

    public void setFechaIn(String FechaIn) {
        this.FechaIn = FechaIn;
    }

    public String getFechaFn() {
        return FechaFn;
    }

    public void setFechaFn(String FechaFn) {
        this.FechaFn = FechaFn;
    }

    public String getAcepCl() {
        return AcepCl;
    }

    public void setAcepCl(String AcepCl) {
        this.AcepCl = AcepCl;
    }

    public String getAcepAc() {
        return AcepAc;
    }

    public void setAcepAc(String AcepAc) {
        this.AcepAc = AcepAc;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getFecha_Acep() {
        return Fecha_Acep;
    }

    public void setFecha_Acep(String Fecha_Acep) {
        this.Fecha_Acep = Fecha_Acep;
    }

    public String getActivado() {
        return Activado;
    }

    public void setActivado(String Activado) {
        this.Activado = Activado;
    }

    
}
