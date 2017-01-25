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

%Programa 2.3: Uma tabela de filmes.
%filme(Título, Gênero, Ano, Duração)

filme('Uma linda mulher', romance, 1990, 119).
filme('Sexto sentido', suspense, 2001, 108).
filme('A cor púrpura', drama, 1958, 152).
filme('Copacabana', comedia, 2001, 92).
filme('E o vento levou', drama, 1939, 233).
filme('Carrington', romance, 1995, 130).

classico(T,G,A,D):- filme(T,G,A,D), A =< 1985.
classico(T,G):- filme(T,G,A,_), A =< 1985.

%?- classico(R,G).
% T = 'A cor púrpura'
% G = drama;
% T = 'E o vento levou'
% G = drama
