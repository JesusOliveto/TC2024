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


/*texto a analizar:
29/03/2019	19:09
12/03/2019	16:16
12/03/2019	09:09
20/12/2018	06:33
20/12/2018	18:31
14/12/2018	23:56
11/12/2018	01:37
06/12/2018	12:29
09/11/2018	07:49
22/10/2018	08:01
07/09/2018	19:53
27/08/2018	02:42
27/03/2018	11:01
27/03/2018	12:22
22/12/2017	01:53
22/12/2017	01:39
22/12/2017	19:37
 */

// TOKENS
DIGIT: [0-9] ;
OTRO : . ;
PARES: [02468] ;
SEPARADOR: '/' ;
SALTO_LINEA: '\r'? '\n' | '\r' ;


// Definir una Expresión Regular para capturar fechas correspondientes a los meses pares (formato DD/MM/YYYY).
MESES_PARES : DIGIT DIGIT SEPARADOR PARES PARES SEPARADOR DIGIT DIGIT DIGIT DIGIT
            | DIGIT DIGIT SEPARADOR DIGIT PARES SEPARADOR DIGIT DIGIT DIGIT DIGIT
            ;
//             dia        /   meses pares    /     año

FECHA : DIGIT DIGIT SEPARADOR DIGIT DIGIT SEPARADOR DIGIT DIGIT DIGIT DIGIT
      ;


//Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 08:00 y las 12:59 (formato HH:MM).
HORA_MANANA : '0' ('8' | '9') ':' DIGIT DIGIT
            | '1' ('0' | '1' | '2') ':' DIGIT DIGIT
            ;

//Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 18:30 y las 21:30 (formato HH:MM).
HORA_NOCHE : '1' ('8' | '9') ':' '3' ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9')
           | '1' '9' ':' '3' '0'
           | '2' ('0' | '1') ':' '3' '0'
           | '2' '1' ':' '3' '0'
           ;

HORA_CUALQUIERA : DIGIT DIGIT ':' DIGIT DIGIT
                ;




//Al ejecutar el programa, deberá imprimir en pantalla el número de línea, el tipo de token y el token encontrado (ver archivo ejemplo adjunto).

si : s EOF;

s : MESES_PARES {System.out.println("MES PAR ->" + $MESES_PARES.getText() + "<--" + "EN LINEA" + $MESES_PARES.getLine());} s
  | FECHA s
  | HORA_MANANA {System.out.println("HORA MANANA ->" + $HORA_MANANA.getText() + "<--" + "EN LINEA " + $HORA_MANANA.getLine());} s
  | HORA_NOCHE  {System.out.println("HORA NOCHE ->" + $HORA_NOCHE.getText() + "<--" + "EN LINEA " + $HORA_NOCHE.getLine());} s
  | HORA_CUALQUIERA s
  | OTRO  s
  | SALTO_LINEA s
  | EOF
  ;