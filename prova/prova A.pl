%Prova A: Programção em Lógica

% Questão 1:
compr([], 0).
compr([X|Xs], 1+R):-compr(Xs,R).

% Questão 3:
append1([],Bs,Bs).
append1([A|As],Bs,[A|AsBs]):-append1(As,Bs,AsBs).

% Questão 6:
maxL([X], X).
maxL([X|Xs], X):- X > Y, maxL(Xs,Y).
maxL([X|Xs], Y):- X =<Y, maxL(Xs,Y).

% Questão 7:
ultimo([X],X).
ultimo([X|Xs], U):-ultimo(Xs, U).

% Questão 13:
contiguos([X,X|Xs]).
contiguos([X,Y|Xs]):-contiguos([Y|Xs]).

% Questão 16:
remDupl([X|Xs],R):-member(X,Xs), remDupl(Xs,R).
remDupl([Y|Xs],[Y|R]):- \+member(Y,Xs), remDupl(Xs,R).
remDupl([X],[X]).

%Questão 18:
remove(X,[X],[]):-!.
remove(X,[],[]):-!.
remove(X,[X|Xs],R):-remove(X,Xs,R),!.
remove(X,[Y|Xs],[Y|R]):-remove(X,Xs, R),!.

% Questão 20
zipper([],[],[]).
zipper([X|Xs],[Y|Ys], [X-Y|XsYs]):-zipper(Xs,Ys, XsYs).





