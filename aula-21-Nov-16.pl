%Ex 17
	trocaPU(PMsU,UMsP) :- PMsU = [P|MsU], append(Ms,[U],MsU), append(Ms,[P], MsP), [U|MsP]= UMsP.

%?- trocaPU([a,b,c,d], X)
%?- X[d,b,c,a]

%Ex 17.2
	trocaPU1([P|MsU],[U|MsP]):- append(Ms,[U], MsU), append(Ms,[P],MsP).
