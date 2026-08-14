% Student Mentor Program

% 1. Relations
student(harshini, 3).
student(riya, 2).
student(parth, 3).
student(sushrut, 1).
student(omkar, 2).

knows(harshini, maths).
knows(harshini, java).
knows(riya, maths).
knows(riya, dbms).
knows(parth, java).
knows(parth, networks).
knows(sushrut, dbms).
knows(omkar, networks).
knows(omkar, maths).

needs(harshini, networks).
needs(riya, java).
needs(parth, dbms).
needs(sushrut, maths).
needs(omkar, java).

free_on(harshini, monday).
free_on(harshini, friday).
free_on(riya, wednesday).
free_on(parth, monday).
free_on(parth, saturday).
free_on(sushrut, friday).
free_on(omkar, wednesday).

mode(harshini, online).
mode(riya, offline).
mode(parth, online).
mode(sushrut, offline).
mode(omkar, online).


% 2. Define the relations

mentor(X, Y) :-
    knows(X, Subject),
    needs(Y, Subject),
    X \= Y.

session(X, Y, Day) :-
    mentor(X, Y),
    free_on(X, Day),
    free_on(Y, Day).

study_together(X, Y) :-
    mentor(X, Y),
    mentor(Y, X),
    X \= Y.

same_mode(X, Y) :-
    mode(X, M),
    mode(Y, M),
    X \= Y.

good_match(X, Y, Day) :-
    mentor(X, Y),
    free_on(X, Day),
    free_on(Y, Day),
    same_mode(X, Y).


% 3. Queries

% ?- mentor(X, sushrut).
% ?- mentor(X, riya).
% ?- session(X, sushrut, Day).
% ?- study_together(X, Y).
% ?- same_mode(X, Y).
% ?- good_match(X, Y, Day).