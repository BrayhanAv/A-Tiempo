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
public class VehiculoVO {
    String Placa, AcarreadorID, Modelo, Marca, Peso,Extra,Foto;

    public VehiculoVO() {
    }

    public VehiculoVO(String Placa, String AcarreadorID, String Modelo, String Marca, String Peso, String Extra, String Foto) {
        this.Placa = Placa;
        this.AcarreadorID = AcarreadorID;
        this.Modelo = Modelo;
        this.Marca = Marca;
        this.Peso = Peso;
        this.Extra = Extra;
        this.Foto = Foto;
    }

    public String getPlaca() {
        return Placa;
    }

    public void setPlaca(String Placa) {
        this.Placa = Placa;
    }

    public String getAcarreadorID() {
        return AcarreadorID;
    }

    public void setAcarreadorID(String AcarreadorID) {
        this.AcarreadorID = AcarreadorID;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public String getPeso() {
        return Peso;
    }

    public void setPeso(String Peso) {
        this.Peso = Peso;
    }

    public String getExtra() {
        return Extra;
    }

    public void setExtra(String Extra) {
        this.Extra = Extra;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }
    
    
}
