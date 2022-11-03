:-op(200,fx,[resultado]).
:-op(300,fx,[como]).
:-op(400,yfx,[obtiene]).
:-op(500,yfx,[con]).
:-op(600,fx,[de]).
:-op(700,fx,[concatenacion]).
:-op(800,fx,[la]).

la concatenacion de Lista1 con Lista2 con Lista3 obtiene como resultado Resultado :-
     concatenar(Lista1,Lista2,Intermedio),
     concatenar(Intermedio,Lista3,Resultado).

concatenar([],Lista,Lista).
concatenar([Car|Cdr],Lista,[Car|Resultado]) :- concatenar(Cdr,Lista,Resultado).