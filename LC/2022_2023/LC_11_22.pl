% Inverso sin DL

inv([],[]).
inv([Car|Cdr],R) :- inv(Cdr,T), append(T,[Car],R).


% Inverso con DL

:-op(100,xfy,[\]).

inverso(Lista,Inv) :- inv_dl(Lista,Inv\[]).

inv_dl([],X\X).
inv_dl([Car|Cdr], X\Y) :- inv_dl(Cdr,X\[Car|Y]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aplanar sin DL

aplanar([],[]).
aplanar(Atomo,[Atomo]) :- atomic(Atomo), Atomo \== [].
aplanar([Car|Cdr],R) :- aplanar(Car,Car_aplanado),
						aplanar(Cdr,Cdr_aplanado),
						append(Car_aplanado,Cdr_aplanado,R).

% Aplanar con DL 

% :-op(100,xfy,[\]). Ya def antes.

apla(L,R) :- aplanar_dl(L,R\[]).

aplanar_dl([],X\X).
aplanar_dl(Atomo,[Atomo|Cdr]\Cdr) :- atomic(Atomo), Atomo \== [].
aplanar_dl([Car|Cdr],X\Z) :- aplanar_dl(Car, X\Y),
							 aplanar_dl(Cdr,Y\Z).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Linea sin DL 

linea(_,[],[]).
linea(E,[Car|Cdr],[[E|Car],R]) :- linea(E,Cdr,R).

% Linea con DL 

% :-op(100,xfy,[\]). Ya def antes.

lin(E,L,R) :- linea_dl(E,L,R\[]).

linea_dl(_,[],X\X).

% Ordenado normal
linea_dl(E,[Car|Cdr],[[E,Car]|X]\Y) :- linea_dl(E,Cdr,X\Y).

% Ordenado al reves
% linea_dl(E,[Car|Cdr],X\Y) :- linea_dl(E,Cdr,X\[[E,Car]|Y]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Producto Cartesiano sin DL 

cartesiano([],_,[]).
cartesiano([Car|Cdr],C2,R) :- linea(Car,C2,L),
							  cartesiano(Cdr,C2,R2),
							  append(L,R2,R).

% Producto Cartesiano con DL 

% :-op(100,xfy,[\]). Ya def antes.

cartes(L1,L2,R) :- cartesiano_dl(L1,L2,R\[]).

cartesiano_dl([],_,X\X).
cartesiano_dl([Car|Cdr],T,X\Z) :- linea_dl(Car,T,X\Y),
								  cartesiano_dl(Cdr,T,Y\Z).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Quicksort sin DL 

partir(_,[],[],[]).
partir(Pivot,[Car|Cdr],[Car|Izq],Der) :- Car < Pivot,
										 !,
										 partir(Pivot,Cdr,Izq,Der).
partir(Pivot,[Car|Cdr],Izq,[Car|Der]) :- partir(Pivot,Cdr,Izq,Der).

quicksort([],[]).
quicksort([Car|Cdr],R) :- partir(Car,Cdr,Izq,Der),
						  quicksort(Izq,Izq_ordenada),
						  quicksort(Der,Der_ordenada),
						  append(Izq_ordenada,[Car|Der_ordenada],R).

% Quicksort con DL

% :-op(100,xfy,[\]). Ya def antes. 

quick(L,R) :- quicksort_dl(L,R\[]).

quicksort_dl([],X\X).
quicksort_dl([Car|Cdr],X\Z) :- partir(Car,Cdr,Izq,Der),
							   quicksort_dl(Izq,X\[Car|Y]),
							   quicksort_dl(Der,Y\Z).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hanoi sin DL 

:-op(600,yfx,a).

hanoi(1,A,B,_,[A a B]) :- !.
hanoi(N,A,B,C,Movs) :- N1 is N - 1,
					   hanoi(N1,A,C,B,Movs1),
					   hanoi(N1,C,B,A,Movs2),
					   append(Movs1,[A a B|Movs2],Movs).

% Hanoi con DL 
% :-op(100,xfy,[\]). Ya def antes. 


han(N,A,B,C,R) :- hanoi_dl(N,A,B,C,R\[]).

hanoi_dl(1,A,B,_,[A a B|X]\X) :- !.
hanoi_dl(N,A,B,C,X\Z) :- N1 is N - 1,
						 hanoi_dl(N1,A,C,B,X\[A a B|Y]),
						 hanoi_dl(N1,C,B,A,Y\Z).