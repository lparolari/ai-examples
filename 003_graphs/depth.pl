%% depth(Tree, Depth)
%
% Tree: a tree expressed by functor arc
% Depth: max depth for the tree

depth(arc(_, nil, nil), 0) :- !.
depth(arc(_, T1, T2), D) :-
    depth(T1, D1),
    depth(T2, D2),
    max(D1, D2, DTmp),
    D is DTmp + 1.
    

max(A, B, A) :- A >= B, !.
max(_, B, B).
    
test1(D) :- t(T), depth(T, D).
test2(D) :- depth(
                arc(a, 
                    arc(b, 
                        arc(d, nil, nil), 
                        arc(e, nil, nil)), 
                    arc(c, nil, nil)),
                D).

% build the tree.
t(T) :- 
    T = arc(a, 
            arc(b, 
                arc(c, nil, nil), 
                arc(d, nil, nil)), 
            arc(e, 
                arc(f, nil, nil), 
                arc(g, 
                    arc(h, nil, nil), 
                    arc(i, nil, nil))
                )
            ).
%                 a
%           b          e
%        c    d     f     g
%                       h   i
