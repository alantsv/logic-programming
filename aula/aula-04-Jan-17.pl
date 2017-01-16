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
%?- permutacao([1,7,5,3],X). X = [1,3,5,7] ; ... X=[1,7,3,5] ; ... ... X=[1,3,5,7]

	sotx(L,S):- permutacao(L,S), isOrdered(S).

%?- sotx([1,7,5,3], X). X= [1,3,5,7]

%36- Inserção odernada

	insOrd(X,[],[X]).
	insOrd(X,[Y|Ys], [X, Y|Ys]):- X<Y.
	insOrd(X, [Y|Ys], [Y|XYs]):- X>=Y, insOrd(X,Ys,XYs).

%?- insOrd(4,[2,3,5,7],L). L=[2,3,4,5,7]

%37- Inserção ordenada (Pode usar letras) 

	insOrd1(X,[],[X]).
	insOrd1(X,[Y|Ys], [X, Y|Ys]):- X@<Y.
	insOrd1(X, [Y|Ys], [Y|XYs]):- X@>=Y, insOrd1(X,Ys,XYs).

%?- insOrd1(d,[a,b,c,f,g], L). L= [a,b,c,d,f,g]

%38- Inserção direta com acumulador

	insDir(L,S):- insDir(L,[],S).
	insDir([X|Xs], Acc, S):- insOrd(X, Acc, Acc1), insDir(Xs,Acc1,S).
	insDir([],Acc,S):- S=Acc,!.

%?- insDir([1,7,1,4,5,7]),L.

%39- Particiona

	particiona([X,Y|XYs],[X|Xs],[Y|Ys]):-particiona(XYs,Xs,Ys).
	particiona([X],[X],[]).
	particiona([],[],[]).

%?- partiociona([a,b,c,1,2,3,4],A,B). A=[a,c,2,4], B=[b,1,3]

%40- 

	merge1([X|Xs],[Y|Ys],[X|XYs]):- X@<Y,!,merge1(Xs,[Y|Ys],XYs).
	merge1([X|Xs],[Y|Ys],[Y|XYs]):- X@>Y,!,merge1([X|Xs],Ys,XYs).
	merge1([],Ys,Ys):-!.
	merge1(Xs,[],Xs):-!.

%?- merge1([a,b,b,k,z],[c,m,n,o],X). X=[a,b,b,c,k,m,n,o,z]

%41- ERRO! (Não aceita lista com valores repitidos)

	mergeSort([],[]):-!.
	mergeSort([X],[X]):-!.
	mergeSort(L,S):- particiona(L,X,Y),
			mergeSort(X,Xo),mergeSort(Y,Yo),
			merge1(Xo,Yo,S).

%?- mergeSort([1,7,1,7,3,66,2,1,0], S). (Lista com valores repitidos)
%?- mergeSort([1,11,5,2], L).  L = [1, 2, 5, 11]
