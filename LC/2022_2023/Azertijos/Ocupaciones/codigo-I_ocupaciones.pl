mujer(clara).
mujer(luisa).
mujer(maria).
mujer(nelida).

ocupacion(disenadora).
ocupacion(florista).
ocupacion(jardinera).
ocupacion(directora).

es(clara,florista).    /* pista 1 */
es(clara,jardinera).   /* pista 1 */
es(luisa,florista).    /* pista 2 */
es(luisa,directora).   /* pista 3 */
es(maria,directora).   /* pista 3 */
es(nelida,jardinera).  /* pista 4 */
es(nelida,disenadora). /* pista 4 */

/* El predicado predefinido "not" implementa la "negación por fallo" */
/* El predicado predefinido "==" es cierto si ambos argumentos son idénticos */

diferentes(A,B,C,D) :- not(A == B),
                       not(A == C),
                       not(A == D),
                       not(B == C),
                       not(B == D),
                       not(C == D).

/* representamos el par mujer-ocupación mediante la lista
   [Mujer, Ocupacion]
*/   
		       
resolver([[M1,O1],[M2,O2],[M3,O3],[M4,O4]]) :- mujer(M1),mujer(M2),
                                             mujer(M3),mujer(M4),
					     ocupacion(O1),
					     ocupacion(O2),
					     ocupacion(O3),
					     ocupacion(O4),
					     diferentes(M1,M2,M3,M4),
     					     diferentes(O1,O2,O3,O4),
					     not(es(M1,O1)),
					     not(es(M2,O2)),
					     not(es(M3,O3)),
					     not(es(M4,O4)).

/* Buscamos que las relaciones es(Mi,Oi) no se verifiquen */

/* Ahora basta plantear la pregunta ":- resolver(L)." */
