function Validar(){
    
    //validar pr
    var Valor = document.getElementById("pr").value;
    if(Valor.length < 4  || /^\s+$/.test(Valor)){
        document.getElementById("pr"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("pr"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    //validar direc
    var Valor = document.getElementById("direc").value;
    //var reg = new RegExp('[C][LR][LR][0-9]*{1,4}[#N]s[0-9]{1,4}[0-9]*{1,2}');
    //alert(reg.test(Valor));
    if(!/[C][LR][LR]/.test(Valor)){
        document.getElementById("direc"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("direc"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    //validar direc F
    var Valor = document.getElementById("direcF").value;
    //var reg = new RegExp('[C][LR][LR][0-9]*{1,4}[#N]s[0-9]{1,4}[0-9]*{1,2}');
    //alert(reg.test(Valor));
    if(!/[C][LR][LR]/.test(Valor)){
        document.getElementById("direcF"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("direcF"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    //validar fecha
    var Valor = document.getElementById("fecha").value;

    
    var res = Valor.split("-");
    console.log(res);
    var f = new Date();
    
    if(!(res[0] ==  f.getFullYear())){
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        return false;
    }else if((res[1] < (f.getMonth() + 1))){
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        console.log("el mes es menor");
        return false;
    }else if(res[1] == (f.getMonth() + 1) && res[2] < f.getDate()){
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        console.log("el mes es el mismo y el dia no es");
        return false;
    }else{
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
        console.log("el mes es mayor y esta bien");
    }
   
    
    //validar fechaf
    var Valor = document.getElementById("fechaf").value;

    
    var res = Valor.split("-");
    console.log(res);
    var f = new Date();

    if(!(res[0] ==  f.getFullYear())){
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        return false;
    }else if((res[1] < (f.getMonth() + 1))){
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        console.log("el mes es menor");
        return false;
    }else if(res[1] == (f.getMonth() + 1) && res[2] < f.getDate()){
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        console.log("el mes es el mismo y el dia no es");
        return false;
    }else{
        document.getElementById("fecha"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
        console.log("el mes es mayor y esta bien");
    }
    
    return true;
}