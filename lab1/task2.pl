% Task 2: Relational Data

% The line below imports the data
:- ['two.pl'].




%Средний бал за предмет.
grade_point_average(X,Grade):-
  findall(Y,grade(C,Z,X,Y),Mark_set),
  count_mark(Mark_set,Sum),
  result_grage(Mark_set,Sum,Grade).

count_mark([],0).
count_mark([X|T],N):-
  count_mark(T,N1),
  N is N1+X.

result_grage(Mark_set,Sum,Grade):-
  length(Mark_set,SizeList),
  Grade is Sum/SizeList.

%количксвто не сдавших студентов для группы.
did_not_enter_group(Group,Count):-
  findall(Y,grade(Group,_,_,Y),Mark_set),
  count_mark_two(Mark_set,Count).

equal(X,Y):-X=Y.

count_mark_two([],0).
count_mark_two([X|T],N):-
  equal(X,2),
  count_mark_two(T,N1),
  N is N1+1,!.
count_mark_two([X|T],N):-
  count_mark_two(T,N).

%Количеств студентов не сдавших для каждого из предметов.

did_not_enter_subject(Subject,Count):-
  findall(Y,grade(_,_,Subject,Y),Mark_set),
  count_mark_two(Mark_set,Count).

%Основная часть задания
%Поиск для каждого предмета средней оценки.
every_group_grade():-
    setof(Z,X^Y^C^grade(X,Y,Z,C),Subject_list),
    group_grade(Subject_list).

group_grade([]).
group_grade([Subject|T]):-
  write("Средняя оценка по "),
  write(Subject),
  grade_point_average(Subject,Grade),
  write(' '),
  write(Grade),
  nl,
  group_grade(T).

%Для каждой группы колчесво не сдавших студентов.

every_student_fail():-
  setof(X,Y^Z^C^grade(X,Y,Z,C),Group_list),
  student_fail(Group_list).

student_fail([]).
student_fail([Group|T]):-
  write("Количество не сдавших студентов в группе "),
  write(Group),
  write(' '),
  did_not_enter_group(Group,Count),
  write(Count),
  nl,
  student_fail(T).

%Количество не сдавших студентов для каждого из предметов

every_subject_fail():-
  setof(Z,X^Y^Y^C^grade(X,Y,Z,C),Subject_list),
  subject_fail(Subject_list).

subject_fail([]).
subject_fail([Subject|T]):-
  write("Количество не сдавших студентов студендов для предмета "),
  write(Subject),
  write(' '),
  did_not_enter_subject(Subject,Count),
  write(Count),
  nl,
  subject_fail(T).
