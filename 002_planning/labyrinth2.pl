% For more docs see the labyrinth.pl file, it contains a real solution for this problem.
% This is for learning purposes.

% NOTE. 
%  This implementation write the moves with reversed order because prints are done after the recursive call.
%  For this reason when the recursive call "returns" the previous successful move is printed.
%  See test1/0 for details.

plan(Map, From, To) :-
	plan(Map, From, To, []).

plan(_, To, To, _).

plan(Map, From, To, PrevMoves) :-
	From = in(X, Y), 
	% new indicies for going up
	XNew is X - 1,
	YNew is Y,
	
	member_matrix(Map, XNew, YNew, Elem),
	Elem = e,  % it's not a wall

	% avoid infinite looping
	ToNew = in(XNew, YNew),
	not(member(ToNew, PrevMoves)),

	append([ToNew], PrevMoves, Moves),
	plan(Map, ToNew, To, Moves),
	write(up), nl.

plan(Map, From, To, PrevMoves) :-
	From = in(X, Y), 
	% new indicies for going right
	XNew is X,
	YNew is Y + 1,
	
	member_matrix(Map, XNew, YNew, Elem),
	Elem = e,  % it's not a wall

	% avoid infinite looping
	ToNew = in(XNew, YNew),
	not(member(ToNew, PrevMoves)),

	append([ToNew], PrevMoves, Moves),
	plan(Map, ToNew, To, Moves),
	write(right), nl.

plan(Map, From, To, PrevMoves) :-
	From = in(X, Y), 
	% new indicies for going down
	XNew is X + 1,
	YNew is Y,
	
	member_matrix(Map, XNew, YNew, Elem),
	Elem = e,  % it's not a wall

	% avoid infinite looping
	ToNew = in(XNew, YNew),
	not(member(ToNew, PrevMoves)),

	append([ToNew], PrevMoves, Moves),
	plan(Map, ToNew, To, Moves),
	write(down), nl.

plan(Map, From, To, PrevMoves) :-
	From = in(X, Y), 
	% new indicies for going left
	XNew is X,
	YNew is Y - 1,
	
	member_matrix(Map, XNew, YNew, Elem),
	Elem = e,  % it's not a wall

	% avoid infinite looping
	ToNew = in(XNew, YNew),
	not(member(ToNew, PrevMoves)),

	append([ToNew], PrevMoves, Moves),
	plan(Map, ToNew, To, Moves),
	write(left), nl.


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


%% TRY ME

%% test1()
%
% In this example the output is:
%  down, right, right, down, down, right, right, down, down, down
% but there is also another solution:
%  down, right, right, right, right, down, down, down, down, down
% 
% As you can see this solutions are correct but in the wrong order. Read them
% from right to left!

test1() :-
	m(M),
	plan(M, in(0,1), in(6, 5)).

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

