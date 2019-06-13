dom(V) :- V = [0,1,2,3,4,5,6,7,8,9].

money(S, E, N, D, M, O, R, Y) :-
    dom(V),
    select(S, V, W1), S > 0,
    select(E, W1, W2),
    select(N, W2, W3),
    select(D, W3, W4),
    select(M, W4, W5), M > 0,
    select(O, W5, W6),
    select(R, W6, W7),
    select(Y, W7, _),
    SEND is 1000*S + 100*E + 10*N + D,
    MORE is 1000*M + 100*O + 10*R + E,
    MONEY is M*10000 + 1000*O + 100*N + 10*E + Y, 
    MONEY is SEND + MORE.

% TRY ME
% money(S,E,N,D,M,O,R,Y).