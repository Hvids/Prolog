mother("Ljudmila Gushhina", "Danila Ivanov").
father("Vladimir Ivanov", "Danila Ivanov").
mother("Marija Kan'shina", "Elena Gushhina").
father("Viktor Gushhin", "Elena Gushhina").
mother("Marija Kan'shina", "Ljudmila Gushhina").
father("Viktor Gushhin", "Ljudmila Gushhina").
mother("Marija Kan'shina", "Andrej Gushhina").
father("Viktor Gushhin", "Andrej Gushhina").
mother("Marija Kan'shina", "Vladimir Gushhin").
father("Viktor Gushhin", "Vladimir Gushhin").
mother("Irina Brezhneva", "Nikolaj Ivanov").
father("Mihail Ivanov", "Nikolaj Ivanov").
mother("Irina Brezhneva", "Galina Ivanova").
father("Mihail Ivanov", "Galina Ivanova").
mother("Irina Brezhneva", "Vladimir Ivanov").
father("Mihail Ivanov", "Vladimir Ivanov").
mother("Irina Brezhneva", "Sergej Ivanov").
father("Mihail Ivanov", "Sergej Ivanov").
mother("Elena Gushhina", "Irina Egorova").
father("Vladimir Egorov", "Irina Egorova").
mother("Elena Gushhina", "Marija Egorova").
father("Vladimir Egorov", "Marija Egorova").
mother("Elena Gushhina", "Ol'ga Egorova").
father("Vladimir Egorov", "Ol'ga Egorova").
mother("Elena Voropaeva", "JUlija Gushhina").
father("Vladimir Gushhin", "JUlija Gushhina").
mother("Svetlana Kuznecova", "Ul'jana Gushhina").
father("Andrej Gushhina", "Ul'jana Gushhina").
mother("Al'fija Gajfulina", "Stanislav Ivanov").
father("Sergej Ivanov", "Stanislav Ivanov").
mother("Al'fija Gajfulina", "Svjatoslav Ivanov").
father("Sergej Ivanov", "Svjatoslav Ivanov").
mother("Galina Ivanova", "Aleksandr Astashev").
father("Aleksandr Astashev", "Aleksandr Astashev").
mother("Galina Ivanova", "Dmitrij Astashev").
father("Aleksandr Astashev", "Dmitrij Astashev").
mother("Al'fija Gajfulina", "JUlija Grineva").
father("Viktor Grineva", "JUlija Grineva").
mother("Ol'ga Egorova", "Il'ja Volhonskij").
father("Aleksandr Volhonskij", "Il'ja Volhonskij").
mother("Irina Egorova", "Makar Frolov").
father("Viktor Frolov", "Makar Frolov").
mother("Ekaterina Kijko", "Ljudmila Ivanova").
father("Nikolaj Ivanov", "Ljudmila Ivanova").
mother("Ekaterina Kijko", "Tat'jana Ivanova").
father("Nikolaj Ivanov", "Tat'jana Ivanova").
mother("Ljudmila Ivanova", "Tat'jana Nazarova").
father("Vladimir Nazarov", "Tat'jana Nazarova").
mother("Ljudmila Ivanova", "Il'ja Nazarov").
father("Vladimir Nazarov", "Il'ja Nazarov").
mother("Ljudmila Ivanova", "Viktorija Nazarova").
father("Vladimir Nazarov", "Viktorija Nazarova").
mother("Tat'jana Ivanova", "Svetlana Hajrulina").
father("Ruslan Hajrulin", "Svetlana Hajrulina").
mother("Tat'jana Ivanova", "Sergej Hajrulin").
father("Ruslan Hajrulin", "Sergej Hajrulin").
mother("Ul'jana Eremova", "Marija Kan'shina").
father("Gerasim Kan'shin", "Marija Kan'shina").
mother("Ul'jana Eremova", "Antonina Gushhina").
father("Gerasim Kan'shin", "Antonina Gushhina").
male("Danila Ivanov").
female("Ljudmila Gushhina").
male("Vladimir Ivanov").
female("Marija Kan'shina").
male("Viktor Gushhin").
male("Mihail Ivanov").
female("Irina Brezhneva").
male("Vladimir Gushhin").
male("Andrej Gushhina").
female("Elena Gushhina").
male("Sergej Ivanov").
female("Galina Ivanova").
female("Marija Egorova").
male(" ").
male("Vladimir Egorov").
female("Ol'ga Egorova").
female("Irina Egorova").
male("Vladimir Egorov").
female("Elena Voropaeva").
female("Svetlana Kuznecova").
female("Al'fija Gajfulina").
female("Ul'jana Gushhina").
female("JUlija Gushhina").
male("Aleksandr Astashev").
male("Aleksandr Astashev").
male("Dmitrij Astashev").
male("Stanislav Ivanov").
male("Svjatoslav Ivanov").
female("JUlija Grineva").
male("Viktor Grineva").
male("Il'ja Volhonskij").
male("Aleksandr Volhonskij").
male("Makar Frolov").
male("Viktor Frolov").
male("Nikolaj Ivanov").
female("Ekaterina Kijko").
female("Tat'jana Ivanova").
female("Ljudmila Ivanova").
female("Tat'jana Nazarova").
male("Vladimir Nazarov").
male("Il'ja Nazarov").
female("Viktorija Nazarova").
male("Aleksandr Krylov").
male("Ruslan Hajrulin").
female("Svetlana Hajrulina").
male("Sergej Hajrulin").
male("Gerasim Kan'shin").
female("Ul'jana Eremova").
female("Antonina Gushhina").
male("Andrej Eremenko").
female("Galina Eremenko").

%Здание 3: определяем родственную связь свекровь.

