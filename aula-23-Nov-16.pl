%Ex 20
	remove(X,L,Lr):- L=[X|Xs], remove(X,Xs,Lr).
	remove(X,L,Lr):- L=[Y|Xs], remove(X,Xs,Xr),Lr=[Y|Xr].
	remove(X,[],[]).

%?- remove(a,[a,b,a,b,c,a,d,a,a,a],X). X=[b,b,c,d]

%Ex 20.2

	remove1(X,L,Lr):- select(X,L,Lo), remove1(X,Lo,Lr).
	remove1(X,L,Lr):- \+ select(X,L,_), Lr=L.

%?- remove(a,[a,b,a,b,c,a,d,a,a,a],X). X=[b,b,c,d]

%Ex 21
	flatten1([],[]).
	flatten1(X,[X]):-X\=[], X\=[_|_].
	flattne1([X|Xs],F):-flatten1(X,F1),flatten(Xs,F2).
% ?- flatten1([1,[2],[],[2[3,4],5],6],X).

%Ex 22
	zipper([X|Xs],[Y|Ys],[X-Y|XYs]):- zipper(Xs,Ys,XYs).
	zipper([],[],[]).

% ?- zipper([a,b,c,d],[1,2,3,4], X).

%Ex 23
	permutation(Xs,[Z|Zs]):-select(Z,Xs,Ys),permutation(Ys,Zs).
	permutation([],[]).
	
% ?- permutation([a,b,c],P).

%Ex 24
	%Inciciar o acumulador
	reverse1(L,R):- reverse1(L,[],R).
	reverse1([], R,R).
	reverse1([X|Xs],ACC,R). :-reverse1(Xs,[X|ACC],R).

% ?- reverse1([a,b,c], R).

%Ex 25
%(base) o reverso de uma [] é a []
%(recursivo) o rever de uma [_|_] é o rever da causa concatenado com a cabeça

	reverso([],[]).
	reverso([X|Xs],R):- reverso(Xs,Xr), append(Xr,[X],R).

% ?- reverso([a,b,c],X). X = [c,b,a]

%Ex 26
	palindrome(L) :- reverse(L,Lr), Lr = L.

% ?- palindrome(a[a,b,c]). False
% ?- palindrome([a,b,b,a]). True


