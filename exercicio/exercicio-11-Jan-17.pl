% 1.2 -

% a)

pai(ivo,eva).
pai(rai,noe).
pai(gil,rai).
pai(gil,clo).
pai(gil,ary).
pai(ary,gal).
mae(ana,eva).
mae(eva,noe).
mae(bia,rai).
mae(bia,clo).
mae(bia,ray).
mae(lia,gal).

	% ?- pai(gil,Filho).

% b)

homem(ivo).
homem(rai).
homem(noe).
homem(gil).
homem(ary).

% c)

gerou(X,Y):- mae(X,Y); pai(X,Y).


