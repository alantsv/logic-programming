% 1.1
	father(adão,cain).
	father(adão,abel).
	father(adão,seth).
	father(seth, enos).

% ?- father(adão,X).
% ?- father(Y,enos), pai(X,Y).

	grandad(X,Y) :- father(X,Z), father(Z,Y).
	brother(X,Y):- father(Z,X), father(Z,Y), X\=Y.

% ?- gradad(X,enos).
% ?- brother(abel,X).
% ?- brother(X,Y).


% a) Que são os filhos de Adão?

	% ?- father(adão, Son).
	% Son = cain ;
	% Son = abel ;
	% Son = seth.

% b) Quem são os netos de Adão?

	% grandad(X, adão).
	% X = enos.

% c) Quem são os tios de Enos?

	% ?- father(Pai,Filho),brother(Pai,Tio),Filho=enos.
	% Pai = seth,
	% Filho = enos,
	% Tio = cain;
	% Pai = seth,
	% Filho = enos,
	% Tio = abel.

