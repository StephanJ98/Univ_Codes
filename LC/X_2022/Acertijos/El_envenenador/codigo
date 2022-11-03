uno_toxico_otro_no(violeta,azul).      /* pista 1 */
uno_toxico_otro_no(rojo,amarillo).     /* pista 2 */
uno_toxico_otro_no(azul,naranja).      /* pista 3 */

uno_no_toxico(violeta,amarillo).       /* pista 4 */
uno_no_toxico(rojo,naranja).           /* pista 5 */
uno_no_toxico(verde,azul).             /* pista 6 */

no_toxico(rojo).                       /* pista 7 */
no_toxico(X) :- (uno_no_toxico(X,Y);uno_no_toxico(Y,X)), toxico(Y).

toxico(X) :- (uno_toxico_otro_no(X,Y);uno_toxico_otro_no(Y,X)), no_toxico(Y).

/* la pregunta a hacer es findall(X,toxico(X),L) */

/* findall/3 es un predicado predefinido que devuelve en su tercer
   argumento la lista de valores para X que verifiquen el predicado de
   su segundo argumento */

resolver(L) :- findall(X,toxico(X),L).
