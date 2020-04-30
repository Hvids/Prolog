%Длина списка

length([],0).
length([X|T],N):-length(T,N1),N is N1+1.

%Отношение принадлежности
member(E,[E|R]):-!.
member(E,[H|R]):-member(E,R).

%Конкатенация списков
append([],L,L).
append([X|Tail1],L2,[X|Result]):-append(Tail1,L2,Result).



%Удаление из первого списка элементы второго

remove([],_,[]).
remove([X|Tail],L2,Result):-member(X,L2),!,remove(Tail,L2,Result).
remove([X|Tail],L2,[X|Result]):-remove(Tail,L2,Result).

%Проверка является ли первый список подсписком второго.

sublist([],_).
sublist([X|Tail1],[X|Tail2]):-sublist(Tail1,Tail2).
sublist([X|Tail1],[Y|Tail2]):-sublist(X|Tail1,Tail2).

%Перестановки

takeout(X, [X|Tail],Tail).
takeout(X,[F|Tail1],[F|Tail2]):-takeout(X,Tail1,Tail2).

permute([X|Tail1],Z):-permute(Tail1,W), takeout(X,Z,W).
permute([],[]).

%Удаление последних N элементов списка

delete_N_item(_,N,[]):-N=:=0.
delete_N_item([X|Tail1],N,[X|Tail2]):-
  N1 is N-1,
  delete_N_item(Tail1,N1,Tail2).

%Вычисление позиции максимального элемента в списке


equal(X,Y):-X is Y.
equal(Y,X):-X is Y.
more(N,X):-N>=X.

max_list_item([],N).
max_list_item([X|Tail],N):-more(N,X),(N1 is N),max_list_item(Tail,N1).


max_item_in_list([X|Tail],Item):-member(Item,[X|Tail]),max_list_item([X|Tail],Item).

%Поиск индекса максимального элемента
index_max_item([X|T],1):-(X=Item),max_item_in_list([X|T],Item),!.
index_max_item([X|T],N):-index_max_item(T,N1),N is N1+1.

%Пример содержаетльно примера
%Проверка является ли максимальный элемент последним

last_item_max(X):-length(X,N),max_item_in_list(X,N).



%Вычисление номера максимального элемента.

%number_max_item([X|Tail],N):-max_list_item(X|Tail],Item),Item=:=N.
