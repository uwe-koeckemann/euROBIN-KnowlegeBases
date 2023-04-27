:- multifile scenario/1.
:- multifile sequence/2.
:- multifile switch/3.
:- multifile option/2.
:- multifile objectType/2.
:- multifile actionInstance/3.
:- multifile forEach/3.                 

member(Element, [Element|_]).
member(Element, [_|Tail]) :- member(Element, Tail).


task(T) :- sequence(T, _).
task(T) :- actionInstance(T, _, _).
task(T) :- option(T, _).
task(T) :- doIf(T, _, _).
task(T) :- doUntil(T, _, _).
task(T) :- forEach(T, _, _).

subTaskOf(S, T) :-
    sequence(T, Seq), member(S, Seq). 
subTaskOf(S, T) :-
    option(T, Seq), member(S, Seq). 
subTaskOf(S, T) :-
    doIf(T, Seq), member(S, Seq). 
subTaskOf(S, T) :-
    doUntil(T, Seq), member(S, Seq). 
subTaskOf(S, T) :-
    forEach(T, _, Seq), member(S, Seq).
