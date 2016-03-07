max(A, B, C) :-
  A >= B, A >= C, write(A);
  B >= A, B >= C, write(B);
  write(C).
