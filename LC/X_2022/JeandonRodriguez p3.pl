:-op(100,xfy,[menos]).
:-op(150,fx,[conjunto]).
:-op(175,fx,[el]).
:-op(200,xfx,[obtiene]).
:-op(300,fx,[de]).
:-op(400,fx,[diferencia]).
:-op(500,fx,[la]).
:-op(600,xf,[como]).
:-op(700,xf,[resultado]).

la diferencia de [] menos _ menos _ obtiene el conjunto [] como resultado.
la diferencia de Conj1 menos Conj2 menos Conj3 obtiene el conjunto Resul como resultado:- diferencia(Conj1,Conj2,Res) , diferencia(Res,Conj3,Resul).

diferencia([],_,[]).
diferencia([Car|Cdr],C,R):- member(Car,C), !, diferencia(Cdr,C,R).
diferencia([Car|Cdr],C,[Car|R]):- diferencia(Cdr,C,R).