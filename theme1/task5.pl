родитель("Михаил", "Алексей").
родитель("Евдокия", "Алексей").
родитель("Алексей", "Феодор").
родитель("Алексей", "Софья").
родитель("Алексей", "Иоанн").
родитель("Мария", "Феодор").
родитель("Мария", "Софья").
родитель("Мария", "Иоанн").
родитель("Алексей", "Петр").
родитель("Наталья", "Петр").
родитель("Петр", "Анна").
родитель("Петр", "Елизавета").
родитель("Екатерина", "Анна").
родитель("Екатерина", "Елизавета").

женщина("Евдокия").
женщина("Мария").
женщина("Наталья").
женщина("Елизавета").
женщина("Екатерина").
женщина("Анна").
женщина("Софья").

мужчина("Михаил").
мужчина("Алексей").
мужчина("Петр").
мужчина("Феодор").
мужчина("Иоанн").

бабушка(Х, Е) :-
  женщина(Х), родитель(Х, У), родитель(У, Е).

внук(Х, У) :-
  мужчина(Х), родитель(У, Е), родитель(Е, Х).

брат(Х, Т) :-
  мужчина(Х), родитель(У, Х), родитель(У, Т).

сестра(Х, Т) :-
  женщина(Х), родитель(У, Х), родитель(У, Т).

main :- 
  write("Бабушки: "), findall(Х0, бабушка(Х0, _), С0), writeln(С0),
  write("Внуки Евдокии: "), setof(Х1, внук(Х1, "Евдокия"), С1), writeln(С1),
  write("Брат Иоанна: "), setof(Х2, брат(Х2, "Иоанн"), С2), writeln(С2),
  write("Сестра Феодора: "), setof(Х3, сестра(Х3, "Феодор"), С3), writeln(С3).
