/* ESPRIT Orientation Expert System - start with ?- go. */

go :- hypothesize(Option),
      write('I think that you should choose : '),
      write(Option),
      nl,
      undo.

/* hypotheses to be tested */
hypothesize(infini) :- infini, !.
hypothesize(bi) 	:- bi, !.
hypothesize(sleam)  :- sleam, !.
hypothesize(gl)  	:- gl, !.
hypothesize(sim)    :- sim, !.
hypothesize(cloud)  :- cloud, !.
hypothesize(irt) 	:- irt, !.
hypothesize(isem) 	:- isem, !.
hypothesize(unknown).       /* no diagnosis */

/* option identification rules */
bi :-      class1.

infini :-  class1,
		   likes(finance).

sleam :-   verify(java),
           verify(networks),
           verify(software_engineering),
           verify(noum).

gl :-	   verify(java),
		   verify(software_engineering),
		   verify(uml),
           verify(web).

sim :- 	   verify(java),
		   verify(pi),
		   verify(koffa),
		   verify(j2me).

cloud :-   verify(linux_system_administration),
		   verify(networks),
		   verify(unix_user).

isem :-    verify(linux_system_administration),
		   verify(mathematics).

irt :-     verify(networks),
		   verify(mathematics).

/* classification rules */
class1	:- verify(mathematics),
			verify(probability),
			verify(statistics),
			verify(dbms).

/* how to ask questions */
ask(Question) :-
    write('Are you good in : '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

ask2(Question2) :-
    write('Do you like : '),
    write(Question2),
    write('? '),
    read(Response1),
    nl,
    ( (Response1 == yes ; Response1 == y)
      ->
       assert(yes(Question2)) ;
       assert(no(Question2)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).


likes(S1) :-
   (yes(S1) 
    ->
    true ;
    (no(S1)
     ->
     fail ;
     ask2(S1))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.