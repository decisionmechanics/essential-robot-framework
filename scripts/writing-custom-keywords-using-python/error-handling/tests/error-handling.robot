*** Settings ***
Documentation       Test suite

Library             ../libraries/error-handling.py


*** Test Cases ***
Do Stuff And Catch Exception
    [Documentation]    Do stuff and catch exception
    TRY
        Do Stuff
    EXCEPT    RobotFrameworkLibraryException*    type=GLOB    AS    ${error}
        Log    ${error}
    END

Do Stuff
    [Documentation]    Do stuff (throws an exception)
    Do Stuff
