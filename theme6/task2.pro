/** Max element of list **/
max([X], X).
max([H|T], H) :- max(T, Y), H >= Y.
max([H|T], N) :- max(T, N), N  > H.

/** List length **/
len([], 0).
len([_|T], N) :-
    len(T, N1),
    N is N1 + 1.

/** Delete negative elements **/
filter([], []).
filter([H|T], S)     :- H  < 0, filter(T, S).
filter([H|T], [H|S]) :- H >= 0, filter(T, S).

/** Product elist elements **/
prod([L], L).
prod([H1, H2|T], S) :-
    S1 is H1 * H2,
    prod([S1|T], S).

/** Bubble sort **/
bubble_sort(List, Sorted) :- b_sort(List, [], Sorted).
b_sort([], Acc, Acc).
b_sort([H|T], Acc, Sorted) :- 
    bubble(H, T, NT, Max), b_sort(NT, [Max|Acc], Sorted).
bubble(X, [] ,[], X).
bubble(X, [Y|T], [Y|NT], Max) :- X  > Y, bubble(X, T, NT, Max).
bubble(X, [Y|T], [X|NT], Max) :- X =< Y, bubble(Y, T, NT, Max).

/** Reverse list **/
reverse([], Z, Z).
reverse([H|T], Z, L) :- reverse(T, Z, [H|L]).

/** List intersection **/
intersection([], _, []).
intersection([H1|T1], L2, [H1|R]) :-
    member(H1, L2),
    intersection(T1, L2, R).
intersection([_|T1], L2, R) :-
    intersection(T1, L2, R).

/** List complement **/
complement([], _, []) :- !.
complement([H1|T1], L2, L3) :-
        member(H1, L2), !,
        complement(T1, L2, L3).
complement([H1|L2], T1, [H1|T2]) :-
        complement(L2, T1, T2).

/** List product **/
list_prod([], [], []).
list_prod([H1|T1], [H2|T2], [X|L3]) :- 
    list_prod(T1, T2, L3), 
    X is H1 * H2.

/** Merge two lists **/
append([], L, L).
append([H|T], L2, [H|L3]) :- 
    append(T, L2, L3).

/** Remove duplicates from list **/
set([], []).
set([H|T], [H|T1]) :- 
    remove(H, T, T2),
    set(T2, T1).

/** Remove an element from list **/
remove(_, [], []).
remove(X, [X|T], T1) :- remove(X, T, T1).
remove(X, [H|T], [H|T1]) :-
    X \= H,
    remove(X, T, T1).

/** Divide list into two parts **/
div(L, A, B) :-
    append(A, B, L),
    len(A, N1), len(B, N2), 
    N1 - N2 < 2, N1 - N2 > -2.

/** Index of element **/
index_of([A|_], A, 0) :- !.
index_of([_|T], A, N) :-
  index_of(T, A, N1),
  N is N1 + 1.

/** Element by it's index **/
elem_by_index(L, I, A) :- by_index(L, 0, I, A).
by_index([], _, _, _) :- !.
by_index([H|_], N, N, H).
by_index([_|T], N, M, A) :-
    N \= M,
    N1 is N + 1,
    by_index(T, N1, M, A).

accord(_, [], _) :- !.
accord(W, [H|I], [H2]) :-
    elem_by_index(W, H, H2),
    accord(W, I, []).
accord(W, [H|I], [H2|R]) :-
    elem_by_index(W, H, H2),
    accord(W, I, R).

/**********************************/

task1 :-
    max([2, 4, 1, 3, 5, 2], M),
    write(M).


task2 :-
    len([2, 4, 1, 3, 5, 2], L),
    write(L).


task3 :-
    prod([1, 2, 3, 4, 5], S),
    write(S).

task4 :-
    filter([-2, 3, -4, 5, -1], L),
    write(L).

task5 :-
    bubble_sort([5, 2, 3, 1, 7, 4, 6, 8], L),
    write(L).

task6 :- 
    append([1, 2, 3, 4], [3, 4, 5, 6], L1),
    set(L1, L2),
    write(L2).

task7 :- 
    reverse([1, 2, 3, 4, 5], S),
    write(S).

task8 :-
    accord(['Zero', 'One', 'Two', 'Three', 'Four',  
        'Five', 'Six', 'Seven', 'Eight', 'Nine'],
        [6, 1, 2, 4, 0, 8, 9], L),
    write(L).

task9 :-
    div([1, 2, 3, 4, 5, 6, 7, 8, 9], L1, L2),
    write(L1), write(" "), write(L2).

task10 :-
    intersection([1, 2, 3, 4, 5], [1, 3, 5, 7, 9], L),
    write(L).

task11 :-
    complement([1, 2, 3, 4, 5], [4, 5, 6, 7, 8], L),
    write(L).

task12 :-
    list_prod([1, 2, 3, 4], [5, 6, 7, 8], L),
    write(L).

/*************************************/

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