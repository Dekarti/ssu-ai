телефон(таня, 324990).
телефон(петя, 322900).
телефон(игорь, 624594).
телефон(ваня, 322999).

справочник :-
  телефон(Х, У), writeln([Х, У]), fail.

имя(Х) :-
  телефон(У, Х), write(У), fail.

номер(Х) :-
  телефон(Х, У), write(У), fail.

main :-
  writeln("Справочник: "), справочник; nl,
  write("Имя 322900: "), имя(322900); nl,
  write("Телефон Игоря: "), номер(игорь).
