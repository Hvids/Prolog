
:-op(100,xfx,&).
:-op(50,xfx,=>).


world(lives,Res):-Res = lives(z).
world(woman,Res):-Res = woman(x).
world(man,Res):-Res = man(x).
world(loves,Res):-Res = loves(x).


after_that(woman,[],Res):-Res=woman(y).

after_that(woman,[],Res):-Res=man(y).

after_that(woman,[],Res):-Res=loves(y).

after_that(woman,[],Res):-Res=lives(y).



after_that(woman,[H|Teil],Res):-
  after_that(H,Teil,TREs),
  Res = woman(y)&TREs.

after_that(man,[H|Teil],Res):-
  after_that(H,Teil,TREs),
  Res = man(y)&TREs.

after_that(loves,[H|Teil],Res):-
  after_that(H,Teil,TREs),
  Res = loves(y)&TREs.

after_that(lives,[H|Teil],Res):-
  after_that(H,Teil,TREs),
  Res = lives(y)&TREs.

after_that(loves,[H|Teil],Res):-
  after_that(H,Teil,TREs),
  Res = loves(x,y)&TREs.
after_that(a,[H|Teil],Res):-
  after_that(H,Teil,TREs),
  Res = TREs.

before_that(man,[H|Teil],Res):-
  before_that(H,Teil,TREs),
  Res = man(x)&TREs.

  before_that(women,[H|Teil],Res):-
    before_that(H,Teil,TREs),
    Res = women(x)&TREs.

  before_that(loves,[H|Teil],Res):-
    before_that(H,Teil,TREs),
    Res = loves(x)&TREs.

  before_that(a,[H|Teil],Res):-
    before_that(H,Teil,TREs),
    Res = TREs.

before_that(that,[H1,H2|Teil],Res):-
  after_that(H2,Teil,TREs1),
  world(H1,TREs2),
  Res =TREs2 => exist(y,TREs1).



world(every,[H|Teil],Res):-
  before_that(H,Teil,TREs),
  Res = all(x,TREs).

world(that,[H|Teil],Res):-
  Res = all(x).




test([H|Teil],Res):-world(H,Teil,Res).




/*
test_product(Ans):- P=teil(), Ans is P + '&'./*append(Res, ['&'], Start), append(Start,[P],Ans), write_it(Ans).

write_it([]):-!.
write_it([Head|Tail]):- write(Head), write(' '), write_it(Tail).
*/
