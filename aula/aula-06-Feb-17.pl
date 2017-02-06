% Ex 4.1 - Produto de dois numeros

	prod(X,Y,Z):- X=1, Z=Y.
	prod(X,Y,Z):- X=0, Z=0.
	prod(X,Y,Z):- X>0, X1 is X-1, prod(X1,Y,Z1), Z is Z1+Y.

%?- prod(7,3,X). X = 21

% Ex 4.2 - Exibir número natural em binário

	bin(X,B):- X>1, R1 is X mod 2, X1 is X div 2, 
		bin(X1,B1), B=[R1|B1].
	bin(0, [0]).
	bin(1, [1]).

%?- bin(7, X). X = [1,1,1]

% Ex 4.3 -

	estrada(a,b,25).
	estrada(a,d,23).
	estrada(c,d,14).
	estrada(b,c,19).
	estrada(b,e,32).
	estrada(c,f,28).
	estrada(d,f,30).
	estrada(e,f,26).

	chega(X,Y,R):- estrada(X,Y,R).
	chega(X,Y,R):- estrada(X,Z,R1), chega(Z,Y,R2), R is R1 + R2.
	
	chega(X,Y,R,C):- estrada(X,Y,R), C = [X,Y].
	chega(X,Y,R,[X|C2]):- estrada(X,Z,R1), chega(Z,Y,R2,C2).

% a) Quesis são todos os nós de partida do grafo?

% b) Quais são todos os nos de chegada do grafo?

% c) Quais são os nós do grafo?

% d) Quais são todos os caminhos entre A-F?

% e) Qual o menor caminho entre A-F?

% f/ Qual o maiot caminho entre A-F?

% findalll(X,estrada(X,_,_),L).

