# Y = (X^2 + 1) / (X - 2)
expr(X) :-
  X =\= 2, Y is (X * X + 1)/(X - 2), write(Y);
  write("Error: /0").
 
