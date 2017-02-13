% 5.3 Exercícios

% 5.1. Defina o predicado último(L,U), que determina o último item U numa
% lista L. Por exemplo, último([a,b,c],U), resulta em U=c.

	ultimo([X],X):-!.
	ultimo([_|Xs],R):-ultimo(Xs, R).

% 5.2. Defina o predicado tam(L,N), que determina o número de itens N exis-
% tente numa lista L. Por exemplo, tam([a,b,c],N), resulta em N=3.

	tam([],0).
	tam([_|Xs],T):-tam(Xs,T1), T is T1 + 1.

% 5.3. Defina o predicado soma(L,S) que calcula a soma S dos itens da lista L.
% Por exemplo, soma([4,9,1],S) resulta em S=14.
	
	soma([],0).
	soma([X|Xs],R):- soma(Xs,R1), R is X + R1.

% 5.4. Defina o predicado máx(L,M) que determina o item máximo M na lista L.
% Por exemplo, máx[4,9,1],M) resulta em M=9.
% ERRO!!	
%	max([],[]).
	max([X],X).
	max([X|Xs],X):- X >= Y, max(Xs,Y).
	max([X|Xs],Y):- X < Y, max(Xs,Y).

% 5.5. Usando o predicado anexa, defina o predicado inv(L,R) que inverte a
% lista L. Por exemplo, inv([b, c, a], R) resulta em R=[a,c,b].

	inv([X],[X]).
	inv([X|Xs], R):- inv(Xs, R1), append(R1,[X],R).

% 5.6. Usando o predicado inv, defina o predicado sim(L) que verifica se uma
% lista é simétrica. Por exemplo, sim([a,r,a,r,a]) resulta em yes.

	sim(L):- inv(L, Lr), Lr == L.

% 5.7. Usando a tabela d(0,zero), d(1,um), ..., d(9,nove), defina o predi-
% cado txt(D,P) que converte uma lista de dígitos numa lista de pala-
% vras. Por exemplo, txt([7,2,1],P) resulta em P=[sete,dois,um].

	d(0,zero).
	d(1,um).
	d(2,dois).
	d(3,tres).
	d(4,quatro).
	d(5,cinco).
	d(6,seis).
	d(7,sete).
	d(8,oito).
	d(9,nove).

	txt([],[]).
	txt([X|Xs],[T|T1]):-d(X,T),txt(Xs,T1).

% 5.8. O grafo a seguir representa um mapa, cujas cidades são representadas
% por letras e cujas estradas são representados por números.

% a) Usando o predicado estrada(Número,Origem,Destino), crie um
% programa para representar esse mapa.

      % estrada(numero,Origem,Sestino).
	estrada(1,a,b).
	estrada(2,a,d).
	estrada(3,b,c).
	estrada(4,c,d).
	estrada(5,b,e).
	estrada(6,c,f).
	estrada(7,d,f).
	estrada(8,e,f).

% b) Defina o predicado rota(A,B,R), que determina uma rota R (lista de
% estradas) que leva da cidade A até a cidade B.

	rota(X,Y,[R]):- estrada(R,X,Y).
	rota(X,Y,[R|Rs]):- estrada(R,X,Z), rota(Z,Y,Rs).

% 5.9. Um retângulo é representado pela estrutura retângulo(A,B,C,D),
% cujos vértices são A, B, C e D, nesta ordem.

% a) Defina o predicado regular(R) que resulta em yes apenas se R for
% um retângulo cujos lados sejam verticais e horizontais.

	regular(retangulo(ponto(A1,A2),ponto(B1,B2),ponto(C1,C2),ponto(D1,D2))):- 

% b) Defina o predicado rota(A,B,R), que determina uma rota R (lista de
% estradas) que leva da cidade A até a cidade B.
