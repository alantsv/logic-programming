%24- Reverse com acumulador

	reverse2(L,R):-reverse2(L,[],R).
	reverse2([],R,R).
	reverse2([X|Xs], ACC,R) :- reverse2(Xs,[X|ACC],R).

%25- Reverso com recursividade
	
	reverso(L,R) :- L=[], R=[].
	reverso(L,R) :- L=[X|Xs], reverso(Xs, Xr), append(Xr, [X], R).

%27- Lista palindrome?
	
	palindrome(L) :- reverse(L,R), L=R.

%27.1- Lista palindrome? (Outra versão)

	palindrome1(L):- L=[X|Xs], append(Xm, [U], Xs), X=U, palindrome1(Xm).
	palindrome1([]):-!.
	palindrome1([X]):-!.
%28 - Metade iguais?
	
	metIguais(L):- append(M,M,L).

% Primeiros N elementos da lista L

	primeiros(L,N,L1):- length(L1,N), append(L1,_,L).

	%primeiros([a,b,c,d],2,L1). L1=[a,b]

% Usando primeiros e reverse faça metades iguais

metIguais2(XY):- length(XY,L), M is L/2,
		primeiros(XY,M,X),
		reverse(XY,YX),
		primeiros(YX,M,Yr),
		reverse(Yr, Y), Y = X.

%34(b) - Minimo de uma lista usando acumulador

	minL(L,M):- L=[X|Xs], minL(L,X,M).
	minL(L,Acc,M):- L=[], M=Acc,!.
	minL(L,Acc,M):- L=[X|Xs], Acc > X, minL(Xs,X,M).
	minL(L,Acc,M):- L=[X|Xs], Acc =< X, minL(Xs,Acc,M).
