 preorden(Arb,Pre) :- preo(Arb,Pre-[]).

 preo([A,nil,nil],[A|X]-X):-!.
 preo([A,I,nil],[A|S]-X) :- preo(I,S-X),!.
 preo([A,nil,D],[A|S]-X) :- preo(D,S-X),!.
 preo([A,I,D],[A|T]-O) :- preo(D,T-X), preo(I,X-O).

 % Test preorden([a,[b,[d,nil,nil],nil],[c,nil,nil]],X).