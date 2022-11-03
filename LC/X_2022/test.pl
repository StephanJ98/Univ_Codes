:-op(100,xfy,[por]).
:-op(200,xfx,[es]).
:-op(300,fx,[de]).
:-op(400,fx,[cartesiano]).
:-op(500,fx,[producto]).
:-op(600,fx,[el]).
:-op(700,xf,[definitivamente]).

el producto cartesiano de [] por _ por _ es [] definitivamente.
el producto cartesiano de Conj1 por Conj2 por Conj3 es Resultado definitivamente:- 
                 cartesiano(Conj2,Conj3,I),
                 cartesiano(Conj1,I,Resultado).

cartesiano([],_,[]).
cartesiano([Car|Cdr], Conjunto, Resultado) :- 
                     linea(Car,Conjunto,Linea),
                     cartesiano(Cdr, Conjunto, Resto),
                     concatenar(Linea,Resto,Resultado).

linea(_,[],[]).
linea(Elemento,[Car|Cdr],[[Elemento,Car]|Resto]) :- 
                     linea(Elemento,Cdr,Resto).

concatenar([],L,L).
concatenar([Car|Cdr],L,[Car|R]) :- concatenar(Cdr,L,R).