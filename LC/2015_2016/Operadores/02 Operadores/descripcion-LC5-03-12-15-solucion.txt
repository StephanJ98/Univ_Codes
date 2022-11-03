:-op(100,fx,[conjunto]).
:-op(200,fx,[el]).
:-op(300,fx,[en]).
:-op(400,fx,[incluido]).
:-op(500,yfx,[esta]).
:-op(600,xf,[que]).
:-op(700,xf,[por]).
:-op(800,xf,[definicion]).

el conjunto X esta incluido en Y que esta incluido en Z por definicion :- inclusion(X,Y),inclusion(Y,Z).

inclusion([],_).
inclusion([Car|Cdr],C) :- miembro(Car,C),inclusion(Cdr,C).

miembro(Elemento,[Elemento|_]):-!.
miembro(Elemento,[_|Cdr]) :- miembro(Elemento,Cdr).

