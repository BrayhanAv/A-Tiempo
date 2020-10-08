function Validar(){
    
    //validar nombre

    var Valor = document.getElementById("name").value;
    if(Valor.length < 2  || /\s+$/.test(Valor)){
        document.getElementById("name"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("name"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    //validar peso
    var Valor = document.getElementById("peso").value;
    if(Valor.length < 1  || /^\s+$/.test(Valor) || Valor < 0){
        document.getElementById("peso"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("peso"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    
    //validar tamaño
    var Valor = document.getElementById("tam").value;
    if(Valor.length < 1  || /^\s+$/.test(Valor) || Valor <= 0){
        document.getElementById("tam"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("tam"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    //validar descripcion
    var Valor = document.getElementById("Desc").value;
    if(Valor.length > 20){
        document.getElementById("Desc"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("Desc"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    
    return true;
}

