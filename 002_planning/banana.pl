%% banana
%
% try with 
% ?- test1(P)
%
% ## The problem
% A monkey enters a room and sees a banana hanging in the center of ceiling.
%  There is a box in the room under the window. The monkey can go up on the box and take
%  the banana.
% What do the monkey has to do to reach the banana? 
%
% ## Note
% The state is represented by a function symbol `state` as follows
% ```
% state(MonkeyXYPosition, MoneyZPosition, BoxXYPosition, MonkeyHasBanana?)
% ````

%% action(Action, StateBefore, StateAfter)
action(take, 
       state(center, on_the_box, center, has_not),
       state(center, on_the_box, center, has)).
action(go_up, 
       state(L, on_the_floor, L, B),
       state(L, on_the_box, L, B)).
action(push(L1,L2), 
       state(L1, on_the_floor, L1, B),
       state(L2, on_the_floor, L2, B)).
action(walk(L1,L2), 
       state(L1, on_the_floor, S, B),
       state(L2, on_the_floor, S, B)).

%% eat(InitialState).
%
% verify if the money can heat take the banana.
% this predicate is true if monkey can take the banana, false otherwise.
eat(state(_,_,_,has)).
eat(S) :-
    action(_, S, SS),
    eat(SS).

%% plan(InitialState, Plan)
%
% plan actions to do in order to take the banana.
plan(state(_, _, _, has),[]).
plan(S1,Plan) :-
    action(A, S1, S2),
    plan(S2, PP),
    Plan = [A|PP].


%% TRY ME

% the initial state tells to the solver that the monkey is in the left corner on the floow, 
%  while the box is in the right corner. The monkey hasn't the banana, for now ;).
test1(P) :- plan(state(left_corner, on_the_floor, right_corner, has_not), P).

% causes loop.
test2(S) :- plan(S, [walk(left_corner, right_corner), push(right_corner, center), go_up, take]).
