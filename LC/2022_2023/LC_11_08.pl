partir(_,[],[],[]).
partir(Pivot,[Car|Cdr],[Car|Izq],Der) :- Car=<Pivot,
										 !,
										 partir(Pivot,Cdr,Izq,Der).
partir(Pivot,[Car|Cdr],Izq,[Car|Der]) :- partir(Pivot,Cdr,Izq,Der).

concat([],[]).
concat([Car|Cdr],L,[Car|R]) :- concat(Cdr,L,R).


% No funciona
quicksort([],[]).
quicksort([Car|Cdr],R) :- partir(Car,Cdr,Izq,Der),
						  quicksort(Izq,Izq-ordenada),
						  quicksort(Der,Der-ordenada),
						  concat(Izq-ordenada,[Car|Der-ordenada],R).

int([],_,[]).
int([Car|Cdr],L,[Car|I]) :- member(Car,L),!,int(Cdr,L,I).
int([_|Cdr],L,I) :- int(Cdr,L,I).

% Sin Cortes
unir([],X,X).
unir(X,[],X).
unir([Car1|Cdr1],[Car2|Cdr2],[Car1,Car2|U]) :- unir(Cdr1,Cdr2,U).

% Con Cortes
union([],L,L).
union([Car|Cdr],L,I) :- member(Car,L),!,union(Cdr,L,I).
union([Car|Cdr],L,[Car|I]) :- union(Cdr,L,I).

conj([]).
conj([Car|Cdr]) :- member(Car,Cdr),!,fail.
conj([_|Cdr]) :- conj(Cdr).

prefijo([],_).
prefijo([Car|Cdr1],[Car|Cdr2]) :- prefijo(Cdr1,Cdr2).
