%32- Está ordemada?
	
	isOrdered([]).
	isOrdered([X]).
	isOrdered([X,Y|XYs]):- X=<Y, isOrdered([Y|XYs]).

%?- isOrdered([1,5,5,11]). Yes
%?- IsOrdered([2,1]). No

%35- Ordenada
%(23- Permutação)
	permutacao(Xs,[Z|Zs]):- select(Z, Xs, Ys), permutacao(Ys,Zs).
	permutacao([],[]).

%?- select(5,[1,3,5,7], X). X=[1,3,7]
%?- permutacao([1,7,5,3],X). X = [1,3,5,7]

	sotx(L,S):- permutacao(L,S), isOrdered(S).

%?- sotx([1,7,5,3], X). X= [1,3,5,7]
