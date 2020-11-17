function Validar(){

    var Fecha = document.getElementById("fechaf").value;
    var ret = Fecha.split("-")
    console.log(ret);

    var f = new Date();
    
    if(!(ret[0] ==  f.getFullYear())){
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        return false;
    }else if((ret[1] < (f.getMonth() + 1))){
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        return false;
    }else if(ret[1] == (f.getMonth() + 1) && ret[2] < f.getDate()){
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)";   
        return false;
    }else{
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
        
    }

    
    var Fechabd = document.getElementById("FechaFinalValidar").value;
    var retbd = Fechabd.split("-")
    console.log(retbd);
    
    console.log(retbd[2] +" "+  retbd[1] + " " + retbd[0]);
    console.log(ret[2] +" "+  ret[1] +" " + ret[0]);
    
    if(ret[1] < retbd[1]){
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        console.log("el mes no esta bien");
        return false;
    }else if(ret[1] == retbd[1] && ret[2] >= retbd[2]){
        document.getElementById("fechaf"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        console.log("el dia no esta bien");
        return false;
    }else{
        document.getElementById("direc"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    


    return true;
}