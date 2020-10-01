function Validar(){
    
    //validar fecha
    var Valor = document.getElementById("punt").value;

    if( Valor < 0 || Valor > 5 ){
        document.getElementById("punt"+"s").style.borderBottom = "4px solid rgba(225,0,0,.7)"; 
        
        return false;
    }else{
        document.getElementById("punt"+"s").style.borderBottom = "4px solid rgba(0,225,0,.7)"; 
    }
    

    return true;
}