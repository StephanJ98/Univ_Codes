escalar([],[],0). 
escalar([X|Xs],[Y|Ys],N):- escalar(Xs,Ys,N1), N is N1+X*Y.
 % escalar OK




duplicar_menores(Piv,[],[]).
duplicar_menores(Piv,[Car|Cdr],Res) :- duplicar_menores(Piv,[Car,Carl|Cdr],[Car,Car]), Car < Piv.