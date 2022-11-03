:-op(100,xfy,[con]).
:-op(200,fx,[conjunto]).
:-op(300,fx,[del]).
:-op(400,fx,[union]).
:-op(500,fx,[la]).
:-op(600,xfx,[es]).
:-op(700,xf,[sin]).
:-op(800,xf,[duda]).

Resultado es la union del conjunto [] con Conj1 con Conj2 sin duda :-
                           union(Conj1, Conj2, Resultado).

Resultado es la union del conjunto Conj1 con Conj2 con Conj3 sin duda :- 
                           union(Conj1, Conj2, I),
                           union(I, Conj3, Resultado).

union([],Conjunto,Conjunto).
union([Car|Cdr],Conjunto,Resultado):- miembro(Car,Conjunto),!,
                                      union(Cdr, Conjunto, Resultado).

union([Car|Cdr], Conjunto, [Car|Resultado]) :- union(Cdr, Conjunto, Resultado).

miembro(Elemento,[Elemento|_]):-!.
miembro(Elemento,[_|Cdr]) :- miembro(Elemento,Cdr).

/* :- X es la union del conjunto [1,2,3] con [a,b] con [4,5,6] sin duda. */
