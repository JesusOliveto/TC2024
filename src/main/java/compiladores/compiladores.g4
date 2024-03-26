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
// //ENTREGABLE 1
// // Debe entregar un archivo ANTLR que contenga las expresiones regulares y reglas sintácticas necesarias para realizar la verificación del balance de llaves, corchetes y paréntesis.

// PA : '(' ;
// PC : ')' ; 
// CA : '[' ;
// CC : ']' ;
// LA : '{' ;
// LC : '}' ; 

// si : s EOF ;

// s : PA s PC s       //checkeo parentesis
//     | CA s CC s     //checkeo corchetes
//     | LA s LC s     //checkeo llaves
//     |
//     ;

//------------------------------------------------------------------------------
// //ENTREGABLE 2

// TOKENS
DIGIT: [0-9] ;
WS: [ \t\n\r]+ -> skip ;

// Definir una Expresión Regular para capturar fechas correspondientes a los meses pares (formato DD/MM/YYYY).
meses_pares: DIGIT DIGIT '/' ( '02' | '04' | '06' | '08' | '10' | '12' ) '/' DIGIT DIGIT DIGIT DIGIT ;
//             dia        /     meses pares                               /     año

//Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 08:00 y las 12:59 (formato HH:MM).
hora_manana: '08' | '09' | '1' DIGIT ':' DIGIT DIGIT | '12' ':' ('0' DIGIT | '1' '0' | '1' '1' | '1' '2') ;

//Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 18:30 y las 21:30 (formato HH:MM).
hora_noche: ('18' | '19' | '20' | '21') ':' ('3' '0' | '3' '1' | '0' DIGIT) ;
 


