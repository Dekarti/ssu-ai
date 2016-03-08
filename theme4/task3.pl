hanoi(_, _, _, 0) :- !.
hanoi1([Bottom|Tail], B, A, N) :-
  N1 is N - 1,
  append(Tail, B, B1),
  hanoi1([Bottom], B1, A, N1),
  write([Bottom]), write(" "), write(B), write(" "), writeln(A),
  append(A, [Bottom], L), 
  hanoi([], [Tail], L, N1).

hanoi([], [Bottom|Tail], A, N) :-
  N1 is N - 1,
  hanoi(Tail, [Bottom], A, N1),
  write(Tail), write(" "), write([Bottom]), write(" "), writeln(A),
  append(A, [Bottom], L),
  hanoi(Tail, [], L, N1).
  
