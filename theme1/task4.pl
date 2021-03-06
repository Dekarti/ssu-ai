увлекается("Катя", теннис).
увлекается("Виктор", теннис).
увлекается("Виктор", хоккей).
увлекается("Андрей", хоккей).
увлекается("Олег", хоккей).
увлекается("Ольга", теннис).
увлекается("Катя", шахматы).
увлекается("Олег", шахматы).
женщина("Катя").
женщина("Ольга").
мужчина("Виктор").
мужчина("Андрей").
мужчина("Олег").

шахматы_жен(Х) :-
  увлекается(Х, шахматы), женщина(Х).

хоккей_муж(Х) :-
  увлекается(Х, хоккей), мужчина(Х).

теннис_пара(Х, У) :-
  увлекается(Х, теннис), мужчина(Х),
  увлекается(У, теннис), женщина(У).

main :-
  write("Женщины-шахматистки: "), findall(Х0, шахматы_жен(Х0), С0), writeln(С0),
  write("Мужчины-хоккеисты: "), findall(Х1, хоккей_муж(Х1), С1), writeln(С1),
  write("Пары теннисистов: "), findall([Х2, У2], теннис_пара(Х2, У2), С2), writeln(С2).