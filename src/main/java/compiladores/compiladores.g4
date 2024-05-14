grammar compiladores;

 @header {
 package compiladores;
 }


//parcial 1

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
MASMAS : '++' ;
MENOS : '-' ;
MENOSMENOS : '--' ;
MULTIPLICACION : '*' ;
DIVISION : '/' ;
MODULO : '%' ;
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




//palabras reservadas

WHILE : 'while' ;
FOR : 'for' ;
IF : 'if' ;
ELSE : 'else' ;

DT : 'int' | 'double';
COMP : MAYOR | MENOR | MAYORIGUAL | MENORIGUAL | IGUALIGUAL | DIFERENTE ;
OPERADOR : MAS | MENOS | MULTIPLICACION | DIVISION | MODULO ;
LOGICO : AND | OR | NOT ;

NUMERO : DIGITO+ ;
ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

programa : instrucciones EOF ;

instrucciones : instruccion instrucciones?
              | 
              ;


instruccion :declaracion 
            |asignacion 
            |while
            |if
            |for
            ;

declaracion : DT ID PYC
            | DT asignacion
            | 
            ;



asignacion : ID IGUAL expresiones
           ;

expresiones   : expr PYC expresiones
              |
              ;

expr  : term t;

term  : factor f;

t     : MAS term t
      | MENOS term t
      | MASMAS
      | MENOSMENOS
      ;

factor : NUMERO
       | ID
       | PA expr PC
       ;

f : MULTIPLICACION factor f
  | DIVISION factor f
  | MODULO factor f
  |
  ;

  

condicion   : (ID | NUMERO) COMP (ID | NUMERO)
            | 
            ;

condiciones : condicion LOGICO condiciones
            | 
            ;



bloque : LA instruccion* LC
       ;

while : WHILE PA condicion PC (bloque | instruccion)
      ;

if : IF PA condicion PC (bloque | instruccion) else?
   ;

else : ELSE (bloque | instruccion)
     ;

for : FOR PA asignacion? PYC condicion? PYC asignacion? PC (bloque | instruccion)
    ;
