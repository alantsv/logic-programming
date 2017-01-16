% (Pág 7) Ex 1 - Ultilizando as regras de fatoração, simplifiquea cláusula 
% abaixo, indicando qual regra é ultilizada em cada passo:

pega3(E,L):- L=[B|A], A=[Y|Ys], Ys=[Z|D], Z=E.

pegaTres(E,[_,_,E|_]).

getTree([X,Y,Z|_],[X,Y,Z]).

% (Pág 9) Ex 2 - Com base no programa compr/2 faça um predicado sum/2 que
% some uma lista de valores?

sum2([],0).
sum2([X|Xs], X+S):- sum2(Xs,S).

% Ex 3 - Faça o predicado membro/2 baseado nestas duas regras

% (base) um elemento é mebro de uma lista, se ele é a cabeça da lista;
% (recursiva) um elemento é mebro de uma lista, sele for membro da cauda da lista.

membro(X,[X|_]).
membro(X,[_|Xs]):- membro(X,Xs).

% ?- membro(a,[a,b,c]). True

% Ex 4 - Faça o predicado append1/3 baseado nestas duas regras.

append1([],Bs,Bs).
append1([A|As],Bs,[A|AsBs]):-append1(As,Bs,AsBs).

% Ex 5 - Faça o predicado membro/2 usando append. X é membro de uma lista L,
% se está no meio da lista?

membro1(X,L):-append(_,[X|_],L).

% ?- membro1(X,[a,b,c,d]).

% Ex 6 - Faça o precidado sublist/2

prefixo(P,L):-append(P,_,L).
suffix(S,L):-append(_,S,L).
sublist(S,L):-prefixo(P,L), suffix(S,P).

% ?- sublist(L,[a,b]), L\=[].

% Select

select1(X,[X|Xs],Xs).
select1(X,[Y|Xs],[Y|Zs]):-select1(X,Xs,Zs).

% ?- L=[a,b,c,d], select1(X,L,Lo).

% Ex 7 - Defina o predicado ultimo/2, que devolve 
% o último elemento de uma lista?

last([X], X):-!.
last([_|Xs], X):-last(Xs, X).

last2([U],U):-!.
last2([_,Y|Xs],U):-last2([Y|Xs],U).

% Ex 8 - Faça uma versão do predicado last/2, usando append.

ultimo(L,U):- append(_,[U],L).

% Ex 9 - Defina o predicado remU/2 que devolve uma lista sem o útimo
% elemento, fazendo duas regras um recursiva

remU([X],[]).
remU([X|Xs],[X|Xu]):-remU(Xs,Xu).

% Ex 10 - Escreva em linguaguem natural as regras que definem 
% o predicado remove último remU/2 com recursividade.

% (Base): Se a lista tiver um elemento então retorna lista vazia
% (Recursivo): Se a lista tiver cabeça e cauda
% então retorna a lista com a cabeça e o ultimo da cauda

% Ex 11 - Simplifique esta versão do predicado remU/2 
% para que não retorne (; false), sem usar corte.

remU2([X],[]).
remU2([X,Y|Xs],[X|Xu]):-remU2([Y|Xs],Xu).

% Ex 12 - Simplifique esta versão do predicado remU/2, 
% para não retornar (; false) tirando os restes e usando corte.

remU3([U],[]):-!.
remU3([U|Lc],[U|Lu]):-remU3(Lc,Lu).

% ?- remU3([a,b,d,q], L). L=[a,b,d].

% Ex 13 - Defina o predicado remU/2 usando append sem recursividade.

remU4(L,Lu):-append(Lu,[U],L).

% Ex 14 - Defina um predicado contiguos/1 que testa se uma lista tem dois
% elementos contíguis iguais, faça uam versão recursiva. 
% Por exemplo ?-contiguos([a,b,c,c,e]). Yes

contiguos([X,Y|Lc]):-X=Y.
contiguos([L|Lc]):-contiguos(Lc).

% Ex 15 - Defina um predicado contiguos/1 que testa se uma lista tem dois
% elementos contíguos iguais, usando append.

