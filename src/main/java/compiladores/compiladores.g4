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
OTRO : . ;

// Definir una Expresión Regular para capturar fechas correspondientes a los meses pares (formato DD/MM/YYYY).
meses_pares : DIGIT DIGIT '/' ( '0' [2468] | '1' [02] ) '/' DIGIT DIGIT DIGIT DIGIT ;
//             dia        /     meses pares                               /     año



//Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 08:00 y las 12:59 (formato HH:MM).
hora_manana : '0' [8-9] ':' DIGIT DIGIT
            | '1' [0-2] ':' DIGIT DIGIT
            ;

//Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 18:30 y las 21:30 (formato HH:MM).
hora_noche : '1' [8-9] ':' '3' [0-9]
           | '1' [9] ':' '3' [0]
           | '2' [0-1] ':' '3' [0]
           | '2' [1] ':' '3' [0]
           ;

 
//Al ejecutar el programa, deberá imprimir en pantalla el número de línea, el tipo de token y el token encontrado (ver archivo ejemplo adjunto).

s: meses_pares  s
| hora_manana   s
| hora_noche s
| OTRO s
| EOF   
;

