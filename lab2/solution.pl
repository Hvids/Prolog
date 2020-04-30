% Place your solution here

:-dynamic rating/2

player('Пешкин').
player('Ладейников').
player('Королев').
player('Слонов').

place('I').
place('II').
place('III').
place('IV').


place_value('I',1).
place_value('II',2).
place_value('III',3).
place_value('IV',4).


equal(X,Y):-
  X=Y.

notequal(X,Y):-
  X/=Y.

more(X,Y):-
  X>Y.

fact1('Пешкин','Ладейников',P,L):-
  findall(X,place(X),List),
  member(P,List),
  fact_place(P,L,Q,W),
  equal(L,'IV'),
  not(equal(P,'I')).

fact3('Пешкин','Слонов',P,S):-
  findall(X,place(X),List),
  member(P,List),member(S,List),
  place_value(P,ValP),place_value(S,ValS),
  more(ValS,ValP).

fact2('Королев','Слонов',K,S):-
  equal(K,'III'),equal(S,'IV').


fact1('Пешкин','Ладейников',P,L):-
  equal(L,'I'),equal(P,'III').


fact2('Королев','Слонов',K,S):-
  equal(K,'II'),equal(S,'IV').

fact2('Королев','Слонов',K,S):-
  not(equal(S,'II')),not(equal(L,II)).

fact_place(X,Y,Z,T):-
  findall(M,place(M),List),
  member(X,List),member(Y,List),member(Z,List),member(T,List),
  not(equal(X,Y)),not(equal(X,Z)),not(equal(X,T)),
  not(equal(Z,Y)),not(equal(T,Y)),
  not(equal(T,Z)).


table_a_game(A,B,C,D,P,L,K,S):-
  fact1(A,B,P,L),fact2(C,D,K,S),fact3(A,D,P,S),fact_place(P,L,K,S).

add_bd(A,B,C,D,P,L,K,S):-
  assertz(rating(A,P)),assertz(rating(B,L)),assertz(rating(C,K)),assertz(rating(D,S)).


  print_place_with_player(Place):-
    rating(Player,Place),
    write(Place),write(' - '),write(Player),nl.


result():-
  table_a_game(A,B,C,D,P,L,K,S),
  add_bd(A,B,C,D,P,L,K,S),
  print_place_with_player('I'),
  print_place_with_player('II'),
  print_place_with_player('III'),
  print_place_with_player('IV'),!.