contiguos1(L):-append(_,[Y,Y|_],L).

% Ex 16 - Defina um preficado dupl/1, que é verdadeiro, se a lista tem elementos
% duplicados. Use o member e recursividade.

dupl([X|Xs]):- membro1(X,Xs),!.
dupl([X|Xs]):- dupl(Xs).

% Ex 17 -

trocaPU([X|Xs], L):- append(Xs,[X],R1), append(_,[U],Xs), append([U],R1,L).

% Teste de diferenciação de cláudulas

ultimo([U],U).
ultimo([X,Y|Xs],U):-ultimo([Y|Xs],U).

% ?- ultimo([a,b,c],U). U = c; false.

% Ex 18 - Defina um predicado remDupl/2 que remove os elementos duplicados de
% uma lista, use apenas o meber e recursividade. Remova as cópias inicias dos
% elementos da lista. ?- remDupl([a,b,a]). X=[b,a].

remDupl([X|Xs],Xs):-membro(X,Xs),!.
remDupl([X|Xs],[X|L]):-remDupl(Xs, L).

% Ex 19 - Defina um predicado remDupl1/2 que remove os elementos duplicados de
% uma lista, use apenas o member e o select/3. Remova as cópias finais dos
% elementos da lista. ?- remDupl1([a,b,a],X). X=[a,b].

remDupl1([],[],R).
remDupl1([X|Xs],R):-membro(X|Xs),select(X,Xs,Ys),remDupl1(X,Ys,R).
remDupl1([X|Ys],R):- \+membro(X|Ys),remDupl1(X,Ys,R).

%remDupl1([X|Xs],[X|L]):-select1(X,Xs,L).
%remDupl1([X|Xs],[X|L]):-remDupl1(Xs,L).

% Ex 20 - Faça um predicado remove/3 tal que: ?-remove(a,[a,b,a,d,x,a],X).
% X=[b,d,x]

remove(X,[],[]):-!.
remove(X,[X|Xs],L):-remove(X,Xs,L),!.
remove(X,[Y|Xs],[Y|L]):-remove(X,Xs,L),!.

% Ex 21 - Faça um predicado flatten/2 que devolve uma lista simples a partir
% de uma lista formada por listas aninhadas, matendo a ordem da ocorrência
% dos elementos, como em ?-flatten1([1,[2],[],[2,[3,4],5],6],X).
% X = [1,2,2,3,4,5,6].

flatten1([],[]).
flatten1(X,[X]):- X\=[], X\=[_|_].
flatten1([X|Xs],F):-flatten1(X,F1), flatten(Xs,F2), append(F1,F2,F).

% Ex 23 - Permutação

% (base) se a lista é [], então retorna-se [];
% (recuriva) senão, dada uma lista, extrai-se um de seus elementos usando select/3,
% coloca-se como primeiro elemento da solução e chama-se recursivamente o predicado
% permutação para a lista sem o elemento.

permutation([],[]).
permutation(Xs, [Z|Zs]):-select(Z,Xs,Ys),permutation(Ys,Xs).

% Ex 24 - Defina o predicado reverse com acumulador

reverse1(L,R):- reverse1(L,[],R).
reverse1([],R,R).
reverse1([L|Ls],Acc, R):-reverse1(Ls,[L|Acc],R).

% ?- reverse([a,b,c],R). R=[c,b,a]

% Ex 25 - Defina o predicado reverse sem acumulador, usando append/3. Codifique as regras:

% (base) o reverso de uma lista vazia é a lista vazia;
% (recursiva) o reverso de uma lista é o reverso da cauda concatenado com a cabeça.

reverso([],[]).
reverso([X|Xs],R):- reverso(Xs,R1), append(R1,[X], R).

% Ex 26 - Defina o predicado palindrome/1, que é verdadeiro se a lista é um palíndrome,
% por exemplo, [a,b,c,d,c,d,a]. Faça uma versão recrusiva sem usar reverse.

palindrome([X|Xs]):-append(Xm,[X],Xs), palindrome(Xm),!.
palindrome([]):-!.
palindrome([X]):-!.
