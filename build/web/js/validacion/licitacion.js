function Validar(){
    
    //validar fecha
    var Presupuesto = document.getElementById("presupuesto").textContent;
    
    var Valor = document.getElementById("Valor").value;
    
    if(Valor > Presupuesto || Valor < 0){
        return false;
    }

    return true;
}