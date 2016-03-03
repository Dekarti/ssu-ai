encoding(utf8).

увлекается("Катя", теннис).
увлекается("Виктор", теннис).
увлекается("Виктор", хоккей).
увлекается("Андрей", хоккей).
увлекается("Олег", хоккей).
увлекается("Ольга", теннис).
увлекается("Катя", шахматы).
увлекается("Олег", шахматы).

андрей_занимается(Х) :-
  увлекается("Андрей", Х).

шахматами_увлекаются(Х) :-
  увлекается(Х, шахматы).

ольга_и_виктор_увлекаются(Х) :-
  увлекается("Ольга", Х), увлекается("Виктор", Х).

хоккеем_и_шахматами_увлекаются(Х) :-
  увлекается(Х, хоккей), увлекается(Х, шахматы).

main :- 
  write("Андрей занимается: "),
    findall(Х0, андрей_занимается(Х0), С0), writeln(С0),
  write("Шахматами увлекаются: "),
    findall(Х1, шахматами_увлекаются(Х1), С1), writeln(С1),
  write("Ольга и Виктор увлекаются: "),
    findall(Х2, ольга_и_виктор_увлекаются(Х2), С2), writeln(С2),
  write("Хоккеем и шахматами увлекаются: "),
    findall(Х3, хоккеем_и_шахматами_увлекаются(Х3), С3), writeln(С3).
