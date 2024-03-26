grammar compiladores;

 @header {
 package compiladores;
 }


//------------------------------------------------------------------------------
//TEST

//fragment LETRA : [A-Za-z] ;
//fragment DIGITO : [0-9] ;


//NUMERO : DIGITO+ ;
//OTRO : . ;

//ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

// s : ID     { System.out.println("ID ->" + $ID.getText() + "<--"); }         s
//   | NUMERO { System.out.println("NUMERO ->" + $NUMERO.getText() + "<--"); } s
//   | OTRO   { System.out.println("Otro ->" + $OTRO.getText() + "<--"); }     s
//   | EOF
//   ;

//------------------------------------------------------------------------------
//ENTREGABLE 1
// Debe entregar un archivo ANTLR que contenga las expresiones regulares y reglas sintácticas necesarias para realizar la verificación del balance de llaves, corchetes y paréntesis.

PA : '(' ;
PC : ')' ; 
CA : '[' ;
CC : ']' ;
LA : '{' ;
LC : '}' ; 

si : s EOF ;

s : PA s PC s       //checkeo parentesis
    | CA s CC s     //checkeo corchetes
    | LA s LC s     //checkeo llaves
    |
    ;

