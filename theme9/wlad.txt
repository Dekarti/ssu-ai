it_is("operational") :- 
    true_("is", "operational").
it_is("functional") :- 
    not(it_is("procedural")),
    true_("is", "functional").
it_is("procedural") :- 
    it_is("operational"),
    true_("is", "procedural").
it_is("non_procedural") :- 
    it_is("operational"),
    not(it_is("procedural")).
it_is("low_level") :-
    it_is("operational"),
    true_("is", "low-level").
it_is("high_level") :-
    it_is("operational"),
    not(it_is("low_level")).
it_is("procedure_oriented") :-
    it_is("high_level"),
    true_("is", "procedure-oriented").
it_is("machine_oriented") :-
    it_is("high_level"),
    true_("is", "machine-oriented").
it_is("over_universal") :-
    it_is("high_level"),
    true_("is", "over-universal").
it_is("problem_oriented") :-
    it_is("high_level"),
    true_("is", "problem-oriented").
it_is("object_oriented") :-
    it_is("high_level"),
    true_("is", "object-oriented").

lang_is("Lisp") :-  
    it_is("functional").
lang_is("Assembly") :-
    it_is("low_level").
lang_is("Smalltalk") :-
    it_is("non_procedural").
lang_is("C") :-
    it_is("machine_oriented").
lang_is("Pascal") :-
    it_is("procedure_oriented").
lang_is("Ada") :-
    it_is("over_universal").
lang_is("GPSS") :-
    it_is("problem_oriented").
lang_is("Java") :-
    it_is("object_oriented").

true_(X, Y) :- xtrue_(X, Y), !.
true_(X, Y) :- not(xfalse_(X, Y)), ask(X, Y, Reply), Reply=yes.

false_(X, Y) :- xfalse_(X, Y), !.
false_(X, Y) :- not(xtrue_(X, Y)), ask(X, Y, Reply), Reply=no.

ask(X, Y, Reply) :- read(Reply, X + " " + Y + "?\n"), remember(X, Y, Reply).

remember(X, Y, yes) :- assert(xtrue_(X, Y)).
remember(X, Y, no) :- assert(xfalse_(X, Y)).

main :- 
    lang_is(X),
    write("\n Observed language is "), write(X), write("\n"), 
    clear_facts.
main :- 
    write("\n Unfortunately, knowledge base it isn't enough "), 
    clear_facts.

?- main.