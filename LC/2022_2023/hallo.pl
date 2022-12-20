% Complementario

complementario(_,[],[]).
complementario(L,[Car|Cdr],R) :- member(Car,L), !, complementario(L,Cdr,R).
complementario(L,[Car|Cdr],[Car|R]) :- complementario(L,Cdr,R).

% Diferencia

% diferencia([],_,[]).
% diferencia([Car|Cdr],L,R) :- member(Car,L), !, diferencia(Cdr,L,R).
% diferencia([Car|Cdr],L,[Car|R]) :- diferencia(Cdr,L,R).


% la diferencia de Conj_1 y Conj_2 es Res.

:-op(100,xfy,[y]).
:-op(200,yfx,[es]).
:-op(300,fx,[de]).
:-op(400,fx,[diferencia]).
:-op(500,fx,[la]).

% la diferencia de Conj_1 y Conj_2 es Res :- diferencia(Conj_1,Conj_2,Res).

la diferencia de [] y _ es [].
la diferencia de [Car|Cdr] y L es R :- member(Car,L), !,
						la diferencia de Cdr y L es R.
la diferencia de [Car|Cdr] y L es [Car|R] :- 
						la diferencia de Cdr y L es R.