svecrov(Y,X):-
	mother(X,T),
	father(M,T),
	mother(Y,M).

	sibling(Person, Sibling):-
			((father(F,Person),father(F,Sibling));(mother(M,Sibling),mother(M,Person))),
			Person \= Sibling.



%Определяем  степень родства двух произвольных индивидуумов в дереве
relative_thread(X, Y, Res):- % цепочка людей, через которых связаны 2 человека
    search_bdth(X, Y, Res).

ask_relative(X, Y, Res):- % цепочка родства, через которую связаны 2 человека
    check_relation(Res), !,
    check_link(Res, X, Y).

relative(X, Y, Res):-
    search_bdth(X, Y, Res1), !,
    transform(Res1, Res).

transform([_],[]):-!. % переделевает цепочку родственников в цепочку родства
transform([First,Second|Tail],ResList):-

    check_link(Relation,First,Second),
    ResList = [Relation|Tmp],
    transform([Second|Tail],Tmp),!.

prolong([X|T],[Y,X|T]):-
    move(X,Y),
    not(member(Y,[X|T])).

move(X,Y):-
    check_link(_,X,Y).

search_bdth(X,Y,P):-
    bdth([[X]],Y,L),
    reverse(L,P).

bdth([[X|T]|_],X,[X|T]).
bdth([P|QI],X,R):-
    findall(Z,prolong(P,Z),T),
    append(QI,T,Q0),
    bdth(Q0,X,R),!.

bdth([_|T],Y,L):-
    bdth(T,Y,L).


check_link(husband, Husband, Wife):-
    father(Husband,Child),
    mother(Wife,Child).

check_link(wife, Wife, Husband):-
	father(Husband,Child),
	mother(Wife,Child).

check_link(brother, Brother, Y):-
    sibling(Brother, Y),
    male(Brother).

check_link(sister, Sister, Y):-
    sibling(Sister, Y),
    female(Sister).

check_link(father, Father, Child):-
    father(Father,Child).
check_link(mother, Mother, Child):-
    mother(Mother,Child).

check_link(parent, Parent, Child):-
     (mother(Parent,Child);father(Parent,Child)).

check_link(son, Child, Parent):-
    (mother(Parent,Child);father(Parent,Child)),
    male(Child).

check_link(daughter, Child, Parent):-
   (mother(Parent,Child);father(Parent,Child)),
    female(Child).

check_link(child, Child, Parent):-
    (mother(Parent,Child);father(Parent,Child)).

check_relation(X):-
    member(X, [father, mother, sister, brother, son, daughter, husband, wife]).


%Вопросы относительно степени родства
/*          Вопросы, относительно степени родства          */

question_word(X):-
    member(X, [how, who, "How", "Who"]).

quantity(X):-
    member(X, [much, many]).

purals(X):-
    member(X, [sisters, brothers, sons, daughters]).
pural(sister, sisters).
pural(brother, brothers).
pural(son, sons).
pural(daughter, daughters).

help_word(X):-
    member(X, [do, does]).

have_has(X):-
    member(X, [have, has]).

is(X):-
    member(X,[is]).

particle(X):-
    member(X, ["'s"]).

question_mark(X):-
    member(X, ['?']).

his_her(X):-
    member(X, [his, her, he, she]).

%how many brothers does *name* have ?
ask_question(List):-
    List = [A,B,C,D,E,F,H],
    question_word(A),
    quantity(B),
    purals(C),
    help_word(D),
    (male(E);female(E)),
    nb_setval(lastName,E),
    have_has(F),
    question_mark(H),

    pural(C1,C),
    setof(X,ask_relative(X,E,C1),T),
    length(T,Res),!,
    write(E),
    write(" have "),
    ((Res =:= 1,write(Res),write(" "),write( C1));(\+(Res =:= 1),write(Res),write(" "),write( C))),!.

%how many brothers does he have ?
ask_question(List):-
    List = [A,B,C1,D,E1,F,H],
    question_word(A),
    quantity(B),
    purals(C1),
    help_word(D),
    his_her(E1),
    nb_getval(lastName,E),
    have_has(F),
    question_mark(H),

    pural(C,C1),
    setof(X,ask_relative(X,E,C),T),
    length(T,Res),
    write(E),
    write(" have "),
    ((Res =:= 1,write(Res),write(" "),write(C));(\+(Res =:= 1),write(Res),write(" "),write(C1))),!.

% who is *name* brother?
ask_question(List):-
    List = [A,B,C,D,E,F],
    question_word(A),
    is(B),
    (male(C);female(C)),
    nb_setval(lastName,C),
    particle(D),
    check_relation(E),
    question_mark(F), !,
    check_link(E,Res,C),
    write(Res),write(" is "), write(C),write("'s "),write(E).

% who is her brother
ask_question(List):-
    List = [A,B,C1,D,E],
    question_word(A),
    is(B),
    his_her(C1),
    nb_getval(lastName,C),
    check_relation(D),
    question_mark(E),!,
    check_link(D,Res,C),
    write(Res),write(" is "), write(C),write("'s "),write(D).

% is *name* *name* s son?
ask_question(List):-
    List = [A,B,C,D,E,F],
    nb_setval(lastName,C),
    is(A),
    (male(B);female(B)),
    (male(C);female(C)),
    particle(D),
    check_relation(E),
    question_mark(F),
    check_link(E,B,C),
    !.

% is *name* his son?
ask_question(List):-
    List = [A,B,C1,D,E],
    is(A),
    (male(B);female(B)),
    his_her(C1),
    check_relation(D),
    question_mark(E),

    nb_getval(lastName,C),
    check_link(D,B,C),
    !.

