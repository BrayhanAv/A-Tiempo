function Validar(){
    
    //validar fecha
    var Valor = document.getElementById("fecha").value;

    
    var res = Valor.split("-");
    console.log(res);
    var f = new Date();
    
    if(!(res[0] ==  f.getFullYear()) || (res[1] < (f.getMonth() + 1)) || res[2] < f.getDate()  ){
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    //validar fechaf
    var Valor = document.getElementById("fechaf").value;

    
    var res = Valor.split("-");
    console.log(res);
    var f = new Date();

    if(!(res[0] ==  f.getFullYear()) || (res[1] < (f.getMonth() + 1)) || res[2] <= f.getDate()  ){
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    return true;
}