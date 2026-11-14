% Username and password dataset
user(sara, 1234).
user(admin, 5678).
user(student, 9876).

% Start login with three attempts
login :-
    check_login(3).

% Check login details
check_login(Attempts) :-
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (   user(Username, Password)
    ->  write('Login Successful'), nl
    ;   write('Login Unsuccessful'), nl,
        Remaining is Attempts - 1,
        (   Remaining > 0
        ->  check_login(Remaining)
        ;   write('Sorry, you exceeded the maximum number of attempts, try again later.'),
            nl
        )
    ).
