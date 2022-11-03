miembro(Car, [Car|_]).
miembro(X, [_|Cdr]) :- miembro(X,Cdr).

primero(Car,[Car|_]).

segundo(Cadr,[_,Cadr|_]).

ultimo(Cdr,[Cdr]).
ultimo(X, [_|Cdr]) :- ultimo(X,Cdr).

penultimo(Car,[Car,_]).
penultimo(X, [_|Cdr]) :- penultimo(X,Cdr).

concat(L1,[],L1).
concat([],L2,L2).
concat([Car|[]],L2,[Car|L2]).
concat([Car|Cdr],L2,[Car|R]) :- concat(Cdr,L2,R).

inv([],[]).
inv([Car|[]],Car).
inv([Car|Cdr],R) :- inv(Cdr,RTEMP), concat(RTEMP,[Car],R).

inter([],_,[]).
inter([Car|_],[],[Car]).
inter([Car|Cdr],[Cadr|Cddr],[Car,Cadr|R]) :- inter(Cdr,Cddr,R). 