% Programa 2.1: Área e população dos paises.
% pais(Nome, Área, População)

pais(brasil, 9, 130).
pais(china, 12, 1800).
pais(eua, 9, 230).
pais(india, 3, 450).

%?- pais(brasil, A, P), D is P/A.

% Ex 2.1 a) qual a densidade demográfica de cada um dos paises
dens(Pais,D):-pais(Pais,A,P), D is P/A.
% ?- listing(pais).
% ?- dens(P,D).
% Ex 2.1 b)
% ?- dens(india, Di), dens(china, Dc), Di > Dc.

% Programa 2.2: Funcionários e dependentes.
%(func(Código, Nome, Salário)

func(1, ana, 1000.90).
func(2, bia, 1200.00).
func(1, ivo, 903.50).

