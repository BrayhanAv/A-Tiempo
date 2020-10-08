function Validar(){

    var Fecha = document.getElementById("fechaf").value;
    var ret = Fecha.split("-")
    console.log(ret);

    var f = new Date();
    
    if(!(ret[0] ==  f.getFullYear()) || (ret[1] < (f.getMonth() + 1)) || ret[2] < f.getDate()  ){
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }

    
    var Fechabd = document.getElementById("FechaFinalValidar").value;
    var retbd = Fechabd.split("-")
    console.log(retbd);
    
    if(ret[1] < retbd[1] || ret[2] >= retbd[2]){
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("direc"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    


    return false;
}