�������(���������).
�������(�����).
�������(������).

����_�����(������).
����_�����(�������).
����_�����(�����).

������������(X, Y) :- �������(X), ����_�����(Y),
    (X = �����, not(Y = �����);
     X = ������, not(Y = ������);
     X = ���������, not(Y = �������), not(Y = ������)).

�������(X1, Y1, X2, Y2, X3, Y3) :-
    ������������(X1, Y1),
    ������������(X2, Y2),
    ������������(X3, Y3),
    Y1 \= Y2, Y2 \= Y3, Y1 \= Y3,
    X1 \= X2, X2 \= X3, X1 \= X3.