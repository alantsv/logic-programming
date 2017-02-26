%%
%% Banco de Dados em Prolog
%% baseado no texto do Prof. Silvio Lago 
%% 
%------------------------------------
% listar tabela
% contar, max, min, somar, calcular médias etc... 
%
% Programa 2.1: Área e população dos países.
% pais(Nome, Área, População)
pais(brasil, 9, 130).
pais(china, 12, 1800).
pais(eua,   9, 230).
pais(india, 3, 450).

/*
findall/3
sum_list/2
length/2
sort/4

% i) quais e quantos paises tem na tabela ?
findall(P,pais(P,_,_),L), length(L,X).
% ii) Qual é o total da área? 
findall(Pop,pais(_,_,Pop),L),sum_list(L,X).
% iii) qual é a média da coluna area? 
findall(Pop,pais(P,_,_),L),sum_list(L,S), length(L,X), Media is (S/X)*100.
% iv) qual é o pais com população máxima?
findall((P,Pop),pais(P,_,Pop),L), sort(2,@>,L,Lo),Lo=[(M,PopM)|_].
% v) qual é o pais com área minima?
findall((P,A),pais(P,A,_),L), sort(2,@<,L,Lo),Lo=[(M,PopM)|_].
*/

prtTab(T/AN,C,N):- length(As,AN),F=..[T|As],
                   findall(F,F,L),sort(C,@=<,L,Lo),wList(N,Lo).	
wList(N,[]):-nl,!.
wList(N,[X|Xs]):-N>0,writeln(X),N1 is N-1, wList(N1, Xs).		
%?- prtTab(pais/3,1,10). 
%?- prtTab(pais/3,2,3). 

/*
?- pais(brasil,A,P), D is P/A.
A = 9
P = 130
D = 14.4444

?- pais(china,_,X), pais(índia,_,Y), Z is X-Y.
X = 1800
Y = 450
Z = 1350
*/

% Programa 2.2: Funcionários e dependentes.
% func(Código, Nome, Salário)
func(1, ana, 1000.90).
func(2, bia, 1200.00).
func(3, ivo, 903.50).
func(4, leo, 2500.35).
func(5, clo, 1800.00).
func(6, gil, 1100.00).

%?- prtTab(func/3,2,10).

% dep(Código, Nome)
dep(1, ary).
dep(3, rai).
dep(3, eva).
dep(4, lia).
dep(4, noe).
dep(5, eli).
:-[map].
/*
i) quantos dependentes tem cada funcionario?
findall((D,1),dep(D,M),L),bins(L,Bs).
findall((D),dep(D,M),L),bins(L,Bs), findall((F,D),(func(N,F,_),member((N,D),Bs)),Lo).
*/

/*
?- func(C,ivo,_), dep(C,N).
C = 3
N = raí ;
C = 3
N = eva

?- dep(C,ary), func(C,N,_).
C = 1
N = ana

?- func(C,_,S), dep(C,N), S<950.
C = 3
S = 903.5
N = raí ;
C = 3
S = 903.5
N = eva

?- func(C,N,_), \+ dep(C,_).
C = 2
N = bia
*/

% Programa 2.3: Uma tabela de filmes.
% filme(Título, Gênero, Ano, Duração)
filme('Uma linda mulher', romance, 1990, 119).
filme('Sexto sentido', suspense, 2001, 108).
filme('A cor púrpura', drama, 1985, 152).
filme('Copacabana', comedia, 2001, 92).
filme('E o vento levou', drama, 1939, 233).
filme('Carrington', romance, 1995, 130).

classico(T,G,A,D) :- filme(T,G,A,D), A =< 1985.
classico(T,G) :- filme(T,G,A,_), A =< 1985.

/*
?- clássico(T,G).
T = 'A cor púrpura'
G = drama ;
T = 'E o vento levou'
G = drama
*/

% tab(Nome Sexo Idade Altura Peso)
tab(ana, fem, 23, 1.55, 56.0).
tab(bia, fem, 19, 1.71, 61.3).
tab(ivo, masc, 22, 1.80, 70.5).
tab(lia, fem, 17, 1.85, 57.3).
tab(eva, fem, 28, 1.75, 68.7).
tab(ary, masc, 25, 1.72, 68.9).

/*
a) Quais são as mulheres com mais de 20 anos de idade?
b) Quem tem pelo menos 1.70m de altura e menos de 65kg?
c) Quais são os possíveis casais onde o homem é mais alto que a mulher?
*/







sort(List, Sorted)     :- sort(0,  @<, List,  Sorted).
msort(List, Sorted)    :- sort(0, @=<, List,  Sorted).
keysort(Pairs, Sorted) :- sort(1, @=<, Pairs, Sorted).
