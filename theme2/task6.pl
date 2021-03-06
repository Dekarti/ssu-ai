слово(игра, game).
слово(страна, country).
слово(город, city).
слово(город, town).

словарь :-
  слово(Х, У), writeln([Х, У]), fail.

перевод_рус(Х) :-
  слово(Х, У), writeln(У), fail.

перевод_англ(У) :-
  слово(Х, У), writeln(Х), fail.

main :-
  writeln("Словарь: "), словарь; nl,
  writeln("Перевод слова город: "), перевод_рус(город); nl,
  writeln("Перевод слова game: "), перевод_англ(game).
