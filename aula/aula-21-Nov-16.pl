%Ex 17
	trocaPU(PMsU,UMsP) :- PMsU = [P|MsU], append(Ms,[U],MsU), append(Ms,[P], MsP), [U|MsP]= UMsP.

%?- trocaPU([a,b,c,d], X).
%?- X[d,b,c,a]

%Ex 17.2
	trocaPU1([P|MsU],[U|MsP]):- append(Ms,[U], MsU), append(Ms,[P],MsP).

%Ex 18
	remDupl([X|Xs], Xr):- member(X,Xs), remDupl(Xs, Xr).
	remDupl([X],[X]):-!.
	remDupl([X|Xs],[X|Xs]) :- \x member(X,Xs), remDupl(Xs,Xr).

%?- remDupl([a,b,a,b],X).
%?- X =[a,b].

%Ex 19
	remDupl1([X],[X]):-!.
	remDupl1([],[]):-!.
	remDupl1([X|Xs], Xo) :- select(X,Xs,Xr), remDupl1([X|Xr],Xo).
	remDupl1([X|Xs], [X|Xo]):- \+ select(X,Xs,Xp), remDupl1(Xs,Xo).

%?- select(a,[b,a,c]. X). X=[b,c]
%?remDupl1([a,b,a],X). X=[b,a]

%Ex 20
	%remove(X,L,R):- se esta na cabeça remove
	%remove(X,L,R):- se não devolve como cabeça de R
	%remove(X,L,R):- L=[], R[].
	
%?- remove(a[a,b,a,c,d,a,x], X). X=[b,c,d,x]

%a) se X está na cabeça de L remove o X da cauda L
%b) senão devolve X na cabeça do R, remove X da cauda L

