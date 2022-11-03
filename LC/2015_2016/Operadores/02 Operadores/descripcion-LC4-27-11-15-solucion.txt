:-op(100,xfy,[y]).
:-op(200,fx,[de]).
:-op(300,fx,[interseccion]).
:-op(400,fx,[la]).
:-op(500,fx,[conjunto]).
:-op(600,fx,[el]).
:-op(700,xf,[en]).
:-op(800,xf,[algebra]).
:-op(900,xfx,[es]).


el conjunto [] es la interseccion de [] y _ y _ en algebra.
el conjunto Resultado es la interseccion de Conj1 y Conj2 y Conj3 en algebra :- 
                           interseccion(Conj1, Conj2, I),
                           interseccion(I, Conj3, Resultado).

interseccion([],_,[]).
interseccion([Car|Cdr],Conjunto,[Car|Resultado]):- 
                                 miembro(Car,Conjunto),!,
                                 interseccion(Cdr, Conjunto, Resultado).

interseccion([_|Cdr], Conjunto, Resultado) :- 
                                 interseccion(Cdr, Conjunto, Resultado).

miembro(Elemento,[Elemento|_]):-!.
miembro(Elemento,[_|Cdr]) :- miembro(Elemento,Cdr).

/* :- el conjunto X es la interseccion de [1,a,3] y [a,b,3] y [3,a,4] en algebra. */
