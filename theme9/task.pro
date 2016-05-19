country_is("Antigua and Barbuda") :-
 	true_("speaks", "en"),
 	true_("capital", "StJohns"),
 	true_("use", "Caribbean dollar").

country_is("The BahamasBahamas") :-
 	true_("speaks", "en"),
 	true_("capital", "Nassau"),
 	true_("use", "Bahamian dollar").

country_is("Barbados") :-
 	true_("speaks", "en"),
 	true_("capital", "Bridgetown"),
 	true_("use", "Barbadian dollar").

country_is("Belize") :-
 	true_("speaks", "en"),
 	true_("capital", "Belmopan"),
 	true_("use", "Belize dollar").

country_is("Canada") :-
 	true_("speaks", "en"), 
 	true_("speaks", "fr"),
 	true_("capital", "Ottawa"),
 	true_("use", "Canadian dollar").

country_is("Costa Rica") :-
 	true_("speaks", "es"),
 	true_("capital", "SanJose"),
 	true_("use", "CostaRican colon").

country_is("Cuba") :-
 	true_("speaks", "es"), 
 	true_("capital", "Havana"),
 	true_("use", "Cuban peso").

country_is("Dominica") :-
 	true_("speaks", "en"), 
 	true_("capital", "Roseau"),
 	true_("use", "Caribbean dollar").

country_is("Dominican Republic") :-
 	true_("speaks", "en"),
 	true_("speaks", "es"),
 	true_("capital", "SantoDomingo"),
 	true_("use", "Dominican Peso").

country_is("El Salvador") :-
 	true_("speaks", "en"), 
 	true_("speaks", "es"),
 	true_("capital", "SanSalvador"),
 	true_("use", "US dollar").

country_is("Grenada") :-
 	true_("speaks", "en"),
 	true_("capital", "StGeorge"),
 	true_("use", "Caribbean dollar").

country_is("Guatemala") :-
 	true_("speaks", "es"),
 	true_("capital", "Guatemala"),
 	true_("use", "Guatemalan quetzal").

country_is("Haiti") :-
 	true_("speaks", "fr"),
 	true_("capital", "PortauPrince"),
 	true_("use", "Haitian gourde").

country_is("Honduras") :-
 	true_("speaks", "es"),
 	true_("capital", "Tegucigalpa"),
 	true_("use", "Honduran lempira").

country_is("Jamaica") :-
 	true_("speaks", "en"),
 	true_("capital", "Kingston"),
 	true_("use", "Jamaican dollar").
 
country_is("Mexico") :-
 	true_("speaks", "es"),
 	true_("capital", "Mexico"),
 	true_("use", "Mexican Peso").

country_is("Nicaragua") :-
 	true_("speaks", "es"),
 	true_("capital", "Managua"),
 	true_("use", "Nicaraguan cordoba").

country_is("Panama") :-
 	true_("speaks", "en"),
 	true_("speaks", "es"),
 	true_("capital", "Panama"),
 	true_("use", "Panamanian balboa").

country_is("Saint Kitts and Nevis") :-
 	true_("speaks", "en"),
 	true_("capital", "Basseterre"),
 	true_("use", "Caribbean dollar").

country_is("Saint Lucia") :-
 	true_("speaks", "en"),
 	true_("capital", "Castries"),
 	true_("use", "Caribbean dollar").

country_is("Saint Vincent and the Grenadines") :-
 	true_("speaks", "en"),
 	true_("capital", "Kingstown"),
 	true_("use", "Caribbean dollar").

country_is("Trinidad and Tobago") :-
 	true_("speaks", "en"),
 	true_("capital", "Port_of_Spain"),
 	true_("use", "Trinidad_and_Tobago dollar").
 
country_is("United States") :-
 	true_("speaks", "en"),
 	true_("capital", "Washington"),
 	true_("use", "US dollar").


true_(X, Y) :- xtrue_(X, Y), !.
true_(X, Y) :- not(xfalse_(X, Y)), ask(X, Y, Reply), Reply=yes.

false_(X, Y) :- xfalse_(X, Y), !.
false_(X, Y) :- not(xtrue_(X, Y)), ask(X, Y, Reply), Reply=no.

ask(X, Y, Reply) :- read(Reply, X + " " + Y + "?\n"), remember(X, Y, Reply).

remember(X, Y, yes) :- assert(xtrue_(X, Y)).
remember(X, Y, no) :- assert(xfalse_(X, Y)).

main :- 
    country_is(X),
    write("\n Country is "), write(X), write("\n"), 
    clear_facts.
main :- 
    write("\n Unfortunately, knowledge base it isn't enough "), 
    clear_facts.

?- main.