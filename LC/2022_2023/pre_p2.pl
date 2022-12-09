:-op(100,xfy,[\]).

% prefijo(L1,L2):- append(L1,_,L2).
% sufijo(L1,L2):- append(_,L1,L2).

% Invertir
invertir(L,R) :- invertir_dl(L,R\[]).
invertir_dl([],R\R).
invertir_dl([Car|Cdr],R\C) :- invertir_dl(Cdr, R\[Car|C]).

% Lista a DL
dl([],L\L).
dl([H|T],[H|L1]\L2) :- dl(T,L1\L2).

% Append DL
appendl(X\Y,Y\Z,X\Z).

% Prefijo DL
prefijo(P,L) :- dl(P,PDL),
                dl(L,LDL),
                appendl(PDL,_,LDL).			                

pre2(L1,L2) :- dl(L1,L3), pre_dl(L3,L2\[]). 
pre_dl(L1\_,L1\_).

% Sufijo DL
sufijo(S,L) :- invertir(S,InvS), dl(InvS,ISDL),
			   invertir(L,InvL), dl(InvL,ILDL),
			   appendl(ILDL,_,ISDL).	

suf2(L1,L2) :- invertir(L2,InvL2),
			   invertir(L1,InvL1), 
			   dl(InvL1,L3), 
			   suf_dl(L3,InvL2\InvL1).
suf_dl(X\_,X\_). 