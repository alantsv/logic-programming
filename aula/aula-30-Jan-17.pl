% Programa 4.1: Cálculo de potência
%pot(Base,Expoente,Potência)
pot(_,0,1). % base
pot(B,N,P) :- 		% passo
	N>0, 		% condição do passo
	M is N-1, 	% simplifica o problema
	pot(B,M,R), 	% obtém solução da instância menor
	P is B*R. 	% constrói solução final

% Programa 4.2: Cálculo de fatorial
% fat(Número,Fatorial)
fat(0,1). 		% base
fat(N,F) :- 		% passo
	N>0,		% condição do passo
	M is N-1,	% simplifica o problema
	fat(M,R),	% obtém solução da instância menor
	F is N*R.	% constrói solução final

% Produto

prod(1,X,X).
prod(0,_,0).
prod(Y,X,Z):- Y>0,
	M is Y-1,
	prod(M,X,R),
	Z is X+R.

% Binário
bin(1,[1]):-!.
bin(0,[0]):-!.
bin(N,R):-
	M is N div 2,
	L is N mod 2,
	bin(M,Re),
	append(Re,[L],R),!.
