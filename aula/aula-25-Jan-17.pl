% Programa 2.1: Área e população dos paises.
% pais(Nome, Área, População)

pais(brasil, 9, 130).
pais(china, 12, 1800).
pais(eua, 9, 230).
pais(india, 3, 450).

%?- pais(brasil, A, P), D is P/A.

% Programa 2.2: Funcionários e dependentes.
%(func(Código, Nome, Salário)

func(1, ana, 1000.90).
func(2, bia, 1200.00).
func(3, ivo, 903.50).
func(4, leo, 2500.35).
func(5, clo, 1800.00).
func(6, gil, 1100.00).

%Programa 2.3: Uma tabela de filmes.
%filme(Título, Gênero, Ano, Duração)

filme('Uma linda mulher', romance, 1990, 119).
filme('Sexto sentido', suspense, 2001, 108).
filme('A cor púrpura', drama, 1958, 152).
filme('Copacabana', comedia, 2001, 92).
filme('E o vento levou', drama, 1939, 233).
filme('Carrington', romance, 1995, 130).
filme('Carrington2017', romance, 2017, 130).

classico(T,G,A,D):- filme(T,G,A,D), A =< 1985.
classico(T,G):- filme(T,G,A,_), A =< 1985.

%?- classico(R,G).
% T = 'A cor púrpura'
% G = drama;
% T = 'E o vento levou'
% G = drama

% Ex 2.1 a) qual a densidade demográfica de cada um dos paises

dens(Pais,D):-pais(Pais,A,P), D is P/A.
% ?- listing(pais).
% ?- dens(P,D).
% P = brasil,
% D = 14.4444444444444445 ;
% P = china,
% D = 150
% P = eua,
% D = 25.5555555555555557 ;
% P = india,
% D = 150 ;


% b) se a Índia é mais populosa que a China.
% ?- dens(india, Di), dens(china, Dc), Di > Dc.
% false.

% Ex 2.2
% dep(Código, Nome)
dep(1, ary).
dep(3, rai).
dep(3, eva).
dep(4, lia).
dep(4, noe).
dep(5, eli).

% a) Quem tem salário entre R$ 1500,00 e R$ 3000,00?

% b) Quem não tem dependetes e ganha menos de R$ 1200,00?
% 

% c) Quem depende de funcionário que mais de R$ 1700,00?
% ?- dep(N,X), func(N,_,S), S>1700.


% Ex 2.3
filme_long(X):-filme(X,_,_,D), D>150.
lancamento(X):-filme(X,_,L,_), L>2015.
