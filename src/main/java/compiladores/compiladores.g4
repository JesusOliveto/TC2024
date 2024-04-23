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

// //------------------------------------------------------------------------------
// // // //ENTREGABLE 2

//  // TOKENS
//  fragment DIGIT: [0-9] ;
//  OTRO : . ;
//  fragment PARES: [02468] ;
//  fragment SEPARADOR: '/' ;
//  SALTO_LINEA: '\r'? '\n' | '\r' ;


//  // Definir una Expresión Regular para capturar fechas correspondientes a los meses pares (formato DD/MM/YYYY).
//  MESES_PARES : DIGIT DIGIT SEPARADOR (PARES DIGIT | DIGIT PARES) SEPARADOR DIGIT DIGIT DIGIT DIGIT;
//  //             dia            /            meses pares              /              año

//  FECHA : DIGIT DIGIT SEPARADOR DIGIT DIGIT SEPARADOR DIGIT DIGIT DIGIT DIGIT;


//  //Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 08:00 y las 12:59 (formato HH:MM).
//  HORA_MANANA : '0' ('8' | '9')| '1' ('0' |'1' |'2') ':' DIGIT DIGIT;
             

//  //Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 18:30 y las 21:30 (formato HH:MM).
//  HORA_NOCHE : '1' '8' ':' ('3'|'4'|'5') DIGIT| ('1' '9' | '2' '0') ':' DIGIT DIGIT | '2' '1' ':' ('0'|'1'|'2') DIGIT;


//  HORA_CUALQUIERA : DIGIT DIGIT ':' DIGIT DIGIT
//                  ;




// // //Al ejecutar el programa, deberá imprimir en pantalla el número de línea, el tipo de token y el token encontrado (ver archivo ejemplo adjunto).

//  si : s EOF;

//  s : MESES_PARES {System.out.println("MES PAR ->" + $MESES_PARES.getText() + "<--" + "EN LINEA" + $MESES_PARES.getLine());} s
//    | FECHA s
//    | HORA_MANANA {System.out.println("HORA MANANA ->" + $HORA_MANANA.getText() + "<--" + "EN LINEA " + $HORA_MANANA.getLine());} s
//    | HORA_NOCHE  {System.out.println("HORA NOCHE ->" + $HORA_NOCHE.getText() + "<--" + "EN LINEA " + $HORA_NOCHE.getLine());} s
//    | HORA_CUALQUIERA s
//    | OTRO  s
//    | SALTO_LINEA s
//    | EOF
//    ;

//----------------------------------------------------------------------------------------------
// clase 9/4 



//tokens
PA : '(' ;
PC : ')' ; 
CA : '[' ;
CC : ']' ;
LA : '{' ;
LC : '}' ; 
fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;
WS : [ \t\n\r]+ -> skip ;

//simbolos
PYC : ';' ;
IGUAL : '=' ;
MAS : '+' ;
COMA : ',' ;
MAYOR : '>' ;
MENOR : '<' ;
MAYORIGUAL : '>=' ;
MENORIGUAL : '<=' ;
IGUALIGUAL : '==' ;
DIFERENTE : '!=' ;


//palabras reservadas

WHILE : 'while' ;

DT : 'int' | 'double';
COMP : MAYOR | MENOR | MAYORIGUAL | MENORIGUAL | IGUALIGUAL | DIFERENTE ;

NUMERO : DIGITO+ ;
ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

programa : instrucciones EOF ;

instrucciones : instruccion instrucciones
              | 
              ;

instruccion :declaracion PYC
            |asignacion PYC
            |while
            ;

declaracion : DT ID 
            | DT ID IGUAL NUMERO COMA declaracion
            | DT asignacion 
            | DT ID COMA declaracion
            | ID COMA declaracion
            | ID IGUAL NUMERO 
            | ID 
            ;


asignacion : ID IGUAL NUMERO 
            |ID COMA asignacion
            |ID COMA declaracion 
            |ID IGUAL ID 
           ;


condicion   : ID COMP ID
            | ID COMP NUMERO
            | NUMERO COMP ID
            | NUMERO COMP NUMERO
            ;

bloque : LA instrucciones LC
       ;

while : WHILE PA condicion PC bloque
      ;


