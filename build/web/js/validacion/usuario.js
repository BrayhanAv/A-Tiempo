

function validacion() {
    
    //validar nombre
    var Valor = document.getElementById("Nombre").value;
    if(Valor.length < 3  || /^\s+$/.test(Valor)){
        document.getElementById("Nombre").style.borderBottom = "3px solid rgba(225,0,0,.6)"; 
        
        return false;
    }else{
        document.getElementById("Nombre").style.borderBottom = "3px solid rgba(0,225,0,.6)"; 
    }

    //validar apellido
    var Valor = document.getElementById("Apellido").value;
    if(Valor.length < 3  || /^\s+$/.test(Valor)){
        document.getElementById("Apellido").style.borderBottom = "3px solid rgba(225,0,0,.6)"; 
        
        return false;
    }else{
        document.getElementById("Apellido").style.borderBottom = "3px solid rgba(0,225,0,.6)"; 
    }

    //validar password
    var Valor = document.getElementById("password").value;
    if(Valor.length < 8 && Valor.length < 16){
        document.getElementById("password").style.borderBottom = "3px solid rgba(225,0,0,.6)"; 
        
        return false;
    }else{
        document.getElementById("password").style.borderBottom = "3px solid rgba(0,225,0,.6)"; 
    }

    //validar Login
    var Valor = document.getElementById("Login").value;
    if(Valor.length < 5  || /^\s+$/.test(Valor)){
        document.getElementById("Login").style.borderBottom = "3px solid rgba(225,0,0,.6)"; 
        
        return false;
    }else{
        document.getElementById("Login").style.borderBottom = "3px solid rgba(0,225,0,.6)"; 
    }

    //validar Telefono
    var Valor = document.getElementById("Telefono").value;
    if(!/^([0-9])/.test(Valor) || Valor.length < 10){
        document.getElementById("Telefono").style.borderBottom = "3px solid rgba(225,0,0,.6)"; 
        
        return false;
    }else{
        document.getElementById("Telefono").style.borderBottom = "3px solid rgba(0,225,0,.6)"; 
    }
    
    //validar Documento
    var Valor = document.getElementById("Documento").value;

    if(!/^([0-9])/.test(Valor) || Valor.length < 9){
        document.getElementById("Documento").style.borderBottom = "3px solid rgba(225,0,0,.6)"; 
        
        return false;
    }else{
        document.getElementById("Documento").style.borderBottom = "3px solid rgba(0,225,0,.6)"; 
    }
    
    //validar Tabla
    var Valor = document.getElementById("Tabla").value;

    if(!Valor == "cliente" || !Valor == "acarreador"){
        document.getElementById("Tabla").style.borderBottom = "3px solid rgba(225,0,0,.6)"; 
        
        return false;
    }else{
        document.getElementById("Tabla").style.borderBottom = "3px solid rgba(0,225,0,.6)"; 
    }

    return true;

}
//
