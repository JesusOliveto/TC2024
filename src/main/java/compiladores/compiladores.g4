grammar compiladores;

 @header {
 package compiladores;
 }


//parcial 1



//palabras reservadas

WHILE : 'while' ;
FOR : 'for' ;
IF : 'if' ;
ELSE : 'else' ;
RETURN : 'return' ;

DT : 'int' | 'double' | 'void' | 'char' | 'float' | 'string' | 'bool' ;
COMP : MAYOR | MENOR | MAYORIGUAL | MENORIGUAL | IGUALIGUAL | DIFERENTE ;
SUMA : MAS | MENOS ;
OPERADOR :  MULTIPLICACION | DIVISION | MODULO ;
LOGICO : AND | OR | NOT ;

NUMERO : DIGITO+ ;
ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

programa : instrucciones EOF ;

instrucciones : instruccion*
              ;


instruccion :bloque
            |declaracion_funcion
            |asignacion 
            |while
            |if
            |for
            |declaracion 
            |funcion
            |llamada_funcion
            |return
            |ternario
            ;

declaracion : DT ID PYC
            | DT asignacion
            ;



asignacion : ID IGUAL expresiones
           | ID MASMAS PYC?
           | ID MENOSMENOS PYC? 
           ;

expresiones   : expr PYC expresiones?
              ;

expr  : e;

e :  term t;

term  : factor f;

t     : SUMA term t
      |
      ;

factor : NUMERO
       | ID
       | PA expr PC
       ;

f : OPERADOR factor f
  | MASMAS
  | MENOSMENOS
  |
  ;

  

condicion   : (ID | NUMERO) COMP (ID | NUMERO)
            ;

condiciones : condicion LOGICO condiciones
            | condicion
            ;

return : RETURN expresiones
       | RETURN PYC
       ;

bloque : LA instruccion* LC
       ;

while : WHILE PA condicion PC instruccion
      ;

if : IF PA condicion PC instruccion else?
   ;

else : ELSE instruccion
     ;

for : FOR PA ((declaracion|asignacion)|PYC) (condiciones) PYC asignacion? PC instruccion
    ;

declaracion_funcion : DT ID PA parametros PC PYC?
                    ;

funcion : declaracion_funcion bloque
        ;

llamada_funcion : ID PA parametros PC PYC
                ;

parametros : DT? (ID | NUMERO) (COMA parametros)?
            | declaracion (COMA parametros)?
            |
            ;

ternario : condiciones '?' expr ':' expr
        ;

//-----------------------------
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
fragment MAS : '+' ;
MASMAS : '++' ;
fragment MENOS : '-' ;
MENOSMENOS : '--' ;
fragment MULTIPLICACION : '*' ;
fragment DIVISION : '/' ;
fragment MODULO : '%' ;
COMA : ',' ;
fragment MAYOR : '>' ;
fragment MENOR : '<' ;
fragment MAYORIGUAL : '>=' ;
fragment MENORIGUAL : '<=' ;
fragment IGUALIGUAL : '==' ;
fragment DIFERENTE : '!=' ;
fragment AND : '&&' ;
fragment OR : '||' ;
fragment NOT : '!' ;


