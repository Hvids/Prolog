append([],B,B).
append([H|T1],B,[H|T2]):-append(T1,B,T2).


%Престановка  шариков
move(A,B):-append(S,['_','w'|T],A),append(S,['w','_'|T],B).
move(A,B):-append(S,['b','_'|T],A),append(S,['_','b'|T],B).
move(A,B):-append(S,['_','b','w'|T],A),append(S,['w','b','_'|T],B).
move(A,B):-append(S,['b','w','_'|T],A),append(S,['_','w','b'|T],B).

prolong([Temp|T],[N,Temp|T]):-
  move(Temp,N),
  not(member(N,[Temp|T])).

write_way([_]):-!.
write_way([B|T]):-
  write_way(T),nl,write(B).


%Реализация поиска в ширину


width_search(Start,Finish):-
   get_time(TimeStart),
   width([[Start]],Finish,Way),
   get_time(TimeEnd),
   Time is TimeEnd - TimeStart,
   write('Время: '),
   write(Time),
   write_way(Way).


%Поиск
width([[Finish|T]|_],Finish,[Finish|T]).

width([TempWay|OtherWays],Finish,Way):-
  findall(W,prolong(TempWay,W),Ways),
  append(OtherWays,Ways,NewWays),
  width(NewWays,Finish,Way).



%Реализация поиска в глубину


depth_search(Start,Finish):-
  get_time(TimeStart),
  depth([Start],Finish,Way),
  get_time(TimeEnd),
  Time is TimeEnd - TimeStart,
  write('Время: '),
  write(Time),
  write_way(Way).

%Поиск
depth([Finish|Tail],Finish,[Finish|Tail]).

depth(TempWay,Finish,Way):-
  prolong(TempWay,NewWay),
  depth(NewWay,Finish,Way).



%Итерационный поиск


create_number(1).
create_number(N):-create_number(M),N is M+1.

iter_search(Start,Finish):-
  get_time(TimeStart),
  create_number(Level),
  (Level>100,!;iter([Start],Finish,Way,Level), get_time(TimeEnd), Time is TimeEnd - TimeStart, write('Время: '), write(Time), write_way(Way)).

%Поиск
iter([Finish|Tail],Finish,[Finish|Tail],0).

iter(TempWay,Finish,Way,N):-N>0,
  prolong(TempWay,NewWay),N1 is N-1,
  iter(NewWay,Finish,Way,N1).
