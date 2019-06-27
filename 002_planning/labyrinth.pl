% labyrinth
% 
% try with
% ?- go.

%% TODO: review

%
go :- m(M), escape(M, in(0,1), in(6,5)).


escape(Map, From, To) :-
	escape_h(Map, From, To, [], []).

% caso base, testa se la posizione in cui sono è uguale all'arrivo.
escape_h(_Map, To, To, _PrevMoves, Steps) :- 
    reverse(Steps, StepsRev),
    write(StepsRev), nl, write("ESCAPED!!"),nl.

% passo induttivo, cerca di andare su/destra/giu/sinistra, facendo un passo con
% la relativa move e successivamente chiamando ricorsivamente la escape_h dalla
% coordinata generata dalla move.
% Nota: vanno tenute in memoria sia le mosse precedenti per non andare in ciclo
% (implementato dalla move) che gli step corretti.

escape_h(Map, From, To, PrevMoves, PrevSteps) :-
    move(up, Map, From, Pos, PrevMoves, Moves),
    escape_h(Map, Pos, To, Moves, [up|PrevSteps]).

escape_h(Map, From, To, PrevMoves, PrevSteps) :-
    move(right, Map, From, Pos, PrevMoves, Moves),
    escape_h(Map, Pos, To, Moves, [right|PrevSteps]).

escape_h(Map, From, To, PrevMoves, PrevSteps) :-
    move(down, Map, From, Pos, PrevMoves, Moves),
    escape_h(Map, Pos, To, Moves, [down|PrevSteps]).

escape_h(Map, From, To, PrevMoves, PrevSteps) :-
    move(left, Map, From, Pos, PrevMoves, Moves),
    escape_h(Map, Pos, To, Moves, [left|PrevSteps]).


move(up, Map, From, To, PrevMoves, Moves) :-
    in(X,Y) = From,
    XNew is X - 1, YNew = Y,
    %write(X), write(","), write(Y), write("->"), write(XNew), write(","), write(YNew), write("___"),
    member_matrix(Map, XNew, YNew, C),
    C = e,
    To = in(XNew,YNew),
    not(member(To, PrevMoves)),
    append(PrevMoves,[From],Moves).
    %write(up),nl.
 
move(right, Map, From, To, PrevMoves, Moves) :-
    in(X,Y) = From,
    XNew = X, YNew is Y + 1,
    %write(X), write(","), write(Y), write("->"), write(XNew), write(","), write(YNew), write("___"),
    member_matrix(Map, XNew, YNew, C),
    C = e,
    To = in(XNew,YNew),
    not(member(To, PrevMoves)),
    append(PrevMoves,[From],Moves).
    %write(right),nl.

move(down, Map, From, To, PrevMoves, Moves) :-
    in(X,Y) = From,
    XNew is X + 1, YNew = Y,
    %write(X), write(","), write(Y), write("->"), write(XNew), write(","), write(YNew), write("___"),
    member_matrix(Map, XNew, YNew, C),
    C = e,
    To = in(XNew,YNew),
    not(member(To, PrevMoves)),
    append(PrevMoves,[From],Moves).
    %write(down),nl.

move(left, Map, From, To, PrevMoves, Moves) :-
    in(X,Y) = From,
    XNew = X, YNew = Y - 1,
    %write(X), write(","), write(Y), write("->"), write(XNew), write(","), write(YNew), write("___"),
    member_matrix(Map, XNew, YNew, C),
    C = e,
    To = in(XNew,YNew),
    not(member(To, PrevMoves)),
    append(PrevMoves,[From],Moves).
    %write(left),nl.

% dato indice I, J, accede alla riga I, colonna J della matrice
member_matrix(M, I, J, X) :-
    member_idx(M, I, L),
    member_idx(L, J, X).

% get the I-th element from a list and unify it with X.
member_idx(L, I, X) :- member_idx(L, I, 0, X).
member_idx([X|_], I, I, X) :- !.
member_idx([_|XX], I, Acc, X) :-
    AccTmp is Acc + 1,
    member_idx(XX, I, AccTmp, X). 

% build the map.
m(M) :- M = [
	[w,e,w,w,w,w,w],
	[w,e,w,e,w,e,w],
	[w,e,w,e,w,e,w],
	[w,e,e,e,w,e,w],
	[w,e,w,e,w,e,w],
	[w,e,e,e,e,e,w],
	[w,w,w,w,w,e,w]
]. 


