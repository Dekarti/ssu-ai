# S = 2(X^2 + Y^2)/(X + Y)
expr(X, Y) :-
  X + Y =\= 0, S is 2 * (X*X + Y*Y) / (X + Y), write(S);
  write("Error: /0").
