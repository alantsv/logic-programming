%42 - 
	enezimo(N, [X|Xs],Y):- N=<1.
	enezimo(N,[X|xs], Y):- N>1, N1 is N-1, enezimo(N1,Xs,Y).
	
%?-enezimo(4, [a,b,c,d,e,f],X). X = d

%43 - 
	
	comp2(L,C):- L=[], C=0,!.
	comp2(L,C):- L=[X|Xs], comp2(Xs,C1), C is 1+C1.

%?- comp2([a,b,c,d], X). X =4
%?- L =[a,b,c,d], comp2(L,X), length(L,X). X = 4 Yes


