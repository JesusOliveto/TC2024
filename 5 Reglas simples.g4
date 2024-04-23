grammar compiladores;

@header {
package compiladores;
}


/*
ANALISIS SINTACTICO- REGLAS SIMPLES

Dado el proyecto base de Java con ANTLR presentado en clases, realizar el archivo .g4 con las expresiones regulares y reglas sintácticas que contemple las siguientes instrucciones:
declaracion -> int x;
               double y;
               int z = 0;
               double w, q, t;
               int a = 5, b, c = 10;

asignacion -> x = 1;
              z = y;

iwhile -> while (x comp y) { instrucciones }
NOTA: Entregar solamente el archivo *.g4
 */
fragment DIGITO : [0-9];

// Caracteres especiales
PA : '(';
PC : ')';
PyC: ';';
IGU: '=';

// Comparadores
EQ: '==';
GT: '>';
GE: '>=';
LT: '<';
LE: '<=';
NEQ: '!=';

// Variables
INT : 'int' ;
DOUBLE: 'double';

// Palabras reservadas
IWHILE: 'while';

// Nombre de variables
VAR: [a-zA-Z]+ ;

WS : [ \t\n\r] -> skip;

programa : instrucciones EOF ;

instrucciones : instruccion instrucciones
              |
              ;

instruccion : declaracion PyC
            | asignacion PyC
            | bucle_while
            ;

declaracion: INT VAR
            | DOUBLE VAR
            ;

asignacion: VAR IGU VAR
            ;

bloque: '{' instrucciones '}';

bucle_while: IWHILE '(' cond ')' bloque;

cond: e comparadores e
    ;

comparadores : GT
             | GE
             | LT
             | LE
             | EQ
             | NEQ
             ;

e: term;

term: factor;

factor: VAR
      | '(' e ')'
      ;
