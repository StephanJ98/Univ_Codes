/* Representaremos cada casa mediante una lista

   [Color, Nacionalidad, Coche, Bebida, Mascota]

*/

/* Buscamos generar la lista L de las 5 casas, con toda su información */
/* El operador lógico "=" fuerza la unificación de sus dos argumentos    */
/* "member" es un predicado predefinido, que es cierto si su primer argumento
   forma parte de la lista que aparece en el segundo (argumento) */

resolver(L) :- [_,_,[_,_,_,leche,_],_,_]   = L,                 /* pista 8 */
               [[_,noruego,_,_,_],_,_,_,_] = L,                 /* pista 9 */
	    member([verde,_,_,cafe,_], L),                      /* pista 3 */
	    member([rojo,ingles,_,_,_], L),                     /* pista 1 */
    	    member([_,ucraniano,_,te,_], L),                    /* pista 4 */
    	    member([amarillo,_,masserati,_,_], L),              /* pista 7 */
    	    member([_,_,honda,naranja,_], L),                   /* pista 12 */
    	    member([_,japones,jaguar,_,_], L),                  /* pista 13 */
    	    member([_,español,_,_,perro], L),                   /* pista 2 */
    	    member([_,_,porsche,_,caracol], L),                 /* pista 6 */
    	    izqda_der([marfil,_,_,_,_],[verde,_,_,_,_], L),     /* pista 5 */
    	    contigua([_,noruego,_,_,_],[azul,_,_,_,_], L),      /* pista 14 */
            contigua([_,_,masserati,_,_],[_,_,_,_,caballo], L), /* pista 11 */
    	    contigua([_,_,saab,_,_],[_,_,_,_,zorro], L),        /* pista 10 */
	    true.

/* Al incluir un "true" al final, forzamos que la respuesta sea esa,
   si se han conseguido reso,ver adecuadamente todos los objetivos
   previos.  No es necesario hacerlo, simplemente es un "modo de
   operar" que algunos programadores aplican como remanente de un estilo
   de programación "funcional"     */

/* izqda_der(I,D,L) es true si I esta a la inmediata izqda de D en
   lista L */ /* La notación [I_1, I_2, ... I_n | Cola] representa una
   lista cuyos primeros n elementos son I_1, I_2, ... I_n y cuya cola
   (el resto de elementos) es Cola */
/* La notación "_" representa una "variable anonima", esto es, que no nos
   importa para nada su valor porque nada aporta a nivel de unificación al
   significado de la regla.        */

izqda_der(I,D,[I,D|_]).
izqda_der(I,D,[_|L]) :- izqda_der(I,D,L).


/* contiguo(X,Y,L) es true si X e Y son contiguos en la lista L */

contigua(X,Y,L) :- izqda_der(X,Y,L).
contigua(X,Y,L) :- izqda_der(Y,X,L).

/* Algunas preguntas posibles */

/* ¿ quién es el propietario de la cebra ? */

/* Podemos escribir esta regla ... y luego teclear ":- propietario_cebra(P) "*/

propietario_cebra(P) :- resolver(L), member([_,P,_,_,cebra], L).

/* ... o podemos ahorrarnos la cabeza, y simplemente teclear como pregunta
   ":- resolver(L), member([_,P,_,_,cebra], L)." */ 

/* Lo mismo podemos hacer con la pergunta "¿ quién bebe agua ?",
   a partir de la regla */

bebedor_agua(P) :- resolver(L), member([_,P,_,agua,_], L).

