%24- Reverse com acumulador

	reverse(L,R):-reverse(L,[],R).
	reverse ([],R,R).
	reverse([X|Xs], ACC,R) :- reverse(Xs,[X|ACC],R)

%25- Reverso com recursividade
	
	reverso(L,R) :- L=[], R=[].
	reverso(L,R) :- L=[X|Xs], reverso(Xs, Xr), append(Xs, [X], R).
