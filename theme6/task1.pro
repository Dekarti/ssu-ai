make_list(_, 0, _, []).
make_list(N, M, S, [N|L]) :- 
    N1 is N + S, 
    M1 is M - 1, 
    make_list(N1, M1, S, L).

del(A, [A|B], B).
del(A, [B|D], [B|E]) :-
    del(A, D, E).

insert(A, L, 1, [A|L]).
insert(A, [H|L], M, [H|L1]) :- 
    M > 1,
    M1 is M - 1, 
    insert(A, L, M1, L1). 

sum([L], L).
sum([H1, H2|T], S) :-
    S1 is H1 + H2,
    sum([S1|T], S).

prod([L], L).
prod([H1, H2|T], S) :-
    S1 is H1 * H2,
    prod([S1|T], S).

append([], L, L).
append([H|T], L2, [H|L3]) :- 
    append(T, L2, L3).

/**************************/

task1 :-
    del("Th", ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"], L2),
    write(L2).

task2 :-
    insert("Leonardo", ["James", "Chris", "Emma"], 1, L1),
    write(L1), write("\t"),
    insert("Leonardo", ["James", "Chris", "Emma"], 2, L2),
    write(L2), write("\t"),
    insert("Leonardo", ["James", "Chris", "Emma"], 3, L3),
    write(L3), write("\t"),
    insert("Leonardo", ["James", "Chris", "Emma"], 4, L4),
    write(L4), write("\t").

task3 :-
    sum([1, 2, 3, 4, 5], S),
    write(S).

task4 :-
    N is 6,
    make_list(2, 5, 2, L1),
    del(N, L1, L2),
    write(L2).

task5 :-
    make_list(1, 5, 2, L1), 
    make_list(2, 5, 2, L2), 
    append(L1, L2, L3), 
    write(L3).

task6 :- 
    N is 150,
    make_list(3, 6, 3, L1),
    insert(N, L1, 3, L2),
    write(L2).

task7 :- 
    N is 15,
    make_list(10, N, 5, L1),
    write(L1).

task8 :-
    make_list(3, 5, 3, L),
    sum(L, S),
    write(S).

task9 :-
    make_list(6, 5, -1, L),
    sum(L, S),
    write(S).

task10 :-
    make_list(7, 4, -2, L),
    prod(L, S),
    write(S).

task11 :-
    N is 10,
    make_list(10, N, 1, L),
    sum(L, S),
    write(S).

/**************************/

main :-
    write("task1  : "), task1 , write("\n"),
    write("task2  : "), task2 , write("\n"),
    write("task3  : "), task3 , write("\n"),
    write("task4  : "), task4 , write("\n"),
    write("task5  : "), task5 , write("\n"),
    write("task6  : "), task6 , write("\n"),
    write("task7  : "), task7 , write("\n"),
    write("task8  : "), task8 , write("\n"),
    write("task9  : "), task9 , write("\n"),
    write("task10 : "), task10, write("\n"),
    write("task11 : "), task11, write("\n").