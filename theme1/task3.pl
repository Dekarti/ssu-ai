любит("Таня", яблоки).
любит("Сергей", бананы).
любит("Андрей", яблоки).
любит("Света", карамель).
любит("Вова", карамель).
любит("Таня", халва).
любит("Света", апельсины).
любит("Вова", бананы).

фрукты(яблоки).
фрукты(бананы).
фрукты(апельсины).
сладкое(карамель). 
сладкое(халва).

любит_фрукты(Х) :-
  любит(Х, Т), фрукты(Т).

любит_сладкое(Х) :-
  любит(Х, Т), сладкое(Т).

любит_вкусное(Х) :-
  любит_фрукты(Х), любит_сладкое(Х).

main :-
  write("Любят фрукты: "), findall(Х0, любит_фрукты(Х0), С0), writeln(С0),
  write("Любят сладкое: "), findall(Х1, любит_сладкое(Х1), С1), writeln(С1),
  write("Любят вкусное: "), findall(Х2, любит_вкусное(Х2), С2), writeln(С2).