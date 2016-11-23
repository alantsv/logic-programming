%Ex 20
	remove(X,L,Lr):- L=[X|Xs], remove(X,Xs,Lr).
	remove(X,L,Lr):- L=[Y|Xs], X\=Y remove(X,Xs,Xr),Lr=[Y|Xr].
	remove(X,[],[]).

%?- remove(a,[a,b,a,b,c,a,d,a,a,a],X). X=[b,b,c,d]

%Ex 20.2

	remove1(X,L,Lr):- select(X,L,Lo), remove1(X,Lo,Lr).
	remove1(X,L,Lr):- \+ select(X,L,_), Lr=L.

%?- remove(a,[a,b,a,b,c,a,d,a,a,a],X). X=[b,b,c,d]